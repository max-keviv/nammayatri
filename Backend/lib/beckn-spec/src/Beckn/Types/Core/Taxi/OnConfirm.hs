 {-
 Copyright 2022-23, Juspay India Pvt Ltd
 
 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License 
 
 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program 
 
 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 
 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of 
 
 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Beckn.Types.Core.Taxi.OnConfirm
  ( module Beckn.Types.Core.Taxi.OnConfirm,
    module Reexport,
  )
where

import Beckn.Types.Core.Taxi.OnConfirm.BreakupItem as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.Descriptor as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.Fulfillment as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.Location as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.Order as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.Payment as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.Quote as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.StartInfo as Reexport
import Beckn.Types.Core.Taxi.OnConfirm.StopInfo as Reexport
import Data.OpenApi (ToSchema)
import EulerHS.Prelude

newtype OnConfirmMessage = OnConfirmMessage
  { order :: Order
  }
  deriving (Generic, Show, FromJSON, ToJSON, ToSchema)
