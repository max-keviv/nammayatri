 {-
 Copyright 2022-23, Juspay India Pvt Ltd
 
 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License 
 
 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program 
 
 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 
 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of 
 
 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Domain.Types.CancellationReason where

import Data.Aeson
import qualified Data.ByteString.Lazy as BSL
import qualified Data.Text as T
import Kernel.Prelude
import Servant

data CancellationStage = OnSearch | OnConfirm | OnAssign
  deriving (Show, Eq, Read, Generic, ToJSON, FromJSON, ToSchema, ToParamSchema)

instance FromHttpApiData CancellationStage where
  parseUrlPiece = parseHeader . encodeUtf8
  parseQueryParam = parseUrlPiece
  parseHeader = left T.pack . eitherDecode . BSL.fromStrict

newtype CancellationReasonCode = CancellationReasonCode Text
  deriving (Generic, Show, Eq, Read, ToJSON, FromJSON, ToSchema)

data CancellationReason = CancellationReason
  { reasonCode :: CancellationReasonCode,
    description :: Text,
    enabled :: Bool,
    onSearch :: Bool,
    onConfirm :: Bool,
    onAssign :: Bool,
    priority :: Int
  }
  deriving (Generic, Show)

data CancellationReasonAPIEntity = CancellationReasonAPIEntity
  { reasonCode :: CancellationReasonCode,
    description :: Text
  }
  deriving (Generic, Show, ToJSON, FromJSON, ToSchema)

makeCancellationReasonAPIEntity :: CancellationReason -> CancellationReasonAPIEntity
makeCancellationReasonAPIEntity CancellationReason {..} =
  CancellationReasonAPIEntity {..}
