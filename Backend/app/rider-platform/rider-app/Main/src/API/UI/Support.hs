 {-
 Copyright 2022-23, Juspay India Pvt Ltd
 
 This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License 
 
 as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program 
 
 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 
 or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of 
 
 the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module API.UI.Support
  ( API,
    handler,
    DSupport.SendIssueReq (..),
    DSupport.SendIssueRes,
  )
where

import qualified Domain.Action.UI.Support as DSupport
import Domain.Types.Person as Person
import qualified Environment as App
import EulerHS.Prelude hiding (length)
import Kernel.Types.Id
import Kernel.Utils.Common
import Servant
import Tools.Auth

-------- Support Flow----------
type API =
  "support"
    :> ( "sendIssue"
           :> TokenAuth
           :> ReqBody '[JSON] DSupport.SendIssueReq
           :> Post '[JSON] DSupport.SendIssueRes
       )

handler :: App.FlowServer API
handler = sendIssue

sendIssue :: Id Person.Person -> DSupport.SendIssueReq -> App.FlowHandler DSupport.SendIssueRes
sendIssue personId = withFlowHandlerAPI . withPersonIdLogTag personId . DSupport.sendIssue personId
