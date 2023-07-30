module MerchantConfig.DefaultConfig where

import MerchantConfig.Types

config :: AppConfig
config =
  { primaryTextColor: "#FCC32C"
  , primaryBackground: "#2C2F3A"
  , estimateConfirmText: "Request a NammaYatri Ride"
  , autoConfirmingLoaderColor: "#80B2FF"
  , quoteListModelBackground: "#2C2F3A"
  , currency: "₹"
  , isGradient: "false"
  , primaryButtonCornerRadius: 8.0
  , gradient: []
  , showPickUpandDrop: true
  , alertDialogPrimaryColor: "#2194FF"
  , cancelSearchTextColor: "#E55454"
  , showHamMenu : true
  , showQuoteFindingText : false
  , quoteListItemConfig: 
    { primaryButtonCorner: 8.0
    , expiresColor: "#E55454"
    , driverImagebg: "#F1F1F1"
    , vehicleHeight: 37
    , vehicleWidth: 40
    }
  , quoteListModel:
    { backgroundColor: "#2C2F3A"
    , textColor: "#FFFFFF"
    , loaderColor: "#80B2FF"
    , otpTextBackground : "#2C2F3A"
    , otpBackground: "#F1F1F1"
    , otpTextColor: "#FFFFFF"
    , otpTitleColor : "#6D7280"
    , selectRideTextColor: "#2C2F3A"
    , lineImage : "ic_line"
    , lottieHeight : 300
    , lottieWidth : 300
    , topMargin : 100
    , noQuotesImageHeight: 115
    , noQuotesImageWidth : 137
    , closeIcon : "ny_ic_close_white,https://assets.juspay.in/beckn/nammayatri/user/images/ny_ic_close_white.png"
    }
  , searchLocationConfig : 
    { searchLocationTheme: "#2C2F3A"
    , setLocationOnMapColor:"#6D7280"
    , strokeColor: "1,#E5E7EB"
    , enableLocationTagbar : "true"
    , resultsCardCornerRadius : 20.0
    , showRateCardDetails : true
    , lottieHeight : 96
    , lottieWidth : 96
    , primaryButtonHeight : 60
    , backArrow : "ny_ic_chevron_left_white,https://assets.juspay.in/beckn/nammayatri/user/images/ny_ic_chevron_left_white.png"
    }
  , driverInfoConfig : 
    { ratingTextColor: "#454545"
    , ratingBackground: "#F1F1F1"
    , ratingStroke: "0,#717171"
    , ratingCornerRadius: 6.0
    , callBackground: "#2053BB6F"
    , callButtonStroke: "0,#EB0055" 
    , cardStroke: "1,#E5E7EB"
    , otpStroke: "0,#717171"
    , showNumberPlatePrefix : true
    , showNumberPlateSuffix : false
    , callHeight: 24
    , callWidth: 24
    , numberPlateBackground : "#E9BE4D"
    , showCancelPrevention : false
    , showTrackingButton : true
    }
  , ratingConfig : 
    { secondaryButtonTextColor : "#2C2F3A"
    , secondaryButtonStroke : "1,#2C2F3A"
    , buttonCornerRadius : 8.0
    }
  , cancelReasonConfig : 
    { secondaryButtonTextColor : "#2C2F3A"
    , secondaryButtonStroke : "1,#2C2F3A"
    , buttonCornerRadius : 8.0
    }
  , profileBackground: "#2C2F3A"
  , profileName: "#FFFFFF"
  , profileImage: "#012A72"
  , feedbackBackground: "#2C2F3A"
  , sideBarList: [ "MyRides", "Favorites", "EmergencyContacts", "HelpAndSupport", "Language", "Separator", "ShareApp", "LiveStatsDashboard", "Logout" ]
  , rateCardColor: "#2C2F3A"
  , nyBrandingVisibility: false
  , fontType: "Assets"
  , languageList : []
  , confirmPickUpLocationBorder: "#101010"
  , bannerConfig : {
        backgroundColor : "#F0FAF0"
      , title : "Complete your profile for a personalised ride experience"
      , titleColor :"#269574"
      , actionText : "Update now"
      , actionTextColor : "#269574"
      , imageUrl : "ny_ic_banner_gender_feat,https://assets.juspay.in/beckn/merchantcommon/images/ny_ic_banner_gender_feat.png" 
      }
  , popupBackground : "#FFFFFF"
  , profileCompletion : "#FCC32C"
  , cancelRideColor : "#E55454"
  , infoIconUrl : "ny_ic_info,https://assets.juspay.in/nammayatri/images/user/ny_ic_information_grey.png"
  , profileEditGravity : "center"
  , merchantLogo : "ic_launcher,https://assets.juspay.in/nammayatri/images/user/ny_ic_launcher.png"
  , logs : ["JUSPAY", "FIREBASE"]
  , showCorporateAddress : false
  , terminateBtnConfig : {
          visibility: true, 
          title : "Paytm",
          imageUrl : "ny_ic_chevron_left_double,https://assets.juspay.in/beckn/mobilitypaytm/mobilitypaytmcommon/ny_ic_chevron_left_double.png"
      }
  , showDeleteAccount : false
  , autoSelectBackground : "#53BB6F"
  , showGenderBanner : true
  , enableMockLocation : false
  , specialLocationView : false
  }