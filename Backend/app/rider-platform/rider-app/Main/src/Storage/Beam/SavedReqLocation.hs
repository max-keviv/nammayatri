{-
  Copyright 2022-23, Juspay India Pvt Ltd

  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Storage.Beam.SavedReqLocation where

import Data.Serialize
import qualified Data.Time as Time
import qualified Database.Beam as B
import Database.Beam.MySQL ()
import EulerHS.KVConnector.Types (KVConnector (..), MeshMeta (..), primaryKey, secondaryKeys, tableName)
import GHC.Generics (Generic)
import Kernel.Prelude hiding (Generic)
import Lib.Utils ()
import Lib.UtilsTH
import Sequelize

data SavedReqLocationT f = SavedReqLocationT
  { id :: B.C f Text,
    lat :: B.C f Double,
    lon :: B.C f Double,
    street :: B.C f (Maybe Text),
    door :: B.C f (Maybe Text),
    city :: B.C f (Maybe Text),
    state :: B.C f (Maybe Text),
    country :: B.C f (Maybe Text),
    building :: B.C f (Maybe Text),
    areaCode :: B.C f (Maybe Text),
    area :: B.C f (Maybe Text),
    placeId :: B.C f (Maybe Text),
    createdAt :: B.C f Time.UTCTime,
    updatedAt :: B.C f Time.UTCTime,
    tag :: B.C f Text,
    riderId :: B.C f Text,
    ward :: B.C f (Maybe Text),
    isMoved :: B.C f (Maybe Bool)
  }
  deriving (Generic, B.Beamable)

instance B.Table SavedReqLocationT where
  data PrimaryKey SavedReqLocationT f
    = Id (B.C f Text)
    deriving (Generic, B.Beamable)
  primaryKey = Id . id

type SavedReqLocation = SavedReqLocationT Identity

savedReqLocationTMod :: SavedReqLocationT (B.FieldModification (B.TableField SavedReqLocationT))
savedReqLocationTMod =
  B.tableModification
    { id = B.fieldNamed "id",
      lat = B.fieldNamed "lat",
      lon = B.fieldNamed "lon",
      street = B.fieldNamed "street",
      door = B.fieldNamed "door",
      city = B.fieldNamed "city",
      state = B.fieldNamed "state",
      country = B.fieldNamed "country",
      building = B.fieldNamed "building",
      areaCode = B.fieldNamed "area_code",
      area = B.fieldNamed "area",
      placeId = B.fieldNamed "place_id",
      createdAt = B.fieldNamed "created_at",
      updatedAt = B.fieldNamed "updated_at",
      tag = B.fieldNamed "tag",
      riderId = B.fieldNamed "rider_id",
      ward = B.fieldNamed "ward",
      isMoved = B.fieldNamed "is_moved"
    }

$(enableKVPG ''SavedReqLocationT ['id] [['riderId]])

$(mkTableInstances ''SavedReqLocationT "saved_location" "atlas_app")