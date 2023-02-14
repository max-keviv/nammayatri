 {-
 Copyright 2022-23, Juspay India Pvt Ltd
 
 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License 
 
 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program 
 
 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 
 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of 
 
 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Beckn.ACL.Cancel (buildCancelReq, buildCancelSearchReq) where

import qualified Beckn.Types.Core.Taxi.Cancel.Req as Cancel
import qualified Domain.Action.UI.Cancel as DCancel
import qualified Domain.Types.BookingCancellationReason as SBCR
import Environment
import Kernel.Prelude
import qualified Kernel.Types.Beckn.Context as Context
import Kernel.Types.Beckn.ReqTypes
import Kernel.Utils.Common

buildCancelReq ::
  (HasFlowEnv m r ["bapSelfIds" ::: BAPs Text, "bapSelfURIs" ::: BAPs BaseUrl]) =>
  DCancel.CancelRes ->
  m (BecknReq Cancel.CancelMessage)
buildCancelReq res = do
  bapURIs <- asks (.bapSelfURIs)
  bapIDs <- asks (.bapSelfIds)
  messageId <- generateGUID
  context <- buildTaxiContext Context.CANCEL messageId Nothing bapIDs.cabs bapURIs.cabs (Just res.bppId) (Just res.bppUrl)
  pure $ BecknReq context $ mkCancelMessage res

mkCancelMessage :: DCancel.CancelRes -> Cancel.CancelMessage
mkCancelMessage res = Cancel.CancelMessage res.bppBookingId.getId "" $ castCancellatonSource res.cancellationSource
  where
    castCancellatonSource = \case
      SBCR.ByUser -> Cancel.ByUser
      SBCR.ByDriver -> Cancel.ByDriver
      SBCR.ByMerchant -> Cancel.ByMerchant
      SBCR.ByAllocator -> Cancel.ByAllocator
      SBCR.ByApplication -> Cancel.ByApplication

buildCancelSearchReq ::
  (HasFlowEnv m r ["bapSelfIds" ::: BAPs Text, "bapSelfURIs" ::: BAPs BaseUrl]) =>
  DCancel.CancelSearchRes ->
  m (BecknReq Cancel.CancelMessage)
buildCancelSearchReq res = do
  bapURIs <- asks (.bapSelfURIs)
  bapIDs <- asks (.bapSelfIds)
  let messageId = res.estimateId.getId
  context <- buildTaxiContext Context.CANCEL messageId Nothing bapIDs.cabs bapURIs.cabs (Just res.providerId) (Just res.providerUrl)
  pure $ BecknReq context $ mkCancelSearchMessage res

mkCancelSearchMessage :: DCancel.CancelSearchRes -> Cancel.CancelMessage
mkCancelSearchMessage res = Cancel.CancelMessage "" res.searchReqId.getId Cancel.ByUser
