//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



STEAMCLIENT_INTERFACE_VERSION :: "SteamClient021";

STEAMUSER_INTERFACE_VERSION :: "SteamUser023";

STEAMFRIENDS_INTERFACE_VERSION :: "SteamFriends017";

STEAMUTILS_INTERFACE_VERSION :: "SteamUtils010";

k_nMaxLobbyKeyLength :: 255;

STEAMMATCHMAKING_INTERFACE_VERSION :: "SteamMatchMaking009";

STEAMMATCHMAKINGSERVERS_INTERFACE_VERSION :: "SteamMatchMakingServers002";

STEAMGAMESEARCH_INTERFACE_VERSION :: "SteamMatchGameSearch001";

STEAMPARTIES_INTERFACE_VERSION :: "SteamParties002";

STEAMREMOTESTORAGE_INTERFACE_VERSION :: "STEAMREMOTESTORAGE_INTERFACE_VERSION016";

STEAMUSERSTATS_INTERFACE_VERSION :: "STEAMUSERSTATS_INTERFACE_VERSION012";

STEAMAPPS_INTERFACE_VERSION :: "STEAMAPPS_INTERFACE_VERSION008";

STEAMNETWORKING_INTERFACE_VERSION :: "SteamNetworking006";

INVALID_SCREENSHOT_HANDLE :: 0;

STEAMSCREENSHOTS_INTERFACE_VERSION :: "STEAMSCREENSHOTS_INTERFACE_VERSION003";

STEAMMUSIC_INTERFACE_VERSION :: "STEAMMUSIC_INTERFACE_VERSION001";

k_SteamMusicNameMaxLength :: 255;
k_SteamMusicPNGMaxLength :: 65535;

STEAMMUSICREMOTE_INTERFACE_VERSION :: "STEAMMUSICREMOTE_INTERFACE_VERSION001";

INVALID_HTTPREQUEST_HANDLE :: 0;

INVALID_HTTPCOOKIE_HANDLE :: 0;

STEAMHTTP_INTERFACE_VERSION :: "STEAMHTTP_INTERFACE_VERSION003";

STEAM_INPUT_MAX_COUNT :: 16;

STEAM_INPUT_MAX_ANALOG_ACTIONS :: 24;

STEAM_INPUT_MAX_DIGITAL_ACTIONS :: 256;

STEAM_INPUT_MAX_ORIGINS :: 8;

STEAM_INPUT_MAX_ACTIVE_LAYERS :: 16;

STEAM_INPUT_MIN_ANALOG_ACTION_DATA :: -1.0;
STEAM_INPUT_MAX_ANALOG_ACTION_DATA :: 1.0;

STEAMINPUT_INTERFACE_VERSION :: "SteamInput006";

STEAM_CONTROLLER_MAX_COUNT :: 16;

STEAM_CONTROLLER_MAX_ANALOG_ACTIONS :: 24;

STEAM_CONTROLLER_MAX_DIGITAL_ACTIONS :: 256;

STEAM_CONTROLLER_MAX_ORIGINS :: 8;

STEAM_CONTROLLER_MAX_ACTIVE_LAYERS :: 16;

STEAM_CONTROLLER_MIN_ANALOG_ACTION_DATA :: -1.0;
STEAM_CONTROLLER_MAX_ANALOG_ACTION_DATA :: 1.0;

ControllerAnalogActionData_t :: InputAnalogActionData_t;
ControllerDigitalActionData_t :: InputDigitalActionData_t;
ControllerMotionData_t :: InputMotionData_t;

STEAMCONTROLLER_INTERFACE_VERSION :: "SteamController008";

STEAMUGC_INTERFACE_VERSION :: "STEAMUGC_INTERFACE_VERSION020";

STEAMHTMLSURFACE_INTERFACE_VERSION :: "STEAMHTMLSURFACE_INTERFACE_VERSION_005";

STEAMINVENTORY_INTERFACE_VERSION :: "STEAMINVENTORY_INTERFACE_V003";

STEAMTIMELINE_INTERFACE_VERSION :: "STEAMTIMELINE_INTERFACE_V001";

STEAMVIDEO_INTERFACE_VERSION :: "STEAMVIDEO_INTERFACE_V007";

STEAMPARENTALSETTINGS_INTERFACE_VERSION :: "STEAMPARENTALSETTINGS_INTERFACE_VERSION001";

STEAMREMOTEPLAY_INTERFACE_VERSION :: "STEAMREMOTEPLAY_INTERFACE_VERSION002";

STEAMNETWORKINGMESSAGES_INTERFACE_VERSION :: "SteamNetworkingMessages002";

STEAMNETWORKINGSOCKETS_INTERFACE_VERSION :: "SteamNetworkingSockets012";

STEAMNETWORKINGUTILS_INTERFACE_VERSION :: "SteamNetworkingUtils004";

STEAMGAMESERVER_INTERFACE_VERSION :: "SteamGameServer015";

STEAMGAMESERVERSTATS_INTERFACE_VERSION :: "SteamGameServerStats001";

uint8 :: u8;

int8 :: s8;

int16 :: s16;
uint16 :: u16;
int32 :: s32;
uint32 :: u32;
int64 :: s64;
uint64 :: u64;

lint64 :: int64;
ulint64 :: uint64;

intp :: s64;
uintp :: u64;

AppId_t :: uint32;
k_uAppIdInvalid: AppId_t : 0;

// AppIds and DepotIDs also presently share the same namespace
DepotId_t :: uint32;
k_uDepotIdInvalid: DepotId_t : 0;

// RTime32.  Seconds elapsed since Jan 1 1970, i.e. unix timestamp.
// It's the same as time_t, but it is always 32-bit and unsigned.
RTime32 :: uint32;

// handle to a Steam API call
SteamAPICall_t :: uint64;
k_uAPICallInvalid: SteamAPICall_t : 0;

AccountID_t :: uint32;
k_uAccountIdInvalid: AccountID_t : 0;

// Party Beacon ID
PartyBeaconID_t :: uint64;
k_ulPartyBeaconIdInvalid: PartyBeaconID_t : 0;

ESteamIPType :: enum s32 {
    ESteamIPTypeIPv4 :: 0;
    ESteamIPTypeIPv6 :: 1;

    k_ESteamIPTypeIPv4 :: ESteamIPTypeIPv4;
    k_ESteamIPTypeIPv6 :: ESteamIPTypeIPv6;
}

SteamIPAddress_t :: struct {
    union {
        m_unIPv4:    uint32; // Host order
        m_rgubIPv6:  [16] uint8; // Network order! Same as inaddr_in6.  (0011:2233:4455:6677:8899:aabb:ccdd:eeff)

        m_ipv6Qword: [2] uint64; // big endian
    }

    m_eType: ESteamIPType;
}

// Steam universes.  Each universe is a self-contained Steam instance.
EUniverse :: enum s32 {
    EUniverseInvalid  :: 0;
    EUniversePublic   :: 1;
    EUniverseBeta     :: 2;
    EUniverseInternal :: 3;
    EUniverseDev      :: 4;

    EUniverseMax      :: 5;

    k_EUniverseInvalid  :: EUniverseInvalid;
    k_EUniversePublic   :: EUniversePublic;
    k_EUniverseBeta     :: EUniverseBeta;
    k_EUniverseInternal :: EUniverseInternal;
    k_EUniverseDev      :: EUniverseDev;

    k_EUniverseMax      :: EUniverseMax;
}

// General result codes
EResult :: enum s32 {
    k_EResultNone                                    :: 0;
    k_EResultOK                                      :: 1;
    k_EResultFail                                    :: 2;
    k_EResultNoConnection                            :: 3;

    k_EResultInvalidPassword                         :: 5;
    k_EResultLoggedInElsewhere                       :: 6;
    k_EResultInvalidProtocolVer                      :: 7;
    k_EResultInvalidParam                            :: 8;
    k_EResultFileNotFound                            :: 9;
    k_EResultBusy                                    :: 10;
    k_EResultInvalidState                            :: 11;
    k_EResultInvalidName                             :: 12;
    k_EResultInvalidEmail                            :: 13;
    k_EResultDuplicateName                           :: 14;
    k_EResultAccessDenied                            :: 15;
    k_EResultTimeout                                 :: 16;
    k_EResultBanned                                  :: 17;
    k_EResultAccountNotFound                         :: 18;
    k_EResultInvalidSteamID                          :: 19;
    k_EResultServiceUnavailable                      :: 20;
    k_EResultNotLoggedOn                             :: 21;
    k_EResultPending                                 :: 22;
    k_EResultEncryptionFailure                       :: 23;
    k_EResultInsufficientPrivilege                   :: 24;
    k_EResultLimitExceeded                           :: 25;
    k_EResultRevoked                                 :: 26;
    k_EResultExpired                                 :: 27;
    k_EResultAlreadyRedeemed                         :: 28;
    k_EResultDuplicateRequest                        :: 29;
    k_EResultAlreadyOwned                            :: 30;
    k_EResultIPNotFound                              :: 31;
    k_EResultPersistFailed                           :: 32;
    k_EResultLockingFailed                           :: 33;
    k_EResultLogonSessionReplaced                    :: 34;
    k_EResultConnectFailed                           :: 35;
    k_EResultHandshakeFailed                         :: 36;
    k_EResultIOFailure                               :: 37;
    k_EResultRemoteDisconnect                        :: 38;
    k_EResultShoppingCartNotFound                    :: 39;
    k_EResultBlocked                                 :: 40;
    k_EResultIgnored                                 :: 41;
    k_EResultNoMatch                                 :: 42;
    k_EResultAccountDisabled                         :: 43;
    k_EResultServiceReadOnly                         :: 44;
    k_EResultAccountNotFeatured                      :: 45;
    k_EResultAdministratorOK                         :: 46;
    k_EResultContentVersion                          :: 47;
    k_EResultTryAnotherCM                            :: 48;
    k_EResultPasswordRequiredToKickSession           :: 49;
    k_EResultAlreadyLoggedInElsewhere                :: 50;
    k_EResultSuspended                               :: 51;
    k_EResultCancelled                               :: 52;
    k_EResultDataCorruption                          :: 53;
    k_EResultDiskFull                                :: 54;
    k_EResultRemoteCallFailed                        :: 55;
    k_EResultPasswordUnset                           :: 56;
    k_EResultExternalAccountUnlinked                 :: 57;
    k_EResultPSNTicketInvalid                        :: 58;
    k_EResultExternalAccountAlreadyLinked            :: 59;
    k_EResultRemoteFileConflict                      :: 60;
    k_EResultIllegalPassword                         :: 61;
    k_EResultSameAsPreviousValue                     :: 62;
    k_EResultAccountLogonDenied                      :: 63;
    k_EResultCannotUseOldPassword                    :: 64;
    k_EResultInvalidLoginAuthCode                    :: 65;
    k_EResultAccountLogonDeniedNoMail                :: 66;
    k_EResultHardwareNotCapableOfIPT                 :: 67;
    k_EResultIPTInitError                            :: 68;
    k_EResultParentalControlRestricted               :: 69;
    k_EResultFacebookQueryError                      :: 70;
    k_EResultExpiredLoginAuthCode                    :: 71;
    k_EResultIPLoginRestrictionFailed                :: 72;
    k_EResultAccountLockedDown                       :: 73;
    k_EResultAccountLogonDeniedVerifiedEmailRequired :: 74;
    k_EResultNoMatchingURL                           :: 75;
    k_EResultBadResponse                             :: 76;
    k_EResultRequirePasswordReEntry                  :: 77;
    k_EResultValueOutOfRange                         :: 78;
    k_EResultUnexpectedError                         :: 79;
    k_EResultDisabled                                :: 80;
    k_EResultInvalidCEGSubmission                    :: 81;
    k_EResultRestrictedDevice                        :: 82;
    k_EResultRegionLocked                            :: 83;
    k_EResultRateLimitExceeded                       :: 84;
    k_EResultAccountLoginDeniedNeedTwoFactor         :: 85;
    k_EResultItemDeleted                             :: 86;
    k_EResultAccountLoginDeniedThrottle              :: 87;
    k_EResultTwoFactorCodeMismatch                   :: 88;
    k_EResultTwoFactorActivationCodeMismatch         :: 89;
    k_EResultAccountAssociatedToMultiplePartners     :: 90;
    k_EResultNotModified                             :: 91;
    k_EResultNoMobileDevice                          :: 92;
    k_EResultTimeNotSynced                           :: 93;
    k_EResultSmsCodeFailed                           :: 94;
    k_EResultAccountLimitExceeded                    :: 95;
    k_EResultAccountActivityLimitExceeded            :: 96;
    k_EResultPhoneActivityLimitExceeded              :: 97;
    k_EResultRefundToWallet                          :: 98;
    k_EResultEmailSendFailure                        :: 99;
    k_EResultNotSettled                              :: 100;
    k_EResultNeedCaptcha                             :: 101;
    k_EResultGSLTDenied                              :: 102;
    k_EResultGSOwnerDenied                           :: 103;
    k_EResultInvalidItemType                         :: 104;
    k_EResultIPBanned                                :: 105;
    k_EResultGSLTExpired                             :: 106;
    k_EResultInsufficientFunds                       :: 107;
    k_EResultTooManyPending                          :: 108;
    k_EResultNoSiteLicensesFound                     :: 109;
    k_EResultWGNetworkSendExceeded                   :: 110;
    k_EResultAccountNotFriends                       :: 111;
    k_EResultLimitedUserAccount                      :: 112;
    k_EResultCantRemoveItem                          :: 113;
    k_EResultAccountDeleted                          :: 114;
    k_EResultExistingUserCancelledLicense            :: 115;
    k_EResultCommunityCooldown                       :: 116;
    k_EResultNoLauncherSpecified                     :: 117;
    k_EResultMustAgreeToSSA                          :: 118;
    k_EResultLauncherMigrated                        :: 119;
    k_EResultSteamRealmMismatch                      :: 120;
    k_EResultInvalidSignature                        :: 121;
    k_EResultParseFailure                            :: 122;
    k_EResultNoVerifiedPhone                         :: 123;
    k_EResultInsufficientBattery                     :: 124;
    k_EResultChargerRequired                         :: 125;
    k_EResultCachedCredentialInvalid                 :: 126;
    K_EResultPhoneNumberIsVOIP                       :: 127;
    k_EResultNotSupported                            :: 128;
    k_EResultFamilySizeLimitExceeded                 :: 129;
}

// Error codes for use with the voice functions
EVoiceResult :: enum s32 {
    EVoiceResultOK                   :: 0;
    EVoiceResultNotInitialized       :: 1;
    EVoiceResultNotRecording         :: 2;
    EVoiceResultNoData               :: 3;
    EVoiceResultBufferTooSmall       :: 4;
    EVoiceResultDataCorrupted        :: 5;
    EVoiceResultRestricted           :: 6;
    EVoiceResultUnsupportedCodec     :: 7;
    EVoiceResultReceiverOutOfDate    :: 8;
    EVoiceResultReceiverDidNotAnswer :: 9;

    k_EVoiceResultOK                   :: EVoiceResultOK;
    k_EVoiceResultNotInitialized       :: EVoiceResultNotInitialized;
    k_EVoiceResultNotRecording         :: EVoiceResultNotRecording;
    k_EVoiceResultNoData               :: EVoiceResultNoData;
    k_EVoiceResultBufferTooSmall       :: EVoiceResultBufferTooSmall;
    k_EVoiceResultDataCorrupted        :: EVoiceResultDataCorrupted;
    k_EVoiceResultRestricted           :: EVoiceResultRestricted;
    k_EVoiceResultUnsupportedCodec     :: EVoiceResultUnsupportedCodec;
    k_EVoiceResultReceiverOutOfDate    :: EVoiceResultReceiverOutOfDate;
    k_EVoiceResultReceiverDidNotAnswer :: EVoiceResultReceiverDidNotAnswer;
}

// Result codes to GSHandleClientDeny/Kick
EDenyReason :: enum s32 {
    EDenyInvalid                 :: 0;
    EDenyInvalidVersion          :: 1;
    EDenyGeneric                 :: 2;
    EDenyNotLoggedOn             :: 3;
    EDenyNoLicense               :: 4;
    EDenyCheater                 :: 5;
    EDenyLoggedInElseWhere       :: 6;
    EDenyUnknownText             :: 7;
    EDenyIncompatibleAnticheat   :: 8;
    EDenyMemoryCorruption        :: 9;
    EDenyIncompatibleSoftware    :: 10;
    EDenySteamConnectionLost     :: 11;
    EDenySteamConnectionError    :: 12;
    EDenySteamResponseTimedOut   :: 13;
    EDenySteamValidationStalled  :: 14;
    EDenySteamOwnerLeftGuestUser :: 15;

    k_EDenyInvalid                 :: EDenyInvalid;
    k_EDenyInvalidVersion          :: EDenyInvalidVersion;
    k_EDenyGeneric                 :: EDenyGeneric;
    k_EDenyNotLoggedOn             :: EDenyNotLoggedOn;
    k_EDenyNoLicense               :: EDenyNoLicense;
    k_EDenyCheater                 :: EDenyCheater;
    k_EDenyLoggedInElseWhere       :: EDenyLoggedInElseWhere;
    k_EDenyUnknownText             :: EDenyUnknownText;
    k_EDenyIncompatibleAnticheat   :: EDenyIncompatibleAnticheat;
    k_EDenyMemoryCorruption        :: EDenyMemoryCorruption;
    k_EDenyIncompatibleSoftware    :: EDenyIncompatibleSoftware;
    k_EDenySteamConnectionLost     :: EDenySteamConnectionLost;
    k_EDenySteamConnectionError    :: EDenySteamConnectionError;
    k_EDenySteamResponseTimedOut   :: EDenySteamResponseTimedOut;
    k_EDenySteamValidationStalled  :: EDenySteamValidationStalled;
    k_EDenySteamOwnerLeftGuestUser :: EDenySteamOwnerLeftGuestUser;
}

// return type of GetAuthSessionTicket
HAuthTicket :: uint32;
k_HAuthTicketInvalid: HAuthTicket : 0;

// results from BeginAuthSession
EBeginAuthSessionResult :: enum s32 {
    EBeginAuthSessionResultOK               :: 0;
    EBeginAuthSessionResultInvalidTicket    :: 1;
    EBeginAuthSessionResultDuplicateRequest :: 2;
    EBeginAuthSessionResultInvalidVersion   :: 3;
    EBeginAuthSessionResultGameMismatch     :: 4;
    EBeginAuthSessionResultExpiredTicket    :: 5;

    k_EBeginAuthSessionResultOK               :: EBeginAuthSessionResultOK;
    k_EBeginAuthSessionResultInvalidTicket    :: EBeginAuthSessionResultInvalidTicket;
    k_EBeginAuthSessionResultDuplicateRequest :: EBeginAuthSessionResultDuplicateRequest;
    k_EBeginAuthSessionResultInvalidVersion   :: EBeginAuthSessionResultInvalidVersion;
    k_EBeginAuthSessionResultGameMismatch     :: EBeginAuthSessionResultGameMismatch;
    k_EBeginAuthSessionResultExpiredTicket    :: EBeginAuthSessionResultExpiredTicket;
}

// Callback values for callback ValidateAuthTicketResponse_t which is a response to BeginAuthSession
EAuthSessionResponse :: enum s32 {
    EAuthSessionResponseOK                               :: 0;
    EAuthSessionResponseUserNotConnectedToSteam          :: 1;
    EAuthSessionResponseNoLicenseOrExpired               :: 2;
    EAuthSessionResponseVACBanned                        :: 3;
    EAuthSessionResponseLoggedInElseWhere                :: 4;
    EAuthSessionResponseVACCheckTimedOut                 :: 5;
    EAuthSessionResponseAuthTicketCanceled               :: 6;
    EAuthSessionResponseAuthTicketInvalidAlreadyUsed     :: 7;
    EAuthSessionResponseAuthTicketInvalid                :: 8;
    EAuthSessionResponsePublisherIssuedBan               :: 9;
    EAuthSessionResponseAuthTicketNetworkIdentityFailure :: 10;

    k_EAuthSessionResponseOK                               :: EAuthSessionResponseOK;
    k_EAuthSessionResponseUserNotConnectedToSteam          :: EAuthSessionResponseUserNotConnectedToSteam;
    k_EAuthSessionResponseNoLicenseOrExpired               :: EAuthSessionResponseNoLicenseOrExpired;
    k_EAuthSessionResponseVACBanned                        :: EAuthSessionResponseVACBanned;
    k_EAuthSessionResponseLoggedInElseWhere                :: EAuthSessionResponseLoggedInElseWhere;
    k_EAuthSessionResponseVACCheckTimedOut                 :: EAuthSessionResponseVACCheckTimedOut;
    k_EAuthSessionResponseAuthTicketCanceled               :: EAuthSessionResponseAuthTicketCanceled;
    k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed     :: EAuthSessionResponseAuthTicketInvalidAlreadyUsed;
    k_EAuthSessionResponseAuthTicketInvalid                :: EAuthSessionResponseAuthTicketInvalid;
    k_EAuthSessionResponsePublisherIssuedBan               :: EAuthSessionResponsePublisherIssuedBan;
    k_EAuthSessionResponseAuthTicketNetworkIdentityFailure :: EAuthSessionResponseAuthTicketNetworkIdentityFailure;
}

// results from UserHasLicenseForApp
EUserHasLicenseForAppResult :: enum s32 {
    EUserHasLicenseResultHasLicense         :: 0;
    EUserHasLicenseResultDoesNotHaveLicense :: 1;
    EUserHasLicenseResultNoAuth             :: 2;

    k_EUserHasLicenseResultHasLicense         :: EUserHasLicenseResultHasLicense;
    k_EUserHasLicenseResultDoesNotHaveLicense :: EUserHasLicenseResultDoesNotHaveLicense;
    k_EUserHasLicenseResultNoAuth             :: EUserHasLicenseResultNoAuth;
}

// Steam account types
EAccountType :: enum s32 {
    EAccountTypeInvalid        :: 0;
    EAccountTypeIndividual     :: 1;
    EAccountTypeMultiseat      :: 2;
    EAccountTypeGameServer     :: 3;
    EAccountTypeAnonGameServer :: 4;
    EAccountTypePending        :: 5;
    EAccountTypeContentServer  :: 6;
    EAccountTypeClan           :: 7;
    EAccountTypeChat           :: 8;
    EAccountTypeConsoleUser    :: 9;
    EAccountTypeAnonUser       :: 10;

    EAccountTypeMax            :: 11;

    k_EAccountTypeInvalid        :: EAccountTypeInvalid;
    k_EAccountTypeIndividual     :: EAccountTypeIndividual;
    k_EAccountTypeMultiseat      :: EAccountTypeMultiseat;
    k_EAccountTypeGameServer     :: EAccountTypeGameServer;
    k_EAccountTypeAnonGameServer :: EAccountTypeAnonGameServer;
    k_EAccountTypePending        :: EAccountTypePending;
    k_EAccountTypeContentServer  :: EAccountTypeContentServer;
    k_EAccountTypeClan           :: EAccountTypeClan;
    k_EAccountTypeChat           :: EAccountTypeChat;
    k_EAccountTypeConsoleUser    :: EAccountTypeConsoleUser;
    k_EAccountTypeAnonUser       :: EAccountTypeAnonUser;

    k_EAccountTypeMax            :: EAccountTypeMax;
}

//-----------------------------------------------------------------------------
// Purpose: Chat Entry Types (previously was only friend-to-friend message types)
//-----------------------------------------------------------------------------
EChatEntryType :: enum s32 {
    EChatEntryTypeInvalid          :: 0;
    EChatEntryTypeChatMsg          :: 1;
    EChatEntryTypeTyping           :: 2;
    EChatEntryTypeInviteGame       :: 3;
    EChatEntryTypeEmote            :: 4;

    EChatEntryTypeLeftConversation :: 6;

    EChatEntryTypeEntered          :: 7;
    EChatEntryTypeWasKicked        :: 8;
    EChatEntryTypeWasBanned        :: 9;
    EChatEntryTypeDisconnected     :: 10;
    EChatEntryTypeHistoricalChat   :: 11;

    EChatEntryTypeLinkBlocked      :: 14;

    k_EChatEntryTypeInvalid          :: EChatEntryTypeInvalid;
    k_EChatEntryTypeChatMsg          :: EChatEntryTypeChatMsg;
    k_EChatEntryTypeTyping           :: EChatEntryTypeTyping;
    k_EChatEntryTypeInviteGame       :: EChatEntryTypeInviteGame;
    k_EChatEntryTypeEmote            :: EChatEntryTypeEmote;

    k_EChatEntryTypeLeftConversation :: EChatEntryTypeLeftConversation;

    k_EChatEntryTypeEntered          :: EChatEntryTypeEntered;
    k_EChatEntryTypeWasKicked        :: EChatEntryTypeWasKicked;
    k_EChatEntryTypeWasBanned        :: EChatEntryTypeWasBanned;
    k_EChatEntryTypeDisconnected     :: EChatEntryTypeDisconnected;
    k_EChatEntryTypeHistoricalChat   :: EChatEntryTypeHistoricalChat;

    k_EChatEntryTypeLinkBlocked      :: EChatEntryTypeLinkBlocked;
}

//-----------------------------------------------------------------------------
// Purpose: Chat Room Enter Responses
//-----------------------------------------------------------------------------
EChatRoomEnterResponse :: enum s32 {
    EChatRoomEnterResponseSuccess           :: 1;
    EChatRoomEnterResponseDoesntExist       :: 2;
    EChatRoomEnterResponseNotAllowed        :: 3;
    EChatRoomEnterResponseFull              :: 4;
    EChatRoomEnterResponseError             :: 5;
    EChatRoomEnterResponseBanned            :: 6;
    EChatRoomEnterResponseLimited           :: 7;
    EChatRoomEnterResponseClanDisabled      :: 8;
    EChatRoomEnterResponseCommunityBan      :: 9;
    EChatRoomEnterResponseMemberBlockedYou  :: 10;
    EChatRoomEnterResponseYouBlockedMember  :: 11;

    EChatRoomEnterResponseRatelimitExceeded :: 15;

    k_EChatRoomEnterResponseSuccess           :: EChatRoomEnterResponseSuccess;
    k_EChatRoomEnterResponseDoesntExist       :: EChatRoomEnterResponseDoesntExist;
    k_EChatRoomEnterResponseNotAllowed        :: EChatRoomEnterResponseNotAllowed;
    k_EChatRoomEnterResponseFull              :: EChatRoomEnterResponseFull;
    k_EChatRoomEnterResponseError             :: EChatRoomEnterResponseError;
    k_EChatRoomEnterResponseBanned            :: EChatRoomEnterResponseBanned;
    k_EChatRoomEnterResponseLimited           :: EChatRoomEnterResponseLimited;
    k_EChatRoomEnterResponseClanDisabled      :: EChatRoomEnterResponseClanDisabled;
    k_EChatRoomEnterResponseCommunityBan      :: EChatRoomEnterResponseCommunityBan;
    k_EChatRoomEnterResponseMemberBlockedYou  :: EChatRoomEnterResponseMemberBlockedYou;
    k_EChatRoomEnterResponseYouBlockedMember  :: EChatRoomEnterResponseYouBlockedMember;

    k_EChatRoomEnterResponseRatelimitExceeded :: EChatRoomEnterResponseRatelimitExceeded;
}

k_unSteamAccountIDMask: u32 : 4294967295;
k_unSteamAccountInstanceMask: u32 : 1048575;
k_unSteamUserDefaultInstance: u32 : 1; // fixed instance for all individual users

// Special flags for Chat accounts - they go in the top 8 bits
// of the steam ID's "instance", leaving 12 for the actual instances
EChatSteamIDInstanceFlags :: enum s32 {
    EChatAccountInstanceMask  :: 4095;

    EChatInstanceFlagClan     :: 524288;
    EChatInstanceFlagLobby    :: 262144;
    EChatInstanceFlagMMSLobby :: 131072;

    k_EChatAccountInstanceMask  :: EChatAccountInstanceMask;

    k_EChatInstanceFlagClan     :: EChatInstanceFlagClan;
    k_EChatInstanceFlagLobby    :: EChatInstanceFlagLobby;
    k_EChatInstanceFlagMMSLobby :: EChatInstanceFlagMMSLobby;
}

//-----------------------------------------------------------------------------
// Purpose: Possible positions to tell the overlay to show notifications in
//-----------------------------------------------------------------------------
ENotificationPosition :: enum s32 {
    EPositionInvalid     :: -1;
    EPositionTopLeft     :: 0;
    EPositionTopRight    :: 1;
    EPositionBottomLeft  :: 2;
    EPositionBottomRight :: 3;

    k_EPositionInvalid     :: EPositionInvalid;
    k_EPositionTopLeft     :: EPositionTopLeft;
    k_EPositionTopRight    :: EPositionTopRight;
    k_EPositionBottomLeft  :: EPositionBottomLeft;
    k_EPositionBottomRight :: EPositionBottomRight;
}

//-----------------------------------------------------------------------------
// Purpose: Broadcast upload result details
//-----------------------------------------------------------------------------
EBroadcastUploadResult :: enum s32 {
    EBroadcastUploadResultNone              :: 0;
    EBroadcastUploadResultOK                :: 1;
    EBroadcastUploadResultInitFailed        :: 2;
    EBroadcastUploadResultFrameFailed       :: 3;
    EBroadcastUploadResultTimeout           :: 4;
    EBroadcastUploadResultBandwidthExceeded :: 5;
    EBroadcastUploadResultLowFPS            :: 6;
    EBroadcastUploadResultMissingKeyFrames  :: 7;
    EBroadcastUploadResultNoConnection      :: 8;
    EBroadcastUploadResultRelayFailed       :: 9;
    EBroadcastUploadResultSettingsChanged   :: 10;
    EBroadcastUploadResultMissingAudio      :: 11;
    EBroadcastUploadResultTooFarBehind      :: 12;
    EBroadcastUploadResultTranscodeBehind   :: 13;
    EBroadcastUploadResultNotAllowedToPlay  :: 14;
    EBroadcastUploadResultBusy              :: 15;
    EBroadcastUploadResultBanned            :: 16;
    EBroadcastUploadResultAlreadyActive     :: 17;
    EBroadcastUploadResultForcedOff         :: 18;
    EBroadcastUploadResultAudioBehind       :: 19;
    EBroadcastUploadResultShutdown          :: 20;
    EBroadcastUploadResultDisconnect        :: 21;
    EBroadcastUploadResultVideoInitFailed   :: 22;
    EBroadcastUploadResultAudioInitFailed   :: 23;

    k_EBroadcastUploadResultNone              :: EBroadcastUploadResultNone;
    k_EBroadcastUploadResultOK                :: EBroadcastUploadResultOK;
    k_EBroadcastUploadResultInitFailed        :: EBroadcastUploadResultInitFailed;
    k_EBroadcastUploadResultFrameFailed       :: EBroadcastUploadResultFrameFailed;
    k_EBroadcastUploadResultTimeout           :: EBroadcastUploadResultTimeout;
    k_EBroadcastUploadResultBandwidthExceeded :: EBroadcastUploadResultBandwidthExceeded;
    k_EBroadcastUploadResultLowFPS            :: EBroadcastUploadResultLowFPS;
    k_EBroadcastUploadResultMissingKeyFrames  :: EBroadcastUploadResultMissingKeyFrames;
    k_EBroadcastUploadResultNoConnection      :: EBroadcastUploadResultNoConnection;
    k_EBroadcastUploadResultRelayFailed       :: EBroadcastUploadResultRelayFailed;
    k_EBroadcastUploadResultSettingsChanged   :: EBroadcastUploadResultSettingsChanged;
    k_EBroadcastUploadResultMissingAudio      :: EBroadcastUploadResultMissingAudio;
    k_EBroadcastUploadResultTooFarBehind      :: EBroadcastUploadResultTooFarBehind;
    k_EBroadcastUploadResultTranscodeBehind   :: EBroadcastUploadResultTranscodeBehind;
    k_EBroadcastUploadResultNotAllowedToPlay  :: EBroadcastUploadResultNotAllowedToPlay;
    k_EBroadcastUploadResultBusy              :: EBroadcastUploadResultBusy;
    k_EBroadcastUploadResultBanned            :: EBroadcastUploadResultBanned;
    k_EBroadcastUploadResultAlreadyActive     :: EBroadcastUploadResultAlreadyActive;
    k_EBroadcastUploadResultForcedOff         :: EBroadcastUploadResultForcedOff;
    k_EBroadcastUploadResultAudioBehind       :: EBroadcastUploadResultAudioBehind;
    k_EBroadcastUploadResultShutdown          :: EBroadcastUploadResultShutdown;
    k_EBroadcastUploadResultDisconnect        :: EBroadcastUploadResultDisconnect;
    k_EBroadcastUploadResultVideoInitFailed   :: EBroadcastUploadResultVideoInitFailed;
    k_EBroadcastUploadResultAudioInitFailed   :: EBroadcastUploadResultAudioInitFailed;
}

//-----------------------------------------------------------------------------
// Purpose: Reasons a user may not use the Community Market.
//          Used in MarketEligibilityResponse_t.
//-----------------------------------------------------------------------------
EMarketNotAllowedReasonFlags :: enum s32 {
    None                             :: 0;

    TemporaryFailure                 :: 1;

    AccountDisabled                  :: 2;

    AccountLockedDown                :: 4;

    AccountLimited                   :: 8;

    TradeBanned                      :: 16;

    AccountNotTrusted                :: 32;

    SteamGuardNotEnabled             :: 64;

    SteamGuardOnlyRecentlyEnabled    :: 128;

    RecentPasswordReset              :: 256;

    NewPaymentMethod                 :: 512;

    InvalidCookie                    :: 1024;

    UsingNewDevice                   :: 2048;

    RecentSelfRefund                 :: 4096;

    NewPaymentMethodCannotBeVerified :: 8192;

    NoRecentPurchases                :: 16384;

    AcceptedWalletGift               :: 32768;

    k_EMarketNotAllowedReason_None                             :: None;

    k_EMarketNotAllowedReason_TemporaryFailure                 :: TemporaryFailure;

    k_EMarketNotAllowedReason_AccountDisabled                  :: AccountDisabled;

    k_EMarketNotAllowedReason_AccountLockedDown                :: AccountLockedDown;

    k_EMarketNotAllowedReason_AccountLimited                   :: AccountLimited;

    k_EMarketNotAllowedReason_TradeBanned                      :: TradeBanned;

    k_EMarketNotAllowedReason_AccountNotTrusted                :: AccountNotTrusted;

    k_EMarketNotAllowedReason_SteamGuardNotEnabled             :: SteamGuardNotEnabled;

    k_EMarketNotAllowedReason_SteamGuardOnlyRecentlyEnabled    :: SteamGuardOnlyRecentlyEnabled;

    k_EMarketNotAllowedReason_RecentPasswordReset              :: RecentPasswordReset;

    k_EMarketNotAllowedReason_NewPaymentMethod                 :: NewPaymentMethod;

    k_EMarketNotAllowedReason_InvalidCookie                    :: InvalidCookie;

    k_EMarketNotAllowedReason_UsingNewDevice                   :: UsingNewDevice;

    k_EMarketNotAllowedReason_RecentSelfRefund                 :: RecentSelfRefund;

    k_EMarketNotAllowedReason_NewPaymentMethodCannotBeVerified :: NewPaymentMethodCannotBeVerified;

    k_EMarketNotAllowedReason_NoRecentPurchases                :: NoRecentPurchases;

    k_EMarketNotAllowedReason_AcceptedWalletGift               :: AcceptedWalletGift;
}

//
// describes XP / progress restrictions to apply for games with duration control /
// anti-indulgence enabled for minor Steam China users.
//
// WARNING: DO NOT RENUMBER
EDurationControlProgress :: enum s32 {
    EDurationControlProgress_Full   :: 0;
    EDurationControlProgress_Half   :: 1;
    EDurationControlProgress_None   :: 2;

    EDurationControl_ExitSoon_3h    :: 3;
    EDurationControl_ExitSoon_5h    :: 4;
    EDurationControl_ExitSoon_Night :: 5;

    k_EDurationControlProgress_Full   :: EDurationControlProgress_Full;
    k_EDurationControlProgress_Half   :: EDurationControlProgress_Half;
    k_EDurationControlProgress_None   :: EDurationControlProgress_None;

    k_EDurationControl_ExitSoon_3h    :: EDurationControl_ExitSoon_3h;
    k_EDurationControl_ExitSoon_5h    :: EDurationControl_ExitSoon_5h;
    k_EDurationControl_ExitSoon_Night :: EDurationControl_ExitSoon_Night;
}

//
// describes which notification timer has expired, for steam china duration control feature
//
// WARNING: DO NOT RENUMBER
EDurationControlNotification :: enum s32 {
    None           :: 0;
    _1Hour         :: 1;

    _3Hours        :: 2;
    HalfProgress   :: 3;
    NoProgress     :: 4;

    ExitSoon_3h    :: 5;
    ExitSoon_5h    :: 6;
    ExitSoon_Night :: 7;

    k_EDurationControlNotification_None           :: None;
    k_EDurationControlNotification_1Hour          :: _1Hour;

    k_EDurationControlNotification_3Hours         :: _3Hours;
    k_EDurationControlNotification_HalfProgress   :: HalfProgress;
    k_EDurationControlNotification_NoProgress     :: NoProgress;

    k_EDurationControlNotification_ExitSoon_3h    :: ExitSoon_3h;
    k_EDurationControlNotification_ExitSoon_5h    :: ExitSoon_5h;
    k_EDurationControlNotification_ExitSoon_Night :: ExitSoon_Night;
}

//
// Specifies a game's online state in relation to duration control
//
EDurationControlOnlineState :: enum s32 {
    Invalid       :: 0;
    Offline       :: 1;
    Online        :: 2;
    OnlineHighPri :: 3;

    k_EDurationControlOnlineState_Invalid       :: Invalid;
    k_EDurationControlOnlineState_Offline       :: Offline;
    k_EDurationControlOnlineState_Online        :: Online;
    k_EDurationControlOnlineState_OnlineHighPri :: OnlineHighPri;
}

EBetaBranchFlags :: enum s32 {
    None      :: 0;
    Default   :: 1;
    Available :: 2;
    Private   :: 4;
    Selected  :: 8;
    Installed :: 16;

    k_EBetaBranch_None      :: None;
    k_EBetaBranch_Default   :: Default;
    k_EBetaBranch_Available :: Available;
    k_EBetaBranch_Private   :: Private;
    k_EBetaBranch_Selected  :: Selected;
    k_EBetaBranch_Installed :: Installed;
}

// Steam ID structure (64 bits total)
CSteamID :: struct {
    // 64 bits total
    SteamID_t :: union {
        SteamIDComponent_t :: struct {
            m_unAccountID:       uint32; // unique account identifier
            m_unAccountInstance: u32; // dynamic instance ID
            #place m_unAccountInstance; /*bitfield 20*/ m_EAccountType:      u32; // type of account - can't show as EAccountType, due to signed / unsigned difference
            m_EUniverse:         EUniverse; // universe this account belongs to
        }

        m_comp:        SteamIDComponent_t;

        m_unAll64Bits: uint64;
    }

    m_steamid: SteamID_t;
}

//-----------------------------------------------------------------------------
// Purpose: encapsulates an appID/modID pair
//-----------------------------------------------------------------------------
CGameID :: struct {
    EGameIDType :: enum s32 {
        EGameIDTypeApp      :: 0;
        EGameIDTypeGameMod  :: 1;
        EGameIDTypeShortcut :: 2;
        EGameIDTypeP2P      :: 3;

        k_EGameIDTypeApp      :: EGameIDTypeApp;
        k_EGameIDTypeGameMod  :: EGameIDTypeGameMod;
        k_EGameIDTypeShortcut :: EGameIDTypeShortcut;
        k_EGameIDTypeP2P      :: EGameIDTypeP2P;
    }

    //
    // Internal stuff.  Use the accessors above if possible
    //
    GameID_t :: struct {
        m_nAppID: u32;
        #place m_nAppID; /*bitfield 24*/ m_nType:  u32;
        m_nModID: u32;
    }

    union {
        m_ulGameID: uint64;
        m_gameID:   GameID_t;
    }
}

k_cchGameExtraInfoMax: s32 : 64;

//-----------------------------------------------------------------------------
// Purpose: Passed as argument to SteamAPI_UseBreakpadCrashHandler to enable optional callback
//  just before minidump file is captured after a crash has occurred.  (Allows app to append additional comment data to the dump, etc.)
//-----------------------------------------------------------------------------
PFNPreMinidumpCallback :: #type (_context: *void) -> void #c_call;

EGameSearchErrorCode_t :: enum s32 {
    OK                                :: 1;
    Failed_Search_Already_In_Progress :: 2;
    Failed_No_Search_In_Progress      :: 3;
    Failed_Not_Lobby_Leader           :: 4;
    Failed_No_Host_Available          :: 5;
    Failed_Search_Params_Invalid      :: 6;
    Failed_Offline                    :: 7;
    Failed_NotAuthorized              :: 8;
    Failed_Unknown_Error              :: 9;

    k_EGameSearchErrorCode_OK                                :: OK;
    k_EGameSearchErrorCode_Failed_Search_Already_In_Progress :: Failed_Search_Already_In_Progress;
    k_EGameSearchErrorCode_Failed_No_Search_In_Progress      :: Failed_No_Search_In_Progress;
    k_EGameSearchErrorCode_Failed_Not_Lobby_Leader           :: Failed_Not_Lobby_Leader;
    k_EGameSearchErrorCode_Failed_No_Host_Available          :: Failed_No_Host_Available;
    k_EGameSearchErrorCode_Failed_Search_Params_Invalid      :: Failed_Search_Params_Invalid;
    k_EGameSearchErrorCode_Failed_Offline                    :: Failed_Offline;
    k_EGameSearchErrorCode_Failed_NotAuthorized              :: Failed_NotAuthorized;
    k_EGameSearchErrorCode_Failed_Unknown_Error              :: Failed_Unknown_Error;
}

EPlayerResult_t :: enum s32 {
    EPlayerResultFailedToConnect :: 1;
    EPlayerResultAbandoned       :: 2;
    EPlayerResultKicked          :: 3;
    EPlayerResultIncomplete      :: 4;
    EPlayerResultCompleted       :: 5;

    k_EPlayerResultFailedToConnect :: EPlayerResultFailedToConnect;
    k_EPlayerResultAbandoned       :: EPlayerResultAbandoned;
    k_EPlayerResultKicked          :: EPlayerResultKicked;
    k_EPlayerResultIncomplete      :: EPlayerResultIncomplete;
    k_EPlayerResultCompleted       :: EPlayerResultCompleted;
}

ESteamIPv6ConnectivityProtocol :: enum s32 {
    Invalid :: 0;
    HTTP    :: 1;
    UDP     :: 2;

    k_ESteamIPv6ConnectivityProtocol_Invalid :: Invalid;
    k_ESteamIPv6ConnectivityProtocol_HTTP    :: HTTP;
    k_ESteamIPv6ConnectivityProtocol_UDP     :: UDP;
}

// For the above transport protocol, what do we think the local machine's connectivity to the internet over ipv6 is like
ESteamIPv6ConnectivityState :: enum s32 {
    Unknown :: 0;
    Good    :: 1;
    Bad     :: 2;

    k_ESteamIPv6ConnectivityState_Unknown :: Unknown;
    k_ESteamIPv6ConnectivityState_Good    :: Good;
    k_ESteamIPv6ConnectivityState_Bad     :: Bad;
}

ValvePackingSentinel_t :: struct {
    m_u32: uint32;
    m_u64: uint64;
    m_u16: uint16;
    m_d:   float64;
}

compile_time_assert_type :: [1] u8;

// handle to a communication pipe to the Steam client
HSteamPipe :: int32;

// handle to single instance of a steam user
HSteamUser :: int32;

// A fixed size buffer to receive an error message that is returned by some API
// calls.
k_cchMaxSteamErrMsg: s32 : 1024;
SteamErrMsg :: [1024] u8;

// function prototype
SteamAPIWarningMessageHook_t :: #type (unknown0: s32, unknown1: *u8) -> void #c_call;
SteamAPI_CheckCallbackRegistered_t :: #type (iCallbackNum: s32) -> uint32 #c_call;

// Dispatch all queued Steamworks callbacks.
//
// This is safe to call from multiple threads simultaneously,
// but if you choose to do this, callback code could be executed on any thread.
// One alternative is to call SteamAPI_RunCallbacks from the main thread only,
// and call SteamAPI_ReleaseCurrentThreadMemory regularly on other threads.
SteamAPI_RunCallbacks :: () -> void #foreign steam_api64;

// Dispatch callbacks relevant to the gameserver client and interfaces.
// To register for these, you need to use STEAM_GAMESERVER_CALLBACK.
// (Or call SetGameserverFlag on your CCallbackBase object.)
SteamGameServer_RunCallbacks :: () -> void #foreign steam_api64;

//-----------------------------------------------------------------------------
// Purpose: base for callbacks and call results - internal implementation detail
//-----------------------------------------------------------------------------
CCallbackBase :: struct {
    vtable: *CCallbackBase_VTable;
    k :: enum s32 {
        ECallbackFlagsRegistered :: 1;
        ECallbackFlagsGameServer :: 2;
        k_ECallbackFlagsRegistered :: ECallbackFlagsRegistered;
        k_ECallbackFlagsGameServer :: ECallbackFlagsGameServer;
    }
    m_nCallbackFlags: uint8;
    m_iCallback:      s32;
}
CCallbackBase_VTable :: struct #type_info_none {
    Run: (this: *CCallbackBase, pvParam: *void, bIOFailure: bool, hSteamAPICall: SteamAPICall_t) -> void #cpp_method;

    Run_1: (this: *CCallbackBase, pvParam: *void) -> void #cpp_method;

    GetCallbackSizeBytes: (this: *CCallbackBase) -> s32 #cpp_method;
}

CCallbackBase_Run :: inline (this: *CCallbackBase, pvParam: *void, bIOFailure: bool, hSteamAPICall: SteamAPICall_t) { this.vtable.Run(this, pvParam, bIOFailure, hSteamAPICall); }

CCallbackBase_Run_1 :: inline (this: *CCallbackBase, pvParam: *void) { this.vtable.Run_1(this, pvParam); }

CCallbackBase_GetCallbackSizeBytes :: inline (this: *CCallbackBase) -> s32 { return this.vtable.GetCallbackSizeBytes(this); }

vtable :: (obj: *CCallbackBase) -> *CCallbackBase_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: templated base for callbacks - internal implementation detail
//-----------------------------------------------------------------------------
CCallbackImpl :: struct(sizeof_P: s32) {
    #as ccallbackbase: CCallbackBase; // jai: no "using" to avoid name-clashes
}

//-----------------------------------------------------------------------------
// Purpose: maps a steam async call result to a class member function
//			template params: T = local class, P = parameter struct
//-----------------------------------------------------------------------------
CCallResult :: struct(T: Type, P: Type) {
    #as ccallbackbase: CCallbackBase; // jai: no "using" to avoid name-clashes

    m_hAPICall: SteamAPICall_t;
    m_pObj:     *T;
}

//-----------------------------------------------------------------------------
// Purpose: maps a steam callback to a class member function
//			template params: T = local class, P = parameter struct,
//			bGameserver = listen for gameserver callbacks instead of client callbacks
//-----------------------------------------------------------------------------
CCallback :: struct(T: Type, P: Type, bGameserver := false) {
    #as ccallbackimpl: CCallbackImpl(UnknownTemplateArgumentPlaceholder); // jai: no "using" to avoid name-clashes

    m_pObj: *T;
}

//-----------------------------------------------------------------------------
// Purpose: subclass of CCallback which allows default-construction in
//			an unregistered state; you must call Register manually
//-----------------------------------------------------------------------------
CCallbackManual :: struct(T: Type, P: Type, bGameServer := false) {
    #as ccallback: CCallback(T, P, UnknownTemplateArgumentPlaceholder); // jai: no "using" to avoid name-clashes
}

// Internal functions used to locate/create interfaces
SteamAPI_GetHSteamPipe :: () -> HSteamPipe #foreign steam_api64;
SteamAPI_GetHSteamUser :: () -> HSteamUser #foreign steam_api64;
SteamGameServer_GetHSteamPipe :: () -> HSteamPipe #foreign steam_api64;
SteamGameServer_GetHSteamUser :: () -> HSteamUser #foreign steam_api64;
SteamInternal_ContextInit :: (pContextInitData: *void) -> *void #foreign steam_api64;
SteamInternal_CreateInterface :: (ver: *u8) -> *void #foreign steam_api64;
SteamInternal_FindOrCreateUserInterface :: (hSteamUser: HSteamUser, pszVersion: *u8) -> *void #foreign steam_api64;
SteamInternal_FindOrCreateGameServerInterface :: (hSteamUser: HSteamUser, pszVersion: *u8) -> *void #foreign steam_api64;

// Internal functions used by the utility CCallback objects to receive callbacks
SteamAPI_RegisterCallback :: (pCallback: *CCallbackBase, iCallback: s32) -> void #foreign steam_api64;
SteamAPI_UnregisterCallback :: (pCallback: *CCallbackBase) -> void #foreign steam_api64;

// Internal functions used by the utility CCallResult objects to receive async call results
SteamAPI_RegisterCallResult :: (pCallback: *CCallbackBase, hAPICall: SteamAPICall_t) -> void #foreign steam_api64;
SteamAPI_UnregisterCallResult :: (pCallback: *CCallbackBase, hAPICall: SteamAPICall_t) -> void #foreign steam_api64;

/// Internal structure used in manual callback dispatch
CallbackMsg_t :: struct {
    m_hSteamUser: HSteamUser; // Specific user to whom this callback applies.
    m_iCallback:  s32; // Callback identifier.  (Corresponds to the k_iCallback enum in the callback structure.)
    m_pubParam:   *uint8; // Points to the callback structure
    m_cubParam:   s32; // Size of the data pointed to by m_pubParam
}

ISteamContentServer :: struct {}

ISteamPS3OverlayRender :: struct {}

//-----------------------------------------------------------------------------
// Purpose: Base values for callback identifiers, each callback must
//			have a unique ID.
//-----------------------------------------------------------------------------
anon_enum_1 :: enum s32 {
    k_iSteamUserCallbacks :: 100;
}
anon_enum_2 :: enum s32 {
    k_iSteamGameServerCallbacks :: 200;
}
anon_enum_3 :: enum s32 {
    k_iSteamFriendsCallbacks :: 300;
}
anon_enum_4 :: enum s32 {
    k_iSteamBillingCallbacks :: 400;
}
anon_enum_5 :: enum s32 {
    k_iSteamMatchmakingCallbacks :: 500;
}
anon_enum_6 :: enum s32 {
    k_iSteamContentServerCallbacks :: 600;
}
anon_enum_7 :: enum s32 {
    k_iSteamUtilsCallbacks :: 700;
}
anon_enum_8 :: enum s32 {
    k_iSteamAppsCallbacks :: 1000;
}
anon_enum_9 :: enum s32 {
    k_iSteamUserStatsCallbacks :: 1100;
}
anon_enum_10 :: enum s32 {
    k_iSteamNetworkingCallbacks :: 1200;
}
anon_enum_11 :: enum s32 {
    k_iSteamNetworkingSocketsCallbacks :: 1220;
}
anon_enum_12 :: enum s32 {
    k_iSteamNetworkingMessagesCallbacks :: 1250;
}
anon_enum_13 :: enum s32 {
    k_iSteamNetworkingUtilsCallbacks :: 1280;
}
anon_enum_14 :: enum s32 {
    k_iSteamRemoteStorageCallbacks :: 1300;
}
anon_enum_15 :: enum s32 {
    k_iSteamGameServerItemsCallbacks :: 1500;
}
anon_enum_16 :: enum s32 {
    k_iSteamGameCoordinatorCallbacks :: 1700;
}
anon_enum_17 :: enum s32 {
    k_iSteamGameServerStatsCallbacks :: 1800;
}
anon_enum_18 :: enum s32 {
    k_iSteam2AsyncCallbacks :: 1900;
}
anon_enum_19 :: enum s32 {
    k_iSteamGameStatsCallbacks :: 2000;
}
anon_enum_20 :: enum s32 {
    k_iSteamHTTPCallbacks :: 2100;
}
anon_enum_21 :: enum s32 {
    k_iSteamScreenshotsCallbacks :: 2300;
}

// NOTE: 2500-2599 are reserved
anon_enum_22 :: enum s32 {
    k_iSteamStreamLauncherCallbacks :: 2600;
}
anon_enum_23 :: enum s32 {
    k_iSteamControllerCallbacks :: 2800;
}
anon_enum_24 :: enum s32 {
    k_iSteamUGCCallbacks :: 3400;
}
anon_enum_25 :: enum s32 {
    k_iSteamStreamClientCallbacks :: 3500;
}
anon_enum_26 :: enum s32 {
    k_iSteamMusicCallbacks :: 4000;
}
anon_enum_27 :: enum s32 {
    k_iSteamMusicRemoteCallbacks :: 4100;
}
anon_enum_28 :: enum s32 {
    k_iSteamGameNotificationCallbacks :: 4400;
}
anon_enum_29 :: enum s32 {
    k_iSteamHTMLSurfaceCallbacks :: 4500;
}
anon_enum_30 :: enum s32 {
    k_iSteamVideoCallbacks :: 4600;
}
anon_enum_31 :: enum s32 {
    k_iSteamInventoryCallbacks :: 4700;
}
anon_enum_32 :: enum s32 {
    k_ISteamParentalSettingsCallbacks :: 5000;
}
anon_enum_33 :: enum s32 {
    k_iSteamGameSearchCallbacks :: 5200;
}
anon_enum_34 :: enum s32 {
    k_iSteamPartiesCallbacks :: 5300;
}
anon_enum_35 :: enum s32 {
    k_iSteamSTARCallbacks :: 5500;
}
anon_enum_36 :: enum s32 {
    k_iSteamRemotePlayCallbacks :: 5700;
}
anon_enum_37 :: enum s32 {
    k_iSteamChatCallbacks :: 5900;
}
anon_enum_38 :: enum s32 {
    k_iSteamTimelineCallbacks :: 6000;
}

CSteamGameServerAPIContext :: struct {
    m_pSteamClient:               *ISteamClient;
    m_pSteamGameServer:           *ISteamGameServer;
    m_pSteamGameServerUtils:      *ISteamUtils;
    m_pSteamGameServerNetworking: *ISteamNetworking;
    m_pSteamGameServerStats:      *ISteamGameServerStats;
    m_pSteamHTTP:                 *ISteamHTTP;
    m_pSteamInventory:            *ISteamInventory;
    m_pSteamUGC:                  *ISteamUGC;
}

// Forward declare all of the Steam interfaces.  (Do we really need to do this?)
ISteamClient :: struct {
    vtable: *ISteamClient_VTable;
}
ISteamClient_VTable :: struct #type_info_none {
    CreateSteamPipe: (this: *ISteamClient) -> HSteamPipe #cpp_method;

    BReleaseSteamPipe: (this: *ISteamClient, hSteamPipe: HSteamPipe) -> bool #cpp_method;

    ConnectToGlobalUser: (this: *ISteamClient, hSteamPipe: HSteamPipe) -> HSteamUser #cpp_method;

    CreateLocalUser: (this: *ISteamClient, phSteamPipe: *HSteamPipe, eAccountType: EAccountType) -> HSteamUser #cpp_method;

    ReleaseUser: (this: *ISteamClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) -> void #cpp_method;

    GetISteamUser: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUser #cpp_method;

    GetISteamGameServer: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameServer #cpp_method;

    SetLocalIPBinding: (this: *ISteamClient, unIP: *SteamIPAddress_t, usPort: uint16) -> void #cpp_method;

    GetISteamFriends: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamFriends #cpp_method;

    GetISteamUtils: (this: *ISteamClient, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUtils #cpp_method;

    GetISteamMatchmaking: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMatchmaking #cpp_method;

    GetISteamMatchmakingServers: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMatchmakingServers #cpp_method;

    GetISteamGenericInterface: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *void #cpp_method;

    GetISteamUserStats: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUserStats #cpp_method;

    GetISteamGameServerStats: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameServerStats #cpp_method;

    GetISteamApps: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamApps #cpp_method;

    GetISteamNetworking: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamNetworking #cpp_method;

    GetISteamRemoteStorage: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamRemoteStorage #cpp_method;

    GetISteamScreenshots: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamScreenshots #cpp_method;

    GetISteamGameSearch: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameSearch #cpp_method;

    RunFrame: (this: *ISteamClient) -> void #cpp_method;

    GetIPCCallCount: (this: *ISteamClient) -> uint32 #cpp_method;

    SetWarningMessageHook: (this: *ISteamClient, pFunction: SteamAPIWarningMessageHook_t) -> void #cpp_method;

    BShutdownIfAllPipesClosed: (this: *ISteamClient) -> bool #cpp_method;

    GetISteamHTTP: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamHTTP #cpp_method;

    GetISteamController: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamController #cpp_method;

    GetISteamUGC: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUGC #cpp_method;

    GetISteamMusic: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMusic #cpp_method;

    GetISteamMusicRemote: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMusicRemote #cpp_method;

    GetISteamHTMLSurface: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamHTMLSurface #cpp_method;

    DEPRECATED_Set_SteamAPI_CPostAPIResultInProcess: (this: *ISteamClient, unknown0: #type () -> void #c_call) -> void #cpp_method;
    DEPRECATED_Remove_SteamAPI_CPostAPIResultInProcess: (this: *ISteamClient, unknown0: #type () -> void #c_call) -> void #cpp_method;
    Set_SteamAPI_CCheckCallbackRegisteredInProcess: (this: *ISteamClient, func: SteamAPI_CheckCallbackRegistered_t) -> void #cpp_method;

    GetISteamInventory: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamInventory #cpp_method;

    GetISteamVideo: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamVideo #cpp_method;

    GetISteamParentalSettings: (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamParentalSettings #cpp_method;

    GetISteamInput: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamInput #cpp_method;

    GetISteamParties: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamParties #cpp_method;

    GetISteamRemotePlay: (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamRemotePlay #cpp_method;

    DestroyAllInterfaces: (this: *ISteamClient) -> void #cpp_method;
}

ISteamClient_CreateSteamPipe :: inline (this: *ISteamClient) -> HSteamPipe { return this.vtable.CreateSteamPipe(this); }

ISteamClient_BReleaseSteamPipe :: inline (this: *ISteamClient, hSteamPipe: HSteamPipe) -> bool { return this.vtable.BReleaseSteamPipe(this, hSteamPipe); }

ISteamClient_ConnectToGlobalUser :: inline (this: *ISteamClient, hSteamPipe: HSteamPipe) -> HSteamUser { return this.vtable.ConnectToGlobalUser(this, hSteamPipe); }

ISteamClient_CreateLocalUser :: inline (this: *ISteamClient, phSteamPipe: *HSteamPipe, eAccountType: EAccountType) -> HSteamUser { return this.vtable.CreateLocalUser(this, phSteamPipe, eAccountType); }

ISteamClient_ReleaseUser :: inline (this: *ISteamClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) { this.vtable.ReleaseUser(this, hSteamPipe, hUser); }

ISteamClient_GetISteamUser :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUser { return this.vtable.GetISteamUser(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamGameServer :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameServer { return this.vtable.GetISteamGameServer(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_SetLocalIPBinding :: inline (this: *ISteamClient, unIP: *SteamIPAddress_t, usPort: uint16) { this.vtable.SetLocalIPBinding(this, unIP, usPort); }

ISteamClient_GetISteamFriends :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamFriends { return this.vtable.GetISteamFriends(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamUtils :: inline (this: *ISteamClient, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUtils { return this.vtable.GetISteamUtils(this, hSteamPipe, pchVersion); }

ISteamClient_GetISteamMatchmaking :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMatchmaking { return this.vtable.GetISteamMatchmaking(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamMatchmakingServers :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMatchmakingServers { return this.vtable.GetISteamMatchmakingServers(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamGenericInterface :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *void { return this.vtable.GetISteamGenericInterface(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamUserStats :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUserStats { return this.vtable.GetISteamUserStats(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamGameServerStats :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameServerStats { return this.vtable.GetISteamGameServerStats(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamApps :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamApps { return this.vtable.GetISteamApps(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamNetworking :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamNetworking { return this.vtable.GetISteamNetworking(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamRemoteStorage :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamRemoteStorage { return this.vtable.GetISteamRemoteStorage(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamScreenshots :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamScreenshots { return this.vtable.GetISteamScreenshots(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamGameSearch :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameSearch { return this.vtable.GetISteamGameSearch(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_RunFrame :: inline (this: *ISteamClient) { this.vtable.RunFrame(this); }

ISteamClient_GetIPCCallCount :: inline (this: *ISteamClient) -> uint32 { return this.vtable.GetIPCCallCount(this); }

ISteamClient_SetWarningMessageHook :: inline (this: *ISteamClient, pFunction: SteamAPIWarningMessageHook_t) { this.vtable.SetWarningMessageHook(this, pFunction); }

ISteamClient_BShutdownIfAllPipesClosed :: inline (this: *ISteamClient) -> bool { return this.vtable.BShutdownIfAllPipesClosed(this); }

ISteamClient_GetISteamHTTP :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamHTTP { return this.vtable.GetISteamHTTP(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamController :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamController { return this.vtable.GetISteamController(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamUGC :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUGC { return this.vtable.GetISteamUGC(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamMusic :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMusic { return this.vtable.GetISteamMusic(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamMusicRemote :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMusicRemote { return this.vtable.GetISteamMusicRemote(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamHTMLSurface :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamHTMLSurface { return this.vtable.GetISteamHTMLSurface(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_DEPRECATED_Set_SteamAPI_CPostAPIResultInProcess :: inline (this: *ISteamClient, unknown0: #type () -> void #c_call) { this.vtable.DEPRECATED_Set_SteamAPI_CPostAPIResultInProcess(this, unknown0); }
ISteamClient_DEPRECATED_Remove_SteamAPI_CPostAPIResultInProcess :: inline (this: *ISteamClient, unknown0: #type () -> void #c_call) { this.vtable.DEPRECATED_Remove_SteamAPI_CPostAPIResultInProcess(this, unknown0); }
ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess :: inline (this: *ISteamClient, func: SteamAPI_CheckCallbackRegistered_t) { this.vtable.Set_SteamAPI_CCheckCallbackRegisteredInProcess(this, func); }

ISteamClient_GetISteamInventory :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamInventory { return this.vtable.GetISteamInventory(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamVideo :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamVideo { return this.vtable.GetISteamVideo(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamParentalSettings :: inline (this: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamParentalSettings { return this.vtable.GetISteamParentalSettings(this, hSteamuser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamInput :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamInput { return this.vtable.GetISteamInput(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamParties :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamParties { return this.vtable.GetISteamParties(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_GetISteamRemotePlay :: inline (this: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamRemotePlay { return this.vtable.GetISteamRemotePlay(this, hSteamUser, hSteamPipe, pchVersion); }

ISteamClient_DestroyAllInterfaces :: inline (this: *ISteamClient) { this.vtable.DestroyAllInterfaces(this); }

vtable :: (obj: *ISteamClient) -> *ISteamClient_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Functions for accessing and manipulating a steam account
//			associated with one client instance
//-----------------------------------------------------------------------------
ISteamUser :: struct {
    vtable: *ISteamUser_VTable;
}
ISteamUser_VTable :: struct #type_info_none {
    GetHSteamUser: (this: *ISteamUser) -> HSteamUser #cpp_method;

    BLoggedOn: (this: *ISteamUser) -> bool #cpp_method;

    GetSteamID: (this: *ISteamUser) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    InitiateGameConnection_DEPRECATED: (this: *ISteamUser, pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> s32 #cpp_method;

    TerminateGameConnection_DEPRECATED: (this: *ISteamUser, unIPServer: uint32, usPortServer: uint16) -> void #cpp_method;

    TrackAppUsageEvent: (this: *ISteamUser, gameID: CGameID, eAppUsageEvent: s32, pchExtraInfo: *u8 = "") -> void #cpp_method;

    GetUserDataFolder: (this: *ISteamUser, pchBuffer: *u8, cubBuffer: s32) -> bool #cpp_method;

    StartVoiceRecording: (this: *ISteamUser) -> void #cpp_method;

    StopVoiceRecording: (this: *ISteamUser) -> void #cpp_method;

    GetAvailableVoice: (this: *ISteamUser, pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32 = null, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32 = 0) -> EVoiceResult #cpp_method;

    GetVoice: (this: *ISteamUser, bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated := false, pUncompressedDestBuffer_Deprecated: *void = null, cbUncompressedDestBufferSize_Deprecated: uint32 = 0, nUncompressBytesWritten_Deprecated: *uint32 = null, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32 = 0) -> EVoiceResult #cpp_method;

    DecompressVoice: (this: *ISteamUser, pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult #cpp_method;

    GetVoiceOptimalSampleRate: (this: *ISteamUser) -> uint32 #cpp_method;

    GetAuthSessionTicket: (this: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32, pSteamNetworkingIdentity: *SteamNetworkingIdentity) -> HAuthTicket #cpp_method;

    GetAuthTicketForWebApi: (this: *ISteamUser, pchIdentity: *u8) -> HAuthTicket #cpp_method;

    BeginAuthSession: (this: *ISteamUser, pAuthTicket: *void, cbAuthTicket: s32, steamID: CSteamID) -> EBeginAuthSessionResult #cpp_method;

    EndAuthSession: (this: *ISteamUser, steamID: CSteamID) -> void #cpp_method;

    CancelAuthTicket: (this: *ISteamUser, hAuthTicket: HAuthTicket) -> void #cpp_method;

    UserHasLicenseForApp: (this: *ISteamUser, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult #cpp_method;

    BIsBehindNAT: (this: *ISteamUser) -> bool #cpp_method;

    AdvertiseGame: (this: *ISteamUser, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16) -> void #cpp_method;

    RequestEncryptedAppTicket: (this: *ISteamUser, pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t #cpp_method;

    GetEncryptedAppTicket: (this: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool #cpp_method;

    GetGameBadgeLevel: (this: *ISteamUser, nSeries: s32, bFoil: bool) -> s32 #cpp_method;

    GetPlayerSteamLevel: (this: *ISteamUser) -> s32 #cpp_method;

    RequestStoreAuthURL: (this: *ISteamUser, pchRedirectURL: *u8) -> SteamAPICall_t #cpp_method;

    BIsPhoneVerified: (this: *ISteamUser) -> bool #cpp_method;

    BIsTwoFactorEnabled: (this: *ISteamUser) -> bool #cpp_method;

    BIsPhoneIdentifying: (this: *ISteamUser) -> bool #cpp_method;

    BIsPhoneRequiringVerification: (this: *ISteamUser) -> bool #cpp_method;

    GetMarketEligibility: (this: *ISteamUser) -> SteamAPICall_t #cpp_method;

    GetDurationControl: (this: *ISteamUser) -> SteamAPICall_t #cpp_method;

    BSetDurationControlOnlineState: (this: *ISteamUser, eNewState: EDurationControlOnlineState) -> bool #cpp_method;
}

ISteamUser_GetHSteamUser :: inline (this: *ISteamUser) -> HSteamUser { return this.vtable.GetHSteamUser(this); }

ISteamUser_BLoggedOn :: inline (this: *ISteamUser) -> bool { return this.vtable.BLoggedOn(this); }

ISteamUser_GetSteamID :: inline (this: *ISteamUser) -> CSteamID { return this.vtable.GetSteamID(this); }

ISteamUser_InitiateGameConnection_DEPRECATED :: inline (this: *ISteamUser, pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> s32 { return this.vtable.InitiateGameConnection_DEPRECATED(this, pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure); }

ISteamUser_TerminateGameConnection_DEPRECATED :: inline (this: *ISteamUser, unIPServer: uint32, usPortServer: uint16) { this.vtable.TerminateGameConnection_DEPRECATED(this, unIPServer, usPortServer); }

ISteamUser_TrackAppUsageEvent :: inline (this: *ISteamUser, gameID: CGameID, eAppUsageEvent: s32, pchExtraInfo: *u8 = "") { this.vtable.TrackAppUsageEvent(this, gameID, eAppUsageEvent, pchExtraInfo); }

ISteamUser_GetUserDataFolder :: inline (this: *ISteamUser, pchBuffer: *u8, cubBuffer: s32) -> bool { return this.vtable.GetUserDataFolder(this, pchBuffer, cubBuffer); }

ISteamUser_StartVoiceRecording :: inline (this: *ISteamUser) { this.vtable.StartVoiceRecording(this); }

ISteamUser_StopVoiceRecording :: inline (this: *ISteamUser) { this.vtable.StopVoiceRecording(this); }

ISteamUser_GetAvailableVoice :: inline (this: *ISteamUser, pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32 = null, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32 = 0) -> EVoiceResult { return this.vtable.GetAvailableVoice(this, pcbCompressed, pcbUncompressed_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated); }

ISteamUser_GetVoice :: inline (this: *ISteamUser, bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated := false, pUncompressedDestBuffer_Deprecated: *void = null, cbUncompressedDestBufferSize_Deprecated: uint32 = 0, nUncompressBytesWritten_Deprecated: *uint32 = null, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32 = 0) -> EVoiceResult { return this.vtable.GetVoice(this, bWantCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, bWantUncompressed_Deprecated, pUncompressedDestBuffer_Deprecated, cbUncompressedDestBufferSize_Deprecated, nUncompressBytesWritten_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated); }

ISteamUser_DecompressVoice :: inline (this: *ISteamUser, pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult { return this.vtable.DecompressVoice(this, pCompressed, cbCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, nDesiredSampleRate); }

ISteamUser_GetVoiceOptimalSampleRate :: inline (this: *ISteamUser) -> uint32 { return this.vtable.GetVoiceOptimalSampleRate(this); }

ISteamUser_GetAuthSessionTicket :: inline (this: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32, pSteamNetworkingIdentity: *SteamNetworkingIdentity) -> HAuthTicket { return this.vtable.GetAuthSessionTicket(this, pTicket, cbMaxTicket, pcbTicket, pSteamNetworkingIdentity); }

ISteamUser_GetAuthTicketForWebApi :: inline (this: *ISteamUser, pchIdentity: *u8) -> HAuthTicket { return this.vtable.GetAuthTicketForWebApi(this, pchIdentity); }

ISteamUser_BeginAuthSession :: inline (this: *ISteamUser, pAuthTicket: *void, cbAuthTicket: s32, steamID: CSteamID) -> EBeginAuthSessionResult { return this.vtable.BeginAuthSession(this, pAuthTicket, cbAuthTicket, steamID); }

ISteamUser_EndAuthSession :: inline (this: *ISteamUser, steamID: CSteamID) { this.vtable.EndAuthSession(this, steamID); }

ISteamUser_CancelAuthTicket :: inline (this: *ISteamUser, hAuthTicket: HAuthTicket) { this.vtable.CancelAuthTicket(this, hAuthTicket); }

ISteamUser_UserHasLicenseForApp :: inline (this: *ISteamUser, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult { return this.vtable.UserHasLicenseForApp(this, steamID, appID); }

ISteamUser_BIsBehindNAT :: inline (this: *ISteamUser) -> bool { return this.vtable.BIsBehindNAT(this); }

ISteamUser_AdvertiseGame :: inline (this: *ISteamUser, steamIDGameServer: CSteamID, unIPServer: uint32, usPortServer: uint16) { this.vtable.AdvertiseGame(this, steamIDGameServer, unIPServer, usPortServer); }

ISteamUser_RequestEncryptedAppTicket :: inline (this: *ISteamUser, pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t { return this.vtable.RequestEncryptedAppTicket(this, pDataToInclude, cbDataToInclude); }

ISteamUser_GetEncryptedAppTicket :: inline (this: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool { return this.vtable.GetEncryptedAppTicket(this, pTicket, cbMaxTicket, pcbTicket); }

ISteamUser_GetGameBadgeLevel :: inline (this: *ISteamUser, nSeries: s32, bFoil: bool) -> s32 { return this.vtable.GetGameBadgeLevel(this, nSeries, bFoil); }

ISteamUser_GetPlayerSteamLevel :: inline (this: *ISteamUser) -> s32 { return this.vtable.GetPlayerSteamLevel(this); }

ISteamUser_RequestStoreAuthURL :: inline (this: *ISteamUser, pchRedirectURL: *u8) -> SteamAPICall_t { return this.vtable.RequestStoreAuthURL(this, pchRedirectURL); }

ISteamUser_BIsPhoneVerified :: inline (this: *ISteamUser) -> bool { return this.vtable.BIsPhoneVerified(this); }

ISteamUser_BIsTwoFactorEnabled :: inline (this: *ISteamUser) -> bool { return this.vtable.BIsTwoFactorEnabled(this); }

ISteamUser_BIsPhoneIdentifying :: inline (this: *ISteamUser) -> bool { return this.vtable.BIsPhoneIdentifying(this); }

ISteamUser_BIsPhoneRequiringVerification :: inline (this: *ISteamUser) -> bool { return this.vtable.BIsPhoneRequiringVerification(this); }

ISteamUser_GetMarketEligibility :: inline (this: *ISteamUser) -> SteamAPICall_t { return this.vtable.GetMarketEligibility(this); }

ISteamUser_GetDurationControl :: inline (this: *ISteamUser) -> SteamAPICall_t { return this.vtable.GetDurationControl(this); }

ISteamUser_BSetDurationControlOnlineState :: inline (this: *ISteamUser, eNewState: EDurationControlOnlineState) -> bool { return this.vtable.BSetDurationControlOnlineState(this, eNewState); }

vtable :: (obj: *ISteamUser) -> *ISteamUser_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Called when an authenticated connection to the Steam back-end has been established.
//			This means the Steam client now has a working connection to the Steam servers.
//			Usually this will have occurred before the game has launched, and should
//			only be seen if the user has dropped connection due to a networking issue
//			or a Steam server update.
//-----------------------------------------------------------------------------
SteamServersConnected_t :: struct {
    anon_enum_39 :: enum s32 {
        k_iCallback :: 101;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// Purpose: called when a connection attempt has failed
//			this will occur periodically if the Steam client is not connected,
//			and has failed in it's retry to establish a connection
//-----------------------------------------------------------------------------
SteamServerConnectFailure_t :: struct {
    anon_enum_40 :: enum s32 {
        k_iCallback :: 102;
    }
    m_eResult:        EResult;
    m_bStillRetrying: bool;
}

//-----------------------------------------------------------------------------
// Purpose: called if the client has lost connection to the Steam servers
//			real-time services will be disabled until a matching SteamServersConnected_t has been posted
//-----------------------------------------------------------------------------
SteamServersDisconnected_t :: struct {
    anon_enum_41 :: enum s32 {
        k_iCallback :: 103;
    }
    m_eResult: EResult;
}

//-----------------------------------------------------------------------------
// Purpose: Sent by the Steam server to the client telling it to disconnect from the specified game server,
//			which it may be in the process of or already connected to.
//			The game client should immediately disconnect upon receiving this message.
//			This can usually occur if the user doesn't have rights to play on the game server.
//-----------------------------------------------------------------------------
ClientGameServerDeny_t :: struct {
    anon_enum_42 :: enum s32 {
        k_iCallback :: 113;
    }

    m_uAppID:           uint32;
    m_unGameServerIP:   uint32;
    m_usGameServerPort: uint16;
    m_bSecure:          uint16;
    m_uReason:          uint32;
}

//-----------------------------------------------------------------------------
// Purpose: called when the callback system for this client is in an error state (and has flushed pending callbacks)
//			When getting this message the client should disconnect from Steam, reset any stored Steam state and reconnect.
//			This usually occurs in the rare event the Steam client has some kind of fatal error.
//-----------------------------------------------------------------------------
IPCFailure_t :: struct {
    anon_enum_43 :: enum s32 {
        k_iCallback :: 117;
    }
    EFailureType :: enum s32 {
        EFailureFlushedCallbackQueue :: 0;
        EFailurePipeFail             :: 1;

        k_EFailureFlushedCallbackQueue :: EFailureFlushedCallbackQueue;
        k_EFailurePipeFail             :: EFailurePipeFail;
    }

    m_eFailureType: uint8;
}

//-----------------------------------------------------------------------------
// Purpose: Signaled whenever licenses change
//-----------------------------------------------------------------------------
LicensesUpdated_t :: struct {
    anon_enum_44 :: enum s32 {
        k_iCallback :: 125;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// callback for BeginAuthSession
//-----------------------------------------------------------------------------
ValidateAuthTicketResponse_t :: struct {
    anon_enum_45 :: enum s32 {
        k_iCallback :: 143;
    }
    m_SteamID:              CSteamID;
    m_eAuthSessionResponse: EAuthSessionResponse;
    m_OwnerSteamID:         CSteamID #align 4; // different from m_SteamID if borrowed
}

//-----------------------------------------------------------------------------
// Purpose: called when a user has responded to a microtransaction authorization request
//-----------------------------------------------------------------------------
MicroTxnAuthorizationResponse_t :: struct {
    anon_enum_46 :: enum s32 {
        k_iCallback :: 152;
    }

    m_unAppID:     uint32; // AppID for this microtransaction
    m_ulOrderID:   uint64; // OrderID provided for the microtransaction
    m_bAuthorized: uint8; // if user authorized transaction
}

//-----------------------------------------------------------------------------
// Purpose: Result from RequestEncryptedAppTicket
//-----------------------------------------------------------------------------
EncryptedAppTicketResponse_t :: struct {
    anon_enum_47 :: enum s32 {
        k_iCallback :: 154;
    }

    m_eResult: EResult;
}

//-----------------------------------------------------------------------------
// callback for GetAuthSessionTicket
//-----------------------------------------------------------------------------
GetAuthSessionTicketResponse_t :: struct {
    anon_enum_48 :: enum s32 {
        k_iCallback :: 163;
    }
    m_hAuthTicket: HAuthTicket;
    m_eResult:     EResult;
}

//-----------------------------------------------------------------------------
// Purpose: sent to your game in response to a steam://gamewebcallback/ command
//-----------------------------------------------------------------------------
GameWebCallback_t :: struct {
    anon_enum_49 :: enum s32 {
        k_iCallback :: 164;
    }
    m_szURL: [256] u8;
}

//-----------------------------------------------------------------------------
// Purpose: sent to your game in response to ISteamUser::RequestStoreAuthURL
//-----------------------------------------------------------------------------
StoreAuthURLResponse_t :: struct {
    anon_enum_50 :: enum s32 {
        k_iCallback :: 165;
    }
    m_szURL: [512] u8;
}

//-----------------------------------------------------------------------------
// Purpose: sent in response to ISteamUser::GetMarketEligibility
//-----------------------------------------------------------------------------
MarketEligibilityResponse_t :: struct {
    anon_enum_51 :: enum s32 {
        k_iCallback :: 166;
    }
    m_bAllowed:                   bool;
    m_eNotAllowedReason:          EMarketNotAllowedReasonFlags;
    m_rtAllowedAtTime:            RTime32;

    m_cdaySteamGuardRequiredDays: s32; // The number of days any user is required to have had Steam Guard before they can use the market
    m_cdayNewDeviceCooldown:      s32; // The number of days after initial device authorization a user must wait before using the market on that device
}

//-----------------------------------------------------------------------------
// Purpose: sent for games with enabled anti indulgence / duration control, for
// enabled users. Lets the game know whether the user can keep playing or
// whether the game should exit, and returns info about remaining gameplay time.
//
// This callback is fired asynchronously in response to timers triggering.
// It is also fired in response to calls to GetDurationControl().
//-----------------------------------------------------------------------------
DurationControl_t :: struct {
    anon_enum_52 :: enum s32 {
        k_iCallback :: 167;
    }

    m_eResult:        EResult; // result of call (always k_EResultOK for asynchronous timer-based notifications)
    m_appid:          AppId_t; // appid generating playtime

    m_bApplicable:    bool; // is duration control applicable to user + game combination
    m_csecsLast5h:    int32; // playtime since most recent 5 hour gap in playtime, only counting up to regulatory limit of playtime, in seconds

    m_progress:       EDurationControlProgress; // recommended progress (either everything is fine, or please exit game)
    m_notification:   EDurationControlNotification; // notification to show, if any (always k_EDurationControlNotification_None for API calls)

    m_csecsToday:     int32; // playtime on current calendar day
    m_csecsRemaining: int32; // playtime remaining until the user hits a regulatory limit
}

//-----------------------------------------------------------------------------
// callback for GetTicketForWebApi
//-----------------------------------------------------------------------------
GetTicketForWebApiResponse_t :: struct {
    anon_enum_53 :: enum s32 {
        k_iCallback :: 168;
    }
    m_hAuthTicket:         HAuthTicket;
    m_eResult:             EResult;
    m_cubTicket:           s32;
    k_nCubTicketMaxLength: s32 : 2560;
    m_rgubTicket:          [2560] uint8;
}

//-----------------------------------------------------------------------------
// Purpose: set of relationships to other users
//-----------------------------------------------------------------------------
EFriendRelationship :: enum s32 {
    EFriendRelationshipNone                 :: 0;
    EFriendRelationshipBlocked              :: 1;
    EFriendRelationshipRequestRecipient     :: 2;
    EFriendRelationshipFriend               :: 3;
    EFriendRelationshipRequestInitiator     :: 4;
    EFriendRelationshipIgnored              :: 5;
    EFriendRelationshipIgnoredFriend        :: 6;
    EFriendRelationshipSuggested_DEPRECATED :: 7;

    EFriendRelationshipMax                  :: 8;

    k_EFriendRelationshipNone                 :: EFriendRelationshipNone;
    k_EFriendRelationshipBlocked              :: EFriendRelationshipBlocked;
    k_EFriendRelationshipRequestRecipient     :: EFriendRelationshipRequestRecipient;
    k_EFriendRelationshipFriend               :: EFriendRelationshipFriend;
    k_EFriendRelationshipRequestInitiator     :: EFriendRelationshipRequestInitiator;
    k_EFriendRelationshipIgnored              :: EFriendRelationshipIgnored;
    k_EFriendRelationshipIgnoredFriend        :: EFriendRelationshipIgnoredFriend;
    k_EFriendRelationshipSuggested_DEPRECATED :: EFriendRelationshipSuggested_DEPRECATED;

    k_EFriendRelationshipMax                  :: EFriendRelationshipMax;
}

// maximum length of friend group name (not including terminating nul!)
k_cchMaxFriendsGroupName: s32 : 64;

// maximum number of groups a single user is allowed
k_cFriendsGroupLimit: s32 : 100;

// friends group identifier type
FriendsGroupID_t :: int16;

// invalid friends group identifier constant
k_FriendsGroupID_Invalid: FriendsGroupID_t : -1;

k_cEnumerateFollowersMax: s32 : 50;

//-----------------------------------------------------------------------------
// Purpose: list of states a friend can be in
//-----------------------------------------------------------------------------
EPersonaState :: enum s32 {
    EPersonaStateOffline        :: 0;
    EPersonaStateOnline         :: 1;
    EPersonaStateBusy           :: 2;
    EPersonaStateAway           :: 3;
    EPersonaStateSnooze         :: 4;
    EPersonaStateLookingToTrade :: 5;
    EPersonaStateLookingToPlay  :: 6;
    EPersonaStateInvisible      :: 7;
    EPersonaStateMax            :: 8;

    k_EPersonaStateOffline        :: EPersonaStateOffline;
    k_EPersonaStateOnline         :: EPersonaStateOnline;
    k_EPersonaStateBusy           :: EPersonaStateBusy;
    k_EPersonaStateAway           :: EPersonaStateAway;
    k_EPersonaStateSnooze         :: EPersonaStateSnooze;
    k_EPersonaStateLookingToTrade :: EPersonaStateLookingToTrade;
    k_EPersonaStateLookingToPlay  :: EPersonaStateLookingToPlay;
    k_EPersonaStateInvisible      :: EPersonaStateInvisible;
    k_EPersonaStateMax            :: EPersonaStateMax;
}

//-----------------------------------------------------------------------------
// Purpose: flags for enumerating friends list, or quickly checking a the relationship between users
//-----------------------------------------------------------------------------
EFriendFlags :: enum s32 {
    EFriendFlagNone                 :: 0;
    EFriendFlagBlocked              :: 1;
    EFriendFlagFriendshipRequested  :: 2;
    EFriendFlagImmediate            :: 4;
    EFriendFlagClanMember           :: 8;
    EFriendFlagOnGameServer         :: 16;

    EFriendFlagRequestingFriendship :: 128;
    EFriendFlagRequestingInfo       :: 256;
    EFriendFlagIgnored              :: 512;
    EFriendFlagIgnoredFriend        :: 1024;

    EFriendFlagChatMember           :: 4096;
    EFriendFlagAll                  :: 65535;

    k_EFriendFlagNone                 :: EFriendFlagNone;
    k_EFriendFlagBlocked              :: EFriendFlagBlocked;
    k_EFriendFlagFriendshipRequested  :: EFriendFlagFriendshipRequested;
    k_EFriendFlagImmediate            :: EFriendFlagImmediate;
    k_EFriendFlagClanMember           :: EFriendFlagClanMember;
    k_EFriendFlagOnGameServer         :: EFriendFlagOnGameServer;

    k_EFriendFlagRequestingFriendship :: EFriendFlagRequestingFriendship;
    k_EFriendFlagRequestingInfo       :: EFriendFlagRequestingInfo;
    k_EFriendFlagIgnored              :: EFriendFlagIgnored;
    k_EFriendFlagIgnoredFriend        :: EFriendFlagIgnoredFriend;

    k_EFriendFlagChatMember           :: EFriendFlagChatMember;
    k_EFriendFlagAll                  :: EFriendFlagAll;
}

FriendGameInfo_t :: struct {
    m_gameID:       CGameID;
    m_unGameIP:     uint32;
    m_usGamePort:   uint16;
    m_usQueryPort:  uint16;
    m_steamIDLobby: CSteamID;
}

k_usFriendGameInfoQueryPort_NotInitialized: uint16 : 65535; // We haven't asked the GS for this query port's actual value yet.  Was #define QUERY_PORT_NOT_INITIALIZED in older versions of Steamworks SDK.
k_usFriendGameInfoQueryPort_Error: uint16 : 65534; // We were unable to get the query port for this server.  Was #define QUERY_PORT_ERROR in older versions of Steamworks SDK.

// maximum number of characters in a user's name. Two flavors; one for UTF-8 and one for UTF-16.
// The UTF-8 version has to be very generous to accomodate characters that get large when encoded
// in UTF-8.
k_1 :: enum s32 {
    cchPersonaNameMax  :: 128;
    cwchPersonaNameMax :: 32;

    k_cchPersonaNameMax  :: cchPersonaNameMax;
    k_cwchPersonaNameMax :: cwchPersonaNameMax;
}

//-----------------------------------------------------------------------------
// Purpose: user restriction flags
//-----------------------------------------------------------------------------
EUserRestriction :: enum s32 {
    nUserRestrictionNone        :: 0;
    nUserRestrictionUnknown     :: 1;
    nUserRestrictionAnyChat     :: 2;
    nUserRestrictionVoiceChat   :: 4;
    nUserRestrictionGroupChat   :: 8;
    nUserRestrictionRating      :: 16;
    nUserRestrictionGameInvites :: 32;
    nUserRestrictionTrading     :: 64;

    k_nUserRestrictionNone        :: nUserRestrictionNone;
    k_nUserRestrictionUnknown     :: nUserRestrictionUnknown;
    k_nUserRestrictionAnyChat     :: nUserRestrictionAnyChat;
    k_nUserRestrictionVoiceChat   :: nUserRestrictionVoiceChat;
    k_nUserRestrictionGroupChat   :: nUserRestrictionGroupChat;
    k_nUserRestrictionRating      :: nUserRestrictionRating;
    k_nUserRestrictionGameInvites :: nUserRestrictionGameInvites;
    k_nUserRestrictionTrading     :: nUserRestrictionTrading;
}

// size limit on chat room or member metadata
k_cubChatMetadataMax: uint32 : 8192;

// size limits on Rich Presence data
anon_enum_54 :: enum s32 {
    k_cchMaxRichPresenceKeys :: 30;
}
anon_enum_55 :: enum s32 {
    k_cchMaxRichPresenceKeyLength :: 64;
}
anon_enum_56 :: enum s32 {
    k_cchMaxRichPresenceValueLength :: 256;
}

// These values are passed as parameters to the store
EOverlayToStoreFlag :: enum s32 {
    None             :: 0;
    AddToCart        :: 1;
    AddToCartAndShow :: 2;

    k_EOverlayToStoreFlag_None             :: None;
    k_EOverlayToStoreFlag_AddToCart        :: AddToCart;
    k_EOverlayToStoreFlag_AddToCartAndShow :: AddToCartAndShow;
}

//-----------------------------------------------------------------------------
// Purpose: Tells Steam where to place the browser window inside the overlay
//-----------------------------------------------------------------------------
EActivateGameOverlayToWebPageMode :: enum s32 {
    Default :: 0;

    Modal   :: 1;

    k_EActivateGameOverlayToWebPageMode_Default :: Default;

    k_EActivateGameOverlayToWebPageMode_Modal   :: Modal;
}

//-----------------------------------------------------------------------------
// Purpose: See GetProfileItemPropertyString and GetProfileItemPropertyUint
//-----------------------------------------------------------------------------
ECommunityProfileItemType :: enum s32 {
    AnimatedAvatar        :: 0;
    AvatarFrame           :: 1;
    ProfileModifier       :: 2;
    ProfileBackground     :: 3;
    MiniProfileBackground :: 4;

    k_ECommunityProfileItemType_AnimatedAvatar        :: AnimatedAvatar;
    k_ECommunityProfileItemType_AvatarFrame           :: AvatarFrame;
    k_ECommunityProfileItemType_ProfileModifier       :: ProfileModifier;
    k_ECommunityProfileItemType_ProfileBackground     :: ProfileBackground;
    k_ECommunityProfileItemType_MiniProfileBackground :: MiniProfileBackground;
}

ECommunityProfileItemProperty :: enum s32 {
    ImageSmall     :: 0;
    ImageLarge     :: 1;
    InternalName   :: 2;
    Title          :: 3;
    Description    :: 4;
    AppID          :: 5;
    TypeID         :: 6;
    Class          :: 7;
    MovieWebM      :: 8;
    MovieMP4       :: 9;
    MovieWebMSmall :: 10;
    MovieMP4Small  :: 11;

    k_ECommunityProfileItemProperty_ImageSmall     :: ImageSmall;
    k_ECommunityProfileItemProperty_ImageLarge     :: ImageLarge;
    k_ECommunityProfileItemProperty_InternalName   :: InternalName;
    k_ECommunityProfileItemProperty_Title          :: Title;
    k_ECommunityProfileItemProperty_Description    :: Description;
    k_ECommunityProfileItemProperty_AppID          :: AppID;
    k_ECommunityProfileItemProperty_TypeID         :: TypeID;
    k_ECommunityProfileItemProperty_Class          :: Class;
    k_ECommunityProfileItemProperty_MovieWebM      :: MovieWebM;
    k_ECommunityProfileItemProperty_MovieMP4       :: MovieMP4;
    k_ECommunityProfileItemProperty_MovieWebMSmall :: MovieWebMSmall;
    k_ECommunityProfileItemProperty_MovieMP4Small  :: MovieMP4Small;
}

//-----------------------------------------------------------------------------
// Purpose: interface to accessing information about individual users,
//			that can be a friend, in a group, on a game server or in a lobby with the local user
//-----------------------------------------------------------------------------
ISteamFriends :: struct {
    vtable: *ISteamFriends_VTable;
}
ISteamFriends_VTable :: struct #type_info_none {
    GetPersonaName: (this: *ISteamFriends) -> *u8 #cpp_method;

    SetPersonaName: (this: *ISteamFriends, pchPersonaName: *u8) -> SteamAPICall_t #cpp_method;

    GetPersonaState: (this: *ISteamFriends) -> EPersonaState #cpp_method;

    GetFriendCount: (this: *ISteamFriends, iFriendFlags: s32) -> s32 #cpp_method;

    GetFriendByIndex: (this: *ISteamFriends, iFriend: s32, iFriendFlags: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    GetFriendRelationship: (this: *ISteamFriends, steamIDFriend: CSteamID) -> EFriendRelationship #cpp_method;

    GetFriendPersonaState: (this: *ISteamFriends, steamIDFriend: CSteamID) -> EPersonaState #cpp_method;

    GetFriendPersonaName: (this: *ISteamFriends, steamIDFriend: CSteamID) -> *u8 #cpp_method;

    GetFriendGamePlayed: (this: *ISteamFriends, steamIDFriend: CSteamID, pFriendGameInfo: *FriendGameInfo_t) -> bool #cpp_method;

    GetFriendPersonaNameHistory: (this: *ISteamFriends, steamIDFriend: CSteamID, iPersonaName: s32) -> *u8 #cpp_method;

    GetFriendSteamLevel: (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 #cpp_method;

    GetPlayerNickname: (this: *ISteamFriends, steamIDPlayer: CSteamID) -> *u8 #cpp_method;

    GetFriendsGroupCount: (this: *ISteamFriends) -> s32 #cpp_method;

    GetFriendsGroupIDByIndex: (this: *ISteamFriends, iFG: s32) -> FriendsGroupID_t #cpp_method;

    GetFriendsGroupName: (this: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> *u8 #cpp_method;

    GetFriendsGroupMembersCount: (this: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> s32 #cpp_method;

    GetFriendsGroupMembersList: (this: *ISteamFriends, friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) -> void #cpp_method;

    HasFriend: (this: *ISteamFriends, steamIDFriend: CSteamID, iFriendFlags: s32) -> bool #cpp_method;

    GetClanCount: (this: *ISteamFriends) -> s32 #cpp_method;
    GetClanByIndex: (this: *ISteamFriends, iClan: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;
    GetClanName: (this: *ISteamFriends, steamIDClan: CSteamID) -> *u8 #cpp_method;
    GetClanTag: (this: *ISteamFriends, steamIDClan: CSteamID) -> *u8 #cpp_method;

    GetClanActivityCounts: (this: *ISteamFriends, steamIDClan: CSteamID, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool #cpp_method;

    DownloadClanActivityCounts: (this: *ISteamFriends, psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t #cpp_method;

    GetFriendCountFromSource: (this: *ISteamFriends, steamIDSource: CSteamID) -> s32 #cpp_method;
    GetFriendFromSourceByIndex: (this: *ISteamFriends, steamIDSource: CSteamID, iFriend: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    IsUserInSource: (this: *ISteamFriends, steamIDUser: CSteamID, steamIDSource: CSteamID) -> bool #cpp_method;

    SetInGameVoiceSpeaking: (this: *ISteamFriends, steamIDUser: CSteamID, bSpeaking: bool) -> void #cpp_method;

    ActivateGameOverlay: (this: *ISteamFriends, pchDialog: *u8) -> void #cpp_method;

    ActivateGameOverlayToUser: (this: *ISteamFriends, pchDialog: *u8, steamID: CSteamID) -> void #cpp_method;

    ActivateGameOverlayToWebPage: (this: *ISteamFriends, pchURL: *u8, eMode: EActivateGameOverlayToWebPageMode = .Default) -> void #cpp_method;

    ActivateGameOverlayToStore: (this: *ISteamFriends, nAppID: AppId_t, eFlag: EOverlayToStoreFlag) -> void #cpp_method;

    SetPlayedWith: (this: *ISteamFriends, steamIDUserPlayedWith: CSteamID) -> void #cpp_method;

    ActivateGameOverlayInviteDialog: (this: *ISteamFriends, steamIDLobby: CSteamID) -> void #cpp_method;

    GetSmallFriendAvatar: (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 #cpp_method;

    GetMediumFriendAvatar: (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 #cpp_method;

    GetLargeFriendAvatar: (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 #cpp_method;

    RequestUserInformation: (this: *ISteamFriends, steamIDUser: CSteamID, bRequireNameOnly: bool) -> bool #cpp_method;

    RequestClanOfficerList: (this: *ISteamFriends, steamIDClan: CSteamID) -> SteamAPICall_t #cpp_method;

    GetClanOwner: (this: *ISteamFriends, steamIDClan: CSteamID) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    GetClanOfficerCount: (this: *ISteamFriends, steamIDClan: CSteamID) -> s32 #cpp_method;

    GetClanOfficerByIndex: (this: *ISteamFriends, steamIDClan: CSteamID, iOfficer: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    GetUserRestrictions: (this: *ISteamFriends) -> uint32 #cpp_method;

    SetRichPresence: (this: *ISteamFriends, pchKey: *u8, pchValue: *u8) -> bool #cpp_method;
    ClearRichPresence: (this: *ISteamFriends) -> void #cpp_method;
    GetFriendRichPresence: (this: *ISteamFriends, steamIDFriend: CSteamID, pchKey: *u8) -> *u8 #cpp_method;
    GetFriendRichPresenceKeyCount: (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 #cpp_method;
    GetFriendRichPresenceKeyByIndex: (this: *ISteamFriends, steamIDFriend: CSteamID, iKey: s32) -> *u8 #cpp_method;

    RequestFriendRichPresence: (this: *ISteamFriends, steamIDFriend: CSteamID) -> void #cpp_method;

    InviteUserToGame: (this: *ISteamFriends, steamIDFriend: CSteamID, pchConnectString: *u8) -> bool #cpp_method;

    GetCoplayFriendCount: (this: *ISteamFriends) -> s32 #cpp_method;
    GetCoplayFriend: (this: *ISteamFriends, iCoplayFriend: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;
    GetFriendCoplayTime: (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 #cpp_method;
    GetFriendCoplayGame: (this: *ISteamFriends, steamIDFriend: CSteamID) -> AppId_t #cpp_method;

    JoinClanChatRoom: (this: *ISteamFriends, steamIDClan: CSteamID) -> SteamAPICall_t #cpp_method;
    LeaveClanChatRoom: (this: *ISteamFriends, steamIDClan: CSteamID) -> bool #cpp_method;
    GetClanChatMemberCount: (this: *ISteamFriends, steamIDClan: CSteamID) -> s32 #cpp_method;
    GetChatMemberByIndex: (this: *ISteamFriends, steamIDClan: CSteamID, iUser: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;
    SendClanChatMessage: (this: *ISteamFriends, steamIDClanChat: CSteamID, pchText: *u8) -> bool #cpp_method;
    GetClanChatMessage: (this: *ISteamFriends, steamIDClanChat: CSteamID, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 #cpp_method;
    IsClanChatAdmin: (this: *ISteamFriends, steamIDClanChat: CSteamID, steamIDUser: CSteamID) -> bool #cpp_method;

    IsClanChatWindowOpenInSteam: (this: *ISteamFriends, steamIDClanChat: CSteamID) -> bool #cpp_method;
    OpenClanChatWindowInSteam: (this: *ISteamFriends, steamIDClanChat: CSteamID) -> bool #cpp_method;
    CloseClanChatWindowInSteam: (this: *ISteamFriends, steamIDClanChat: CSteamID) -> bool #cpp_method;

    SetListenForFriendsMessages: (this: *ISteamFriends, bInterceptEnabled: bool) -> bool #cpp_method;
    ReplyToFriendMessage: (this: *ISteamFriends, steamIDFriend: CSteamID, pchMsgToSend: *u8) -> bool #cpp_method;
    GetFriendMessage: (this: *ISteamFriends, steamIDFriend: CSteamID, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 #cpp_method;

    GetFollowerCount: (this: *ISteamFriends, steamID: CSteamID) -> SteamAPICall_t #cpp_method;

    IsFollowing: (this: *ISteamFriends, steamID: CSteamID) -> SteamAPICall_t #cpp_method;

    EnumerateFollowingList: (this: *ISteamFriends, unStartIndex: uint32) -> SteamAPICall_t #cpp_method;

    IsClanPublic: (this: *ISteamFriends, steamIDClan: CSteamID) -> bool #cpp_method;
    IsClanOfficialGameGroup: (this: *ISteamFriends, steamIDClan: CSteamID) -> bool #cpp_method;

    GetNumChatsWithUnreadPriorityMessages: (this: *ISteamFriends) -> s32 #cpp_method;

    ActivateGameOverlayRemotePlayTogetherInviteDialog: (this: *ISteamFriends, steamIDLobby: CSteamID) -> void #cpp_method;

    RegisterProtocolInOverlayBrowser: (this: *ISteamFriends, pchProtocol: *u8) -> bool #cpp_method;

    ActivateGameOverlayInviteDialogConnectString: (this: *ISteamFriends, pchConnectString: *u8) -> void #cpp_method;

    RequestEquippedProfileItems: (this: *ISteamFriends, steamID: CSteamID) -> SteamAPICall_t #cpp_method;
    BHasEquippedProfileItem: (this: *ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType) -> bool #cpp_method;
    GetProfileItemPropertyString: (this: *ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> *u8 #cpp_method;
    GetProfileItemPropertyUint: (this: *ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> uint32 #cpp_method;
}

ISteamFriends_GetPersonaName :: inline (this: *ISteamFriends) -> *u8 { return this.vtable.GetPersonaName(this); }

ISteamFriends_SetPersonaName :: inline (this: *ISteamFriends, pchPersonaName: *u8) -> SteamAPICall_t { return this.vtable.SetPersonaName(this, pchPersonaName); }

ISteamFriends_GetPersonaState :: inline (this: *ISteamFriends) -> EPersonaState { return this.vtable.GetPersonaState(this); }

ISteamFriends_GetFriendCount :: inline (this: *ISteamFriends, iFriendFlags: s32) -> s32 { return this.vtable.GetFriendCount(this, iFriendFlags); }

ISteamFriends_GetFriendByIndex :: inline (this: *ISteamFriends, iFriend: s32, iFriendFlags: s32) -> CSteamID { return this.vtable.GetFriendByIndex(this, iFriend, iFriendFlags); }

ISteamFriends_GetFriendRelationship :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> EFriendRelationship { return this.vtable.GetFriendRelationship(this, steamIDFriend); }

ISteamFriends_GetFriendPersonaState :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> EPersonaState { return this.vtable.GetFriendPersonaState(this, steamIDFriend); }

ISteamFriends_GetFriendPersonaName :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> *u8 { return this.vtable.GetFriendPersonaName(this, steamIDFriend); }

ISteamFriends_GetFriendGamePlayed :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, pFriendGameInfo: *FriendGameInfo_t) -> bool { return this.vtable.GetFriendGamePlayed(this, steamIDFriend, pFriendGameInfo); }

ISteamFriends_GetFriendPersonaNameHistory :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, iPersonaName: s32) -> *u8 { return this.vtable.GetFriendPersonaNameHistory(this, steamIDFriend, iPersonaName); }

ISteamFriends_GetFriendSteamLevel :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 { return this.vtable.GetFriendSteamLevel(this, steamIDFriend); }

ISteamFriends_GetPlayerNickname :: inline (this: *ISteamFriends, steamIDPlayer: CSteamID) -> *u8 { return this.vtable.GetPlayerNickname(this, steamIDPlayer); }

ISteamFriends_GetFriendsGroupCount :: inline (this: *ISteamFriends) -> s32 { return this.vtable.GetFriendsGroupCount(this); }

ISteamFriends_GetFriendsGroupIDByIndex :: inline (this: *ISteamFriends, iFG: s32) -> FriendsGroupID_t { return this.vtable.GetFriendsGroupIDByIndex(this, iFG); }

ISteamFriends_GetFriendsGroupName :: inline (this: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> *u8 { return this.vtable.GetFriendsGroupName(this, friendsGroupID); }

ISteamFriends_GetFriendsGroupMembersCount :: inline (this: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> s32 { return this.vtable.GetFriendsGroupMembersCount(this, friendsGroupID); }

ISteamFriends_GetFriendsGroupMembersList :: inline (this: *ISteamFriends, friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) { this.vtable.GetFriendsGroupMembersList(this, friendsGroupID, pOutSteamIDMembers, nMembersCount); }

ISteamFriends_HasFriend :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, iFriendFlags: s32) -> bool { return this.vtable.HasFriend(this, steamIDFriend, iFriendFlags); }

ISteamFriends_GetClanCount :: inline (this: *ISteamFriends) -> s32 { return this.vtable.GetClanCount(this); }
ISteamFriends_GetClanByIndex :: inline (this: *ISteamFriends, iClan: s32) -> CSteamID { return this.vtable.GetClanByIndex(this, iClan); }
ISteamFriends_GetClanName :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> *u8 { return this.vtable.GetClanName(this, steamIDClan); }
ISteamFriends_GetClanTag :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> *u8 { return this.vtable.GetClanTag(this, steamIDClan); }

ISteamFriends_GetClanActivityCounts :: inline (this: *ISteamFriends, steamIDClan: CSteamID, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool { return this.vtable.GetClanActivityCounts(this, steamIDClan, pnOnline, pnInGame, pnChatting); }

ISteamFriends_DownloadClanActivityCounts :: inline (this: *ISteamFriends, psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t { return this.vtable.DownloadClanActivityCounts(this, psteamIDClans, cClansToRequest); }

ISteamFriends_GetFriendCountFromSource :: inline (this: *ISteamFriends, steamIDSource: CSteamID) -> s32 { return this.vtable.GetFriendCountFromSource(this, steamIDSource); }
ISteamFriends_GetFriendFromSourceByIndex :: inline (this: *ISteamFriends, steamIDSource: CSteamID, iFriend: s32) -> CSteamID { return this.vtable.GetFriendFromSourceByIndex(this, steamIDSource, iFriend); }

ISteamFriends_IsUserInSource :: inline (this: *ISteamFriends, steamIDUser: CSteamID, steamIDSource: CSteamID) -> bool { return this.vtable.IsUserInSource(this, steamIDUser, steamIDSource); }

ISteamFriends_SetInGameVoiceSpeaking :: inline (this: *ISteamFriends, steamIDUser: CSteamID, bSpeaking: bool) { this.vtable.SetInGameVoiceSpeaking(this, steamIDUser, bSpeaking); }

ISteamFriends_ActivateGameOverlay :: inline (this: *ISteamFriends, pchDialog: *u8) { this.vtable.ActivateGameOverlay(this, pchDialog); }

ISteamFriends_ActivateGameOverlayToUser :: inline (this: *ISteamFriends, pchDialog: *u8, steamID: CSteamID) { this.vtable.ActivateGameOverlayToUser(this, pchDialog, steamID); }

ISteamFriends_ActivateGameOverlayToWebPage :: inline (this: *ISteamFriends, pchURL: *u8, eMode: EActivateGameOverlayToWebPageMode = .Default) { this.vtable.ActivateGameOverlayToWebPage(this, pchURL, eMode); }

ISteamFriends_ActivateGameOverlayToStore :: inline (this: *ISteamFriends, nAppID: AppId_t, eFlag: EOverlayToStoreFlag) { this.vtable.ActivateGameOverlayToStore(this, nAppID, eFlag); }

ISteamFriends_SetPlayedWith :: inline (this: *ISteamFriends, steamIDUserPlayedWith: CSteamID) { this.vtable.SetPlayedWith(this, steamIDUserPlayedWith); }

ISteamFriends_ActivateGameOverlayInviteDialog :: inline (this: *ISteamFriends, steamIDLobby: CSteamID) { this.vtable.ActivateGameOverlayInviteDialog(this, steamIDLobby); }

ISteamFriends_GetSmallFriendAvatar :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 { return this.vtable.GetSmallFriendAvatar(this, steamIDFriend); }

ISteamFriends_GetMediumFriendAvatar :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 { return this.vtable.GetMediumFriendAvatar(this, steamIDFriend); }

ISteamFriends_GetLargeFriendAvatar :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 { return this.vtable.GetLargeFriendAvatar(this, steamIDFriend); }

ISteamFriends_RequestUserInformation :: inline (this: *ISteamFriends, steamIDUser: CSteamID, bRequireNameOnly: bool) -> bool { return this.vtable.RequestUserInformation(this, steamIDUser, bRequireNameOnly); }

ISteamFriends_RequestClanOfficerList :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> SteamAPICall_t { return this.vtable.RequestClanOfficerList(this, steamIDClan); }

ISteamFriends_GetClanOwner :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> CSteamID { return this.vtable.GetClanOwner(this, steamIDClan); }

ISteamFriends_GetClanOfficerCount :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> s32 { return this.vtable.GetClanOfficerCount(this, steamIDClan); }

ISteamFriends_GetClanOfficerByIndex :: inline (this: *ISteamFriends, steamIDClan: CSteamID, iOfficer: s32) -> CSteamID { return this.vtable.GetClanOfficerByIndex(this, steamIDClan, iOfficer); }

ISteamFriends_GetUserRestrictions :: inline (this: *ISteamFriends) -> uint32 { return this.vtable.GetUserRestrictions(this); }

ISteamFriends_SetRichPresence :: inline (this: *ISteamFriends, pchKey: *u8, pchValue: *u8) -> bool { return this.vtable.SetRichPresence(this, pchKey, pchValue); }
ISteamFriends_ClearRichPresence :: inline (this: *ISteamFriends) { this.vtable.ClearRichPresence(this); }
ISteamFriends_GetFriendRichPresence :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, pchKey: *u8) -> *u8 { return this.vtable.GetFriendRichPresence(this, steamIDFriend, pchKey); }
ISteamFriends_GetFriendRichPresenceKeyCount :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 { return this.vtable.GetFriendRichPresenceKeyCount(this, steamIDFriend); }
ISteamFriends_GetFriendRichPresenceKeyByIndex :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, iKey: s32) -> *u8 { return this.vtable.GetFriendRichPresenceKeyByIndex(this, steamIDFriend, iKey); }

ISteamFriends_RequestFriendRichPresence :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) { this.vtable.RequestFriendRichPresence(this, steamIDFriend); }

ISteamFriends_InviteUserToGame :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, pchConnectString: *u8) -> bool { return this.vtable.InviteUserToGame(this, steamIDFriend, pchConnectString); }

ISteamFriends_GetCoplayFriendCount :: inline (this: *ISteamFriends) -> s32 { return this.vtable.GetCoplayFriendCount(this); }
ISteamFriends_GetCoplayFriend :: inline (this: *ISteamFriends, iCoplayFriend: s32) -> CSteamID { return this.vtable.GetCoplayFriend(this, iCoplayFriend); }
ISteamFriends_GetFriendCoplayTime :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> s32 { return this.vtable.GetFriendCoplayTime(this, steamIDFriend); }
ISteamFriends_GetFriendCoplayGame :: inline (this: *ISteamFriends, steamIDFriend: CSteamID) -> AppId_t { return this.vtable.GetFriendCoplayGame(this, steamIDFriend); }

ISteamFriends_JoinClanChatRoom :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> SteamAPICall_t { return this.vtable.JoinClanChatRoom(this, steamIDClan); }
ISteamFriends_LeaveClanChatRoom :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> bool { return this.vtable.LeaveClanChatRoom(this, steamIDClan); }
ISteamFriends_GetClanChatMemberCount :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> s32 { return this.vtable.GetClanChatMemberCount(this, steamIDClan); }
ISteamFriends_GetChatMemberByIndex :: inline (this: *ISteamFriends, steamIDClan: CSteamID, iUser: s32) -> CSteamID { return this.vtable.GetChatMemberByIndex(this, steamIDClan, iUser); }
ISteamFriends_SendClanChatMessage :: inline (this: *ISteamFriends, steamIDClanChat: CSteamID, pchText: *u8) -> bool { return this.vtable.SendClanChatMessage(this, steamIDClanChat, pchText); }
ISteamFriends_GetClanChatMessage :: inline (this: *ISteamFriends, steamIDClanChat: CSteamID, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 { return this.vtable.GetClanChatMessage(this, steamIDClanChat, iMessage, prgchText, cchTextMax, peChatEntryType, psteamidChatter); }
ISteamFriends_IsClanChatAdmin :: inline (this: *ISteamFriends, steamIDClanChat: CSteamID, steamIDUser: CSteamID) -> bool { return this.vtable.IsClanChatAdmin(this, steamIDClanChat, steamIDUser); }

ISteamFriends_IsClanChatWindowOpenInSteam :: inline (this: *ISteamFriends, steamIDClanChat: CSteamID) -> bool { return this.vtable.IsClanChatWindowOpenInSteam(this, steamIDClanChat); }
ISteamFriends_OpenClanChatWindowInSteam :: inline (this: *ISteamFriends, steamIDClanChat: CSteamID) -> bool { return this.vtable.OpenClanChatWindowInSteam(this, steamIDClanChat); }
ISteamFriends_CloseClanChatWindowInSteam :: inline (this: *ISteamFriends, steamIDClanChat: CSteamID) -> bool { return this.vtable.CloseClanChatWindowInSteam(this, steamIDClanChat); }

ISteamFriends_SetListenForFriendsMessages :: inline (this: *ISteamFriends, bInterceptEnabled: bool) -> bool { return this.vtable.SetListenForFriendsMessages(this, bInterceptEnabled); }
ISteamFriends_ReplyToFriendMessage :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, pchMsgToSend: *u8) -> bool { return this.vtable.ReplyToFriendMessage(this, steamIDFriend, pchMsgToSend); }
ISteamFriends_GetFriendMessage :: inline (this: *ISteamFriends, steamIDFriend: CSteamID, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 { return this.vtable.GetFriendMessage(this, steamIDFriend, iMessageID, pvData, cubData, peChatEntryType); }

ISteamFriends_GetFollowerCount :: inline (this: *ISteamFriends, steamID: CSteamID) -> SteamAPICall_t { return this.vtable.GetFollowerCount(this, steamID); }

ISteamFriends_IsFollowing :: inline (this: *ISteamFriends, steamID: CSteamID) -> SteamAPICall_t { return this.vtable.IsFollowing(this, steamID); }

ISteamFriends_EnumerateFollowingList :: inline (this: *ISteamFriends, unStartIndex: uint32) -> SteamAPICall_t { return this.vtable.EnumerateFollowingList(this, unStartIndex); }

ISteamFriends_IsClanPublic :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> bool { return this.vtable.IsClanPublic(this, steamIDClan); }
ISteamFriends_IsClanOfficialGameGroup :: inline (this: *ISteamFriends, steamIDClan: CSteamID) -> bool { return this.vtable.IsClanOfficialGameGroup(this, steamIDClan); }

ISteamFriends_GetNumChatsWithUnreadPriorityMessages :: inline (this: *ISteamFriends) -> s32 { return this.vtable.GetNumChatsWithUnreadPriorityMessages(this); }

ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: inline (this: *ISteamFriends, steamIDLobby: CSteamID) { this.vtable.ActivateGameOverlayRemotePlayTogetherInviteDialog(this, steamIDLobby); }

ISteamFriends_RegisterProtocolInOverlayBrowser :: inline (this: *ISteamFriends, pchProtocol: *u8) -> bool { return this.vtable.RegisterProtocolInOverlayBrowser(this, pchProtocol); }

ISteamFriends_ActivateGameOverlayInviteDialogConnectString :: inline (this: *ISteamFriends, pchConnectString: *u8) { this.vtable.ActivateGameOverlayInviteDialogConnectString(this, pchConnectString); }

ISteamFriends_RequestEquippedProfileItems :: inline (this: *ISteamFriends, steamID: CSteamID) -> SteamAPICall_t { return this.vtable.RequestEquippedProfileItems(this, steamID); }
ISteamFriends_BHasEquippedProfileItem :: inline (this: *ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType) -> bool { return this.vtable.BHasEquippedProfileItem(this, steamID, itemType); }
ISteamFriends_GetProfileItemPropertyString :: inline (this: *ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> *u8 { return this.vtable.GetProfileItemPropertyString(this, steamID, itemType, prop); }
ISteamFriends_GetProfileItemPropertyUint :: inline (this: *ISteamFriends, steamID: CSteamID, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> uint32 { return this.vtable.GetProfileItemPropertyUint(this, steamID, itemType, prop); }

vtable :: (obj: *ISteamFriends) -> *ISteamFriends_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: called when a friends' status changes
//-----------------------------------------------------------------------------
PersonaStateChange_t :: struct {
    anon_enum_57 :: enum s32 {
        k_iCallback :: 304;
    }

    m_ulSteamID:    uint64; // steamID of the friend who changed
    m_nChangeFlags: s32; // what's changed
}

// used in PersonaStateChange_t::m_nChangeFlags to describe what's changed about a user
// these flags describe what the client has learned has changed recently, so on startup you'll see a name, avatar & relationship change for every friend
EPersonaChange :: enum s32 {
    EPersonaChangeName                :: 1;
    EPersonaChangeStatus              :: 2;
    EPersonaChangeComeOnline          :: 4;
    EPersonaChangeGoneOffline         :: 8;
    EPersonaChangeGamePlayed          :: 16;
    EPersonaChangeGameServer          :: 32;
    EPersonaChangeAvatar              :: 64;
    EPersonaChangeJoinedSource        :: 128;
    EPersonaChangeLeftSource          :: 256;
    EPersonaChangeRelationshipChanged :: 512;
    EPersonaChangeNameFirstSet        :: 1024;
    EPersonaChangeBroadcast           :: 2048;
    EPersonaChangeNickname            :: 4096;
    EPersonaChangeSteamLevel          :: 8192;
    EPersonaChangeRichPresence        :: 16384;

    k_EPersonaChangeName                :: EPersonaChangeName;
    k_EPersonaChangeStatus              :: EPersonaChangeStatus;
    k_EPersonaChangeComeOnline          :: EPersonaChangeComeOnline;
    k_EPersonaChangeGoneOffline         :: EPersonaChangeGoneOffline;
    k_EPersonaChangeGamePlayed          :: EPersonaChangeGamePlayed;
    k_EPersonaChangeGameServer          :: EPersonaChangeGameServer;
    k_EPersonaChangeAvatar              :: EPersonaChangeAvatar;
    k_EPersonaChangeJoinedSource        :: EPersonaChangeJoinedSource;
    k_EPersonaChangeLeftSource          :: EPersonaChangeLeftSource;
    k_EPersonaChangeRelationshipChanged :: EPersonaChangeRelationshipChanged;
    k_EPersonaChangeNameFirstSet        :: EPersonaChangeNameFirstSet;
    k_EPersonaChangeBroadcast           :: EPersonaChangeBroadcast;
    k_EPersonaChangeNickname            :: EPersonaChangeNickname;
    k_EPersonaChangeSteamLevel          :: EPersonaChangeSteamLevel;
    k_EPersonaChangeRichPresence        :: EPersonaChangeRichPresence;
}

//-----------------------------------------------------------------------------
// Purpose: posted when game overlay activates or deactivates
//			the game can use this to be pause or resume single player games
//-----------------------------------------------------------------------------
GameOverlayActivated_t :: struct {
    anon_enum_58 :: enum s32 {
        k_iCallback :: 331;
    }
    m_bActive:        uint8; // true if it's just been activated, false otherwise
    m_bUserInitiated: bool; // true if the user asked for the overlay to be activated/deactivated
    m_nAppID:         AppId_t; // the appID of the game (should always be the current game)
    m_dwOverlayPID:   uint32; // used internally
}

//-----------------------------------------------------------------------------
// Purpose: called when the user tries to join a different game server from their friends list
//			game client should attempt to connect to specified server when this is received
//-----------------------------------------------------------------------------
GameServerChangeRequested_t :: struct {
    anon_enum_59 :: enum s32 {
        k_iCallback :: 332;
    }
    m_rgchServer:   [64] u8; // server address ("127.0.0.1:27015", "tf2.valvesoftware.com")
    m_rgchPassword: [64] u8; // server password, if any
}

//-----------------------------------------------------------------------------
// Purpose: called when the user tries to join a lobby from their friends list
//			game client should attempt to connect to specified lobby when this is received
//-----------------------------------------------------------------------------
GameLobbyJoinRequested_t :: struct {
    anon_enum_60 :: enum s32 {
        k_iCallback :: 333;
    }
    m_steamIDLobby:  CSteamID;

    // The friend they did the join via (will be invalid if not directly via a friend)
    //
    // On PS3, the friend will be invalid if this was triggered by a PSN invite via the XMB, but
    // the account type will be console user so you can tell at least that this was from a PSN friend
    // rather than a Steam friend.
    m_steamIDFriend: CSteamID;
}

//-----------------------------------------------------------------------------
// Purpose: called when an avatar is loaded in from a previous GetLargeFriendAvatar() call
//			if the image wasn't already available
//-----------------------------------------------------------------------------
AvatarImageLoaded_t :: struct {
    anon_enum_61 :: enum s32 {
        k_iCallback :: 334;
    }
    m_steamID: CSteamID; // steamid the avatar has been loaded for
    m_iImage:  s32; // the image index of the now loaded image
    m_iWide:   s32; // width of the loaded image
    m_iTall:   s32; // height of the loaded image
}

//-----------------------------------------------------------------------------
// Purpose: marks the return of a request officer list call
//-----------------------------------------------------------------------------
ClanOfficerListResponse_t :: struct {
    anon_enum_62 :: enum s32 {
        k_iCallback :: 335;
    }
    m_steamIDClan: CSteamID;
    m_cOfficers:   s32;
    m_bSuccess:    uint8;
}

//-----------------------------------------------------------------------------
// Purpose: callback indicating updated data about friends rich presence information
//-----------------------------------------------------------------------------
FriendRichPresenceUpdate_t :: struct {
    anon_enum_63 :: enum s32 {
        k_iCallback :: 336;
    }
    m_steamIDFriend: CSteamID; // friend who's rich presence has changed
    m_nAppID:        AppId_t; // the appID of the game (should always be the current game)
}

//-----------------------------------------------------------------------------
// Purpose: called when the user tries to join a game from their friends list
//			rich presence will have been set with the "connect" key which is set here
//-----------------------------------------------------------------------------
GameRichPresenceJoinRequested_t :: struct {
    anon_enum_64 :: enum s32 {
        k_iCallback :: 337;
    }
    m_steamIDFriend: CSteamID; // the friend they did the join via (will be invalid if not directly via a friend)
    m_rgchConnect:   [256] u8;
}

//-----------------------------------------------------------------------------
// Purpose: a chat message has been received for a clan chat the game has joined
//-----------------------------------------------------------------------------
GameConnectedClanChatMsg_t :: struct {
    anon_enum_65 :: enum s32 {
        k_iCallback :: 338;
    }
    m_steamIDClanChat: CSteamID;
    m_steamIDUser:     CSteamID;
    m_iMessageID:      s32;
}

//-----------------------------------------------------------------------------
// Purpose: a user has joined a clan chat
//-----------------------------------------------------------------------------
GameConnectedChatJoin_t :: struct {
    anon_enum_66 :: enum s32 {
        k_iCallback :: 339;
    }
    m_steamIDClanChat: CSteamID;
    m_steamIDUser:     CSteamID;
}

//-----------------------------------------------------------------------------
// Purpose: a user has left the chat we're in
//-----------------------------------------------------------------------------
GameConnectedChatLeave_t :: struct {
    anon_enum_67 :: enum s32 {
        k_iCallback :: 340;
    }
    m_steamIDClanChat: CSteamID;
    m_steamIDUser:     CSteamID;
    m_bKicked:         bool; // true if admin kicked
    m_bDropped:        bool; // true if Steam connection dropped
}

//-----------------------------------------------------------------------------
// Purpose: a DownloadClanActivityCounts() call has finished
//-----------------------------------------------------------------------------
DownloadClanActivityCountsResult_t :: struct {
    anon_enum_68 :: enum s32 {
        k_iCallback :: 341;
    }
    m_bSuccess: bool;
}

//-----------------------------------------------------------------------------
// Purpose: a JoinClanChatRoom() call has finished
//-----------------------------------------------------------------------------
JoinClanChatRoomCompletionResult_t :: struct {
    anon_enum_69 :: enum s32 {
        k_iCallback :: 342;
    }
    m_steamIDClanChat:        CSteamID;
    m_eChatRoomEnterResponse: EChatRoomEnterResponse;
}

//-----------------------------------------------------------------------------
// Purpose: a chat message has been received from a user
//-----------------------------------------------------------------------------
GameConnectedFriendChatMsg_t :: struct {
    anon_enum_70 :: enum s32 {
        k_iCallback :: 343;
    }
    m_steamIDUser: CSteamID;
    m_iMessageID:  s32;
}

FriendsGetFollowerCount_t :: struct {
    anon_enum_71 :: enum s32 {
        k_iCallback :: 344;
    }
    m_eResult: EResult;
    m_steamID: CSteamID #align 4;
    m_nCount:  s32;
}

FriendsIsFollowing_t :: struct {
    anon_enum_72 :: enum s32 {
        k_iCallback :: 345;
    }
    m_eResult:      EResult;
    m_steamID:      CSteamID #align 4;
    m_bIsFollowing: bool;
}

FriendsEnumerateFollowingList_t :: struct {
    anon_enum_73 :: enum s32 {
        k_iCallback :: 346;
    }
    m_eResult:           EResult;
    m_rgSteamID:         [50] CSteamID #align 4;
    m_nResultsReturned:  int32;
    m_nTotalResultCount: int32;
}

//-----------------------------------------------------------------------------
// Purpose: reports the result of an attempt to change the user's persona name
//-----------------------------------------------------------------------------
SetPersonaNameResponse_t :: struct {
    anon_enum_74 :: enum s32 {
        k_iCallback :: 347;
    }

    m_bSuccess:      bool; // true if name change succeeded completely.
    m_bLocalSuccess: bool; // true if name change was retained locally.  (We might not have been able to communicate with Steam)
    m_result:        EResult; // detailed result code
}

//-----------------------------------------------------------------------------
// Purpose: Invoked when the status of unread messages changes
//-----------------------------------------------------------------------------
UnreadChatMessagesChanged_t :: struct {
    anon_enum_75 :: enum s32 {
        k_iCallback :: 348;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// Purpose: Dispatched when an overlay browser instance is navigated to a protocol/scheme registered by RegisterProtocolInOverlayBrowser()
//-----------------------------------------------------------------------------
OverlayBrowserProtocolNavigation_t :: struct {
    anon_enum_76 :: enum s32 {
        k_iCallback :: 349;
    }
    rgchURI: [1024] u8;
}

//-----------------------------------------------------------------------------
// Purpose: A user's equipped profile items have changed
//-----------------------------------------------------------------------------
EquippedProfileItemsChanged_t :: struct {
    anon_enum_77 :: enum s32 {
        k_iCallback :: 350;
    }
    m_steamID: CSteamID;
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
EquippedProfileItems_t :: struct {
    anon_enum_78 :: enum s32 {
        k_iCallback :: 351;
    }
    m_eResult:                   EResult;
    m_steamID:                   CSteamID #align 4;
    m_bHasAnimatedAvatar:        bool;
    m_bHasAvatarFrame:           bool;
    m_bHasProfileModifier:       bool;
    m_bHasProfileBackground:     bool;
    m_bHasMiniProfileBackground: bool;
}

// Steam API call failure results
ESteamAPICallFailure :: enum s32 {
    ESteamAPICallFailureNone               :: -1;
    ESteamAPICallFailureSteamGone          :: 0;
    ESteamAPICallFailureNetworkFailure     :: 1;

    ESteamAPICallFailureInvalidHandle      :: 2;
    ESteamAPICallFailureMismatchedCallback :: 3;

    k_ESteamAPICallFailureNone               :: ESteamAPICallFailureNone;
    k_ESteamAPICallFailureSteamGone          :: ESteamAPICallFailureSteamGone;
    k_ESteamAPICallFailureNetworkFailure     :: ESteamAPICallFailureNetworkFailure;

    k_ESteamAPICallFailureInvalidHandle      :: ESteamAPICallFailureInvalidHandle;
    k_ESteamAPICallFailureMismatchedCallback :: ESteamAPICallFailureMismatchedCallback;
}

// Input modes for the Big Picture gamepad text entry
EGamepadTextInputMode :: enum s32 {
    EGamepadTextInputModeNormal   :: 0;
    EGamepadTextInputModePassword :: 1;

    k_EGamepadTextInputModeNormal   :: EGamepadTextInputModeNormal;
    k_EGamepadTextInputModePassword :: EGamepadTextInputModePassword;
}

// Controls number of allowed lines for the Big Picture gamepad text entry
EGamepadTextInputLineMode :: enum s32 {
    EGamepadTextInputLineModeSingleLine    :: 0;
    EGamepadTextInputLineModeMultipleLines :: 1;

    k_EGamepadTextInputLineModeSingleLine    :: EGamepadTextInputLineModeSingleLine;
    k_EGamepadTextInputLineModeMultipleLines :: EGamepadTextInputLineModeMultipleLines;
}

EFloatingGamepadTextInputMode :: enum s32 {
    EFloatingGamepadTextInputModeModeSingleLine    :: 0;
    EFloatingGamepadTextInputModeModeMultipleLines :: 1;
    EFloatingGamepadTextInputModeModeEmail         :: 2;
    EFloatingGamepadTextInputModeModeNumeric       :: 3;

    k_EFloatingGamepadTextInputModeModeSingleLine    :: EFloatingGamepadTextInputModeModeSingleLine;
    k_EFloatingGamepadTextInputModeModeMultipleLines :: EFloatingGamepadTextInputModeModeMultipleLines;
    k_EFloatingGamepadTextInputModeModeEmail         :: EFloatingGamepadTextInputModeModeEmail;
    k_EFloatingGamepadTextInputModeModeNumeric       :: EFloatingGamepadTextInputModeModeNumeric;
}

// The context where text filtering is being done
ETextFilteringContext :: enum s32 {
    ETextFilteringContextUnknown     :: 0;
    ETextFilteringContextGameContent :: 1;
    ETextFilteringContextChat        :: 2;
    ETextFilteringContextName        :: 3;

    k_ETextFilteringContextUnknown     :: ETextFilteringContextUnknown;
    k_ETextFilteringContextGameContent :: ETextFilteringContextGameContent;
    k_ETextFilteringContextChat        :: ETextFilteringContextChat;
    k_ETextFilteringContextName        :: ETextFilteringContextName;
}

//-----------------------------------------------------------------------------
// Purpose: interface to user independent utility functions
//-----------------------------------------------------------------------------
ISteamUtils :: struct {
    vtable: *ISteamUtils_VTable;
}
ISteamUtils_VTable :: struct #type_info_none {
    GetSecondsSinceAppActive: (this: *ISteamUtils) -> uint32 #cpp_method;
    GetSecondsSinceComputerActive: (this: *ISteamUtils) -> uint32 #cpp_method;

    GetConnectedUniverse: (this: *ISteamUtils) -> EUniverse #cpp_method;

    GetServerRealTime: (this: *ISteamUtils) -> uint32 #cpp_method;

    GetIPCountry: (this: *ISteamUtils) -> *u8 #cpp_method;

    GetImageSize: (this: *ISteamUtils, iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool #cpp_method;

    GetImageRGBA: (this: *ISteamUtils, iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool #cpp_method;

    GetCSERIPPort: (this: *ISteamUtils, unIP: *uint32, usPort: *uint16) -> bool #cpp_method;

    GetCurrentBatteryPower: (this: *ISteamUtils) -> uint8 #cpp_method;

    GetAppID: (this: *ISteamUtils) -> uint32 #cpp_method;

    SetOverlayNotificationPosition: (this: *ISteamUtils, eNotificationPosition: ENotificationPosition) -> void #cpp_method;

    IsAPICallCompleted: (this: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool #cpp_method;
    GetAPICallFailureReason: (this: *ISteamUtils, hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure #cpp_method;
    GetAPICallResult: (this: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool #cpp_method;

    RunFrame: (this: *ISteamUtils) -> void #cpp_method;

    GetIPCCallCount: (this: *ISteamUtils) -> uint32 #cpp_method;

    SetWarningMessageHook: (this: *ISteamUtils, pFunction: SteamAPIWarningMessageHook_t) -> void #cpp_method;

    IsOverlayEnabled: (this: *ISteamUtils) -> bool #cpp_method;

    BOverlayNeedsPresent: (this: *ISteamUtils) -> bool #cpp_method;

    CheckFileSignature: (this: *ISteamUtils, szFileName: *u8) -> SteamAPICall_t #cpp_method;

    ShowGamepadTextInput: (this: *ISteamUtils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *u8, unCharMax: uint32, pchExistingText: *u8) -> bool #cpp_method;

    GetEnteredGamepadTextLength: (this: *ISteamUtils) -> uint32 #cpp_method;
    GetEnteredGamepadTextInput: (this: *ISteamUtils, pchText: *u8, cchText: uint32) -> bool #cpp_method;

    GetSteamUILanguage: (this: *ISteamUtils) -> *u8 #cpp_method;

    IsSteamRunningInVR: (this: *ISteamUtils) -> bool #cpp_method;

    SetOverlayNotificationInset: (this: *ISteamUtils, nHorizontalInset: s32, nVerticalInset: s32) -> void #cpp_method;

    IsSteamInBigPictureMode: (this: *ISteamUtils) -> bool #cpp_method;

    StartVRDashboard: (this: *ISteamUtils) -> void #cpp_method;

    IsVRHeadsetStreamingEnabled: (this: *ISteamUtils) -> bool #cpp_method;

    SetVRHeadsetStreamingEnabled: (this: *ISteamUtils, bEnabled: bool) -> void #cpp_method;

    IsSteamChinaLauncher: (this: *ISteamUtils) -> bool #cpp_method;

    InitFilterText: (this: *ISteamUtils, unFilterOptions: uint32 = 0) -> bool #cpp_method;

    FilterText: (this: *ISteamUtils, eContext: ETextFilteringContext, sourceSteamID: CSteamID, pchInputMessage: *u8, pchOutFilteredText: *u8, nByteSizeOutFilteredText: uint32) -> s32 #cpp_method;

    GetIPv6ConnectivityState: (this: *ISteamUtils, eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState #cpp_method;

    IsSteamRunningOnSteamDeck: (this: *ISteamUtils) -> bool #cpp_method;

    ShowFloatingGamepadTextInput: (this: *ISteamUtils, eKeyboardMode: EFloatingGamepadTextInputMode, nTextFieldXPosition: s32, nTextFieldYPosition: s32, nTextFieldWidth: s32, nTextFieldHeight: s32) -> bool #cpp_method;

    SetGameLauncherMode: (this: *ISteamUtils, bLauncherMode: bool) -> void #cpp_method;

    DismissFloatingGamepadTextInput: (this: *ISteamUtils) -> bool #cpp_method;

    DismissGamepadTextInput: (this: *ISteamUtils) -> bool #cpp_method;
}

ISteamUtils_GetSecondsSinceAppActive :: inline (this: *ISteamUtils) -> uint32 { return this.vtable.GetSecondsSinceAppActive(this); }
ISteamUtils_GetSecondsSinceComputerActive :: inline (this: *ISteamUtils) -> uint32 { return this.vtable.GetSecondsSinceComputerActive(this); }

ISteamUtils_GetConnectedUniverse :: inline (this: *ISteamUtils) -> EUniverse { return this.vtable.GetConnectedUniverse(this); }

ISteamUtils_GetServerRealTime :: inline (this: *ISteamUtils) -> uint32 { return this.vtable.GetServerRealTime(this); }

ISteamUtils_GetIPCountry :: inline (this: *ISteamUtils) -> *u8 { return this.vtable.GetIPCountry(this); }

ISteamUtils_GetImageSize :: inline (this: *ISteamUtils, iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool { return this.vtable.GetImageSize(this, iImage, pnWidth, pnHeight); }

ISteamUtils_GetImageRGBA :: inline (this: *ISteamUtils, iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool { return this.vtable.GetImageRGBA(this, iImage, pubDest, nDestBufferSize); }

ISteamUtils_GetCSERIPPort :: inline (this: *ISteamUtils, unIP: *uint32, usPort: *uint16) -> bool { return this.vtable.GetCSERIPPort(this, unIP, usPort); }

ISteamUtils_GetCurrentBatteryPower :: inline (this: *ISteamUtils) -> uint8 { return this.vtable.GetCurrentBatteryPower(this); }

ISteamUtils_GetAppID :: inline (this: *ISteamUtils) -> uint32 { return this.vtable.GetAppID(this); }

ISteamUtils_SetOverlayNotificationPosition :: inline (this: *ISteamUtils, eNotificationPosition: ENotificationPosition) { this.vtable.SetOverlayNotificationPosition(this, eNotificationPosition); }

ISteamUtils_IsAPICallCompleted :: inline (this: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool { return this.vtable.IsAPICallCompleted(this, hSteamAPICall, pbFailed); }
ISteamUtils_GetAPICallFailureReason :: inline (this: *ISteamUtils, hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure { return this.vtable.GetAPICallFailureReason(this, hSteamAPICall); }
ISteamUtils_GetAPICallResult :: inline (this: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool { return this.vtable.GetAPICallResult(this, hSteamAPICall, pCallback, cubCallback, iCallbackExpected, pbFailed); }

ISteamUtils_RunFrame :: inline (this: *ISteamUtils) { this.vtable.RunFrame(this); }

ISteamUtils_GetIPCCallCount :: inline (this: *ISteamUtils) -> uint32 { return this.vtable.GetIPCCallCount(this); }

ISteamUtils_SetWarningMessageHook :: inline (this: *ISteamUtils, pFunction: SteamAPIWarningMessageHook_t) { this.vtable.SetWarningMessageHook(this, pFunction); }

ISteamUtils_IsOverlayEnabled :: inline (this: *ISteamUtils) -> bool { return this.vtable.IsOverlayEnabled(this); }

ISteamUtils_BOverlayNeedsPresent :: inline (this: *ISteamUtils) -> bool { return this.vtable.BOverlayNeedsPresent(this); }

ISteamUtils_CheckFileSignature :: inline (this: *ISteamUtils, szFileName: *u8) -> SteamAPICall_t { return this.vtable.CheckFileSignature(this, szFileName); }

ISteamUtils_ShowGamepadTextInput :: inline (this: *ISteamUtils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *u8, unCharMax: uint32, pchExistingText: *u8) -> bool { return this.vtable.ShowGamepadTextInput(this, eInputMode, eLineInputMode, pchDescription, unCharMax, pchExistingText); }

ISteamUtils_GetEnteredGamepadTextLength :: inline (this: *ISteamUtils) -> uint32 { return this.vtable.GetEnteredGamepadTextLength(this); }
ISteamUtils_GetEnteredGamepadTextInput :: inline (this: *ISteamUtils, pchText: *u8, cchText: uint32) -> bool { return this.vtable.GetEnteredGamepadTextInput(this, pchText, cchText); }

ISteamUtils_GetSteamUILanguage :: inline (this: *ISteamUtils) -> *u8 { return this.vtable.GetSteamUILanguage(this); }

ISteamUtils_IsSteamRunningInVR :: inline (this: *ISteamUtils) -> bool { return this.vtable.IsSteamRunningInVR(this); }

ISteamUtils_SetOverlayNotificationInset :: inline (this: *ISteamUtils, nHorizontalInset: s32, nVerticalInset: s32) { this.vtable.SetOverlayNotificationInset(this, nHorizontalInset, nVerticalInset); }

ISteamUtils_IsSteamInBigPictureMode :: inline (this: *ISteamUtils) -> bool { return this.vtable.IsSteamInBigPictureMode(this); }

ISteamUtils_StartVRDashboard :: inline (this: *ISteamUtils) { this.vtable.StartVRDashboard(this); }

ISteamUtils_IsVRHeadsetStreamingEnabled :: inline (this: *ISteamUtils) -> bool { return this.vtable.IsVRHeadsetStreamingEnabled(this); }

ISteamUtils_SetVRHeadsetStreamingEnabled :: inline (this: *ISteamUtils, bEnabled: bool) { this.vtable.SetVRHeadsetStreamingEnabled(this, bEnabled); }

ISteamUtils_IsSteamChinaLauncher :: inline (this: *ISteamUtils) -> bool { return this.vtable.IsSteamChinaLauncher(this); }

ISteamUtils_InitFilterText :: inline (this: *ISteamUtils, unFilterOptions: uint32 = 0) -> bool { return this.vtable.InitFilterText(this, unFilterOptions); }

ISteamUtils_FilterText :: inline (this: *ISteamUtils, eContext: ETextFilteringContext, sourceSteamID: CSteamID, pchInputMessage: *u8, pchOutFilteredText: *u8, nByteSizeOutFilteredText: uint32) -> s32 { return this.vtable.FilterText(this, eContext, sourceSteamID, pchInputMessage, pchOutFilteredText, nByteSizeOutFilteredText); }

ISteamUtils_GetIPv6ConnectivityState :: inline (this: *ISteamUtils, eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState { return this.vtable.GetIPv6ConnectivityState(this, eProtocol); }

ISteamUtils_IsSteamRunningOnSteamDeck :: inline (this: *ISteamUtils) -> bool { return this.vtable.IsSteamRunningOnSteamDeck(this); }

ISteamUtils_ShowFloatingGamepadTextInput :: inline (this: *ISteamUtils, eKeyboardMode: EFloatingGamepadTextInputMode, nTextFieldXPosition: s32, nTextFieldYPosition: s32, nTextFieldWidth: s32, nTextFieldHeight: s32) -> bool { return this.vtable.ShowFloatingGamepadTextInput(this, eKeyboardMode, nTextFieldXPosition, nTextFieldYPosition, nTextFieldWidth, nTextFieldHeight); }

ISteamUtils_SetGameLauncherMode :: inline (this: *ISteamUtils, bLauncherMode: bool) { this.vtable.SetGameLauncherMode(this, bLauncherMode); }

ISteamUtils_DismissFloatingGamepadTextInput :: inline (this: *ISteamUtils) -> bool { return this.vtable.DismissFloatingGamepadTextInput(this); }

ISteamUtils_DismissGamepadTextInput :: inline (this: *ISteamUtils) -> bool { return this.vtable.DismissGamepadTextInput(this); }

vtable :: (obj: *ISteamUtils) -> *ISteamUtils_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: The country of the user changed
//-----------------------------------------------------------------------------
IPCountry_t :: struct {
    anon_enum_79 :: enum s32 {
        k_iCallback :: 701;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// Purpose: Fired when running on a handheld PC or laptop with less than 10 minutes of battery is left, fires then every minute
//-----------------------------------------------------------------------------
LowBatteryPower_t :: struct {
    anon_enum_80 :: enum s32 {
        k_iCallback :: 702;
    }
    m_nMinutesBatteryLeft: uint8;
}

//-----------------------------------------------------------------------------
// Purpose: called when a SteamAsyncCall_t has completed (or failed)
//-----------------------------------------------------------------------------
SteamAPICallCompleted_t :: struct {
    anon_enum_81 :: enum s32 {
        k_iCallback :: 703;
    }
    m_hAsyncCall: SteamAPICall_t;
    m_iCallback:  s32;
    m_cubParam:   uint32;
}

//-----------------------------------------------------------------------------
// called when Steam wants to shutdown
//-----------------------------------------------------------------------------
SteamShutdown_t :: struct {
    anon_enum_82 :: enum s32 {
        k_iCallback :: 704;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// results for CheckFileSignature
//-----------------------------------------------------------------------------
ECheckFileSignature :: enum s32 {
    ECheckFileSignatureInvalidSignature             :: 0;
    ECheckFileSignatureValidSignature               :: 1;
    ECheckFileSignatureFileNotFound                 :: 2;
    ECheckFileSignatureNoSignaturesFoundForThisApp  :: 3;
    ECheckFileSignatureNoSignaturesFoundForThisFile :: 4;

    k_ECheckFileSignatureInvalidSignature             :: ECheckFileSignatureInvalidSignature;
    k_ECheckFileSignatureValidSignature               :: ECheckFileSignatureValidSignature;
    k_ECheckFileSignatureFileNotFound                 :: ECheckFileSignatureFileNotFound;
    k_ECheckFileSignatureNoSignaturesFoundForThisApp  :: ECheckFileSignatureNoSignaturesFoundForThisApp;
    k_ECheckFileSignatureNoSignaturesFoundForThisFile :: ECheckFileSignatureNoSignaturesFoundForThisFile;
}

//-----------------------------------------------------------------------------
// callback for CheckFileSignature
//-----------------------------------------------------------------------------
CheckFileSignature_t :: struct {
    anon_enum_83 :: enum s32 {
        k_iCallback :: 705;
    }
    m_eCheckFileSignature: ECheckFileSignature;
}

//-----------------------------------------------------------------------------
// Full Screen gamepad text input has been closed
//-----------------------------------------------------------------------------
GamepadTextInputDismissed_t :: struct {
    anon_enum_84 :: enum s32 {
        k_iCallback :: 714;
    }
    m_bSubmitted:      bool; // true if user entered & accepted text (Call ISteamUtils::GetEnteredGamepadTextInput() for text), false if canceled input
    m_unSubmittedText: uint32;
    m_unAppID:         AppId_t;
}

// k_iSteamUtilsCallbacks + 15 through 35 are taken
AppResumingFromSuspend_t :: struct {
    anon_enum_85 :: enum s32 {
        k_iCallback :: 736;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// The floating on-screen keyboard has been closed
//-----------------------------------------------------------------------------
FloatingGamepadTextInputDismissed_t :: struct {
    anon_enum_86 :: enum s32 {
        k_iCallback :: 738;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// The text filtering dictionary has changed
//-----------------------------------------------------------------------------
FilterTextDictionaryChanged_t :: struct {
    anon_enum_87 :: enum s32 {
        k_iCallback :: 739;
    }
    m_eLanguage: s32; // One of ELanguage, or k_LegallyRequiredFiltering
}

//
// Max size (in bytes of UTF-8 data, not in characters) of server fields, including null terminator.
// WARNING: These cannot be changed easily, without breaking clients using old interfaces.
//
k_cbMaxGameServerGameDir: s32 : 32;
k_cbMaxGameServerMapName: s32 : 32;
k_cbMaxGameServerGameDescription: s32 : 64;
k_cbMaxGameServerName: s32 : 64;
k_cbMaxGameServerTags: s32 : 128;
k_cbMaxGameServerGameData: s32 : 2048;

/// Store key/value pair used in matchmaking queries.
///
/// Actually, the name Key/Value is a bit misleading.  The "key" is better
/// understood as "filter operation code" and the "value" is the operand to this
/// filter operation.  The meaning of the operand depends upon the filter.
MatchMakingKeyValuePair_t :: struct {
    m_szKey:   [256] u8;
    m_szValue: [256] u8;
}

EMatchMakingServerResponse :: enum s32 {
    ServerResponded               :: 0;
    ServerFailedToRespond         :: 1;
    NoServersListedOnMasterServer :: 2;

    eServerResponded               :: ServerResponded;
    eServerFailedToRespond         :: ServerFailedToRespond;
    eNoServersListedOnMasterServer :: NoServersListedOnMasterServer;
}

// servernetadr_t is all the addressing info the serverbrowser needs to know about a game server,
// namely: its IP, its connection port, and its query port.
servernetadr_t :: struct {
    m_usConnectionPort: uint16; // (in HOST byte order)
    m_usQueryPort:      uint16;
    m_unIP:             uint32;
}

//-----------------------------------------------------------------------------
// Purpose: Data describing a single server
//-----------------------------------------------------------------------------
gameserveritem_t :: struct {
    m_NetAdr:                 servernetadr_t; ///< IP/Query Port/Connection Port for this server
    m_nPing:                  s32; ///< current ping time in milliseconds
    m_bHadSuccessfulResponse: bool; ///< server has responded successfully in the past
    m_bDoNotRefresh:          bool; ///< server is marked as not responding and should no longer be refreshed
    m_szGameDir:              [32] u8; ///< current game directory
    m_szMap:                  [32] u8; ///< current map
    m_szGameDescription:      [64] u8; ///< game description
    m_nAppID:                 uint32; ///< Steam App ID of this server
    m_nPlayers:               s32; ///< total number of players currently on the server.  INCLUDES BOTS!!
    m_nMaxPlayers:            s32; ///< Maximum players that can join this server
    m_nBotPlayers:            s32; ///< Number of bots (i.e simulated players) on this server
    m_bPassword:              bool; ///< true if this server needs a password to join
    m_bSecure:                bool; ///< Is this server protected by VAC
    m_ulTimeLastPlayed:       uint32; ///< time (in unix time) when this server was last played on (for favorite/history servers)
    m_nServerVersion:         s32; ///< server version as reported to Steam

    /// Game server name
    m_szServerName:           [64] u8;

    /// the tags this server exposes
    m_szGameTags:             [128] u8;

    /// steamID of the game server - invalid if it's doesn't have one (old server, or not connected to Steam)
    m_steamID:                CSteamID #align 4;
}

// lobby type description
ELobbyType :: enum s32 {
    ELobbyTypePrivate       :: 0;
    ELobbyTypeFriendsOnly   :: 1;
    ELobbyTypePublic        :: 2;
    ELobbyTypeInvisible     :: 3;

    ELobbyTypePrivateUnique :: 4;

    k_ELobbyTypePrivate       :: ELobbyTypePrivate;
    k_ELobbyTypeFriendsOnly   :: ELobbyTypeFriendsOnly;
    k_ELobbyTypePublic        :: ELobbyTypePublic;
    k_ELobbyTypeInvisible     :: ELobbyTypeInvisible;

    k_ELobbyTypePrivateUnique :: ELobbyTypePrivateUnique;
}

// lobby search filter tools
ELobbyComparison :: enum s32 {
    ELobbyComparisonEqualToOrLessThan    :: -2;
    ELobbyComparisonLessThan             :: -1;
    ELobbyComparisonEqual                :: 0;
    ELobbyComparisonGreaterThan          :: 1;
    ELobbyComparisonEqualToOrGreaterThan :: 2;
    ELobbyComparisonNotEqual             :: 3;

    k_ELobbyComparisonEqualToOrLessThan    :: ELobbyComparisonEqualToOrLessThan;
    k_ELobbyComparisonLessThan             :: ELobbyComparisonLessThan;
    k_ELobbyComparisonEqual                :: ELobbyComparisonEqual;
    k_ELobbyComparisonGreaterThan          :: ELobbyComparisonGreaterThan;
    k_ELobbyComparisonEqualToOrGreaterThan :: ELobbyComparisonEqualToOrGreaterThan;
    k_ELobbyComparisonNotEqual             :: ELobbyComparisonNotEqual;
}

// lobby search distance. Lobby results are sorted from closest to farthest.
ELobbyDistanceFilter :: enum s32 {
    ELobbyDistanceFilterClose     :: 0;
    ELobbyDistanceFilterDefault   :: 1;
    ELobbyDistanceFilterFar       :: 2;
    ELobbyDistanceFilterWorldwide :: 3;

    k_ELobbyDistanceFilterClose     :: ELobbyDistanceFilterClose;
    k_ELobbyDistanceFilterDefault   :: ELobbyDistanceFilterDefault;
    k_ELobbyDistanceFilterFar       :: ELobbyDistanceFilterFar;
    k_ELobbyDistanceFilterWorldwide :: ELobbyDistanceFilterWorldwide;
}

//-----------------------------------------------------------------------------
// Purpose: Functions for match making services for clients to get to favorites
//			and to operate on game lobbies.
//-----------------------------------------------------------------------------
ISteamMatchmaking :: struct {
    vtable: *ISteamMatchmaking_VTable;
}
ISteamMatchmaking_VTable :: struct #type_info_none {
    GetFavoriteGameCount: (this: *ISteamMatchmaking) -> s32 #cpp_method;

    GetFavoriteGame: (this: *ISteamMatchmaking, iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32) -> bool #cpp_method;

    AddFavoriteGame: (this: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> s32 #cpp_method;

    RemoveFavoriteGame: (this: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool #cpp_method;

    RequestLobbyList: (this: *ISteamMatchmaking) -> SteamAPICall_t #cpp_method;

    AddRequestLobbyListStringFilter: (this: *ISteamMatchmaking, pchKeyToMatch: *u8, pchValueToMatch: *u8, eComparisonType: ELobbyComparison) -> void #cpp_method;

    AddRequestLobbyListNumericalFilter: (this: *ISteamMatchmaking, pchKeyToMatch: *u8, nValueToMatch: s32, eComparisonType: ELobbyComparison) -> void #cpp_method;

    AddRequestLobbyListNearValueFilter: (this: *ISteamMatchmaking, pchKeyToMatch: *u8, nValueToBeCloseTo: s32) -> void #cpp_method;

    AddRequestLobbyListFilterSlotsAvailable: (this: *ISteamMatchmaking, nSlotsAvailable: s32) -> void #cpp_method;

    AddRequestLobbyListDistanceFilter: (this: *ISteamMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) -> void #cpp_method;

    AddRequestLobbyListResultCountFilter: (this: *ISteamMatchmaking, cMaxResults: s32) -> void #cpp_method;

    AddRequestLobbyListCompatibleMembersFilter: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> void #cpp_method;

    GetLobbyByIndex: (this: *ISteamMatchmaking, iLobby: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    CreateLobby: (this: *ISteamMatchmaking, eLobbyType: ELobbyType, cMaxMembers: s32) -> SteamAPICall_t #cpp_method;

    JoinLobby: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> SteamAPICall_t #cpp_method;

    LeaveLobby: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> void #cpp_method;

    InviteUserToLobby: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDInvitee: CSteamID) -> bool #cpp_method;

    GetNumLobbyMembers: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> s32 #cpp_method;

    GetLobbyMemberByIndex: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, iMember: s32) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    GetLobbyData: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8) -> *u8 #cpp_method;

    SetLobbyData: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8, pchValue: *u8) -> bool #cpp_method;

    GetLobbyDataCount: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> s32 #cpp_method;

    GetLobbyDataByIndex: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, iLobbyData: s32, pchKey: *u8, cchKeyBufferSize: s32, pchValue: *u8, cchValueBufferSize: s32) -> bool #cpp_method;

    DeleteLobbyData: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8) -> bool #cpp_method;

    GetLobbyMemberData: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDUser: CSteamID, pchKey: *u8) -> *u8 #cpp_method;

    SetLobbyMemberData: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8, pchValue: *u8) -> void #cpp_method;

    SendLobbyChatMsg: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pvMsgBody: *void, cubMsgBody: s32) -> bool #cpp_method;

    GetLobbyChatEntry: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 #cpp_method;

    RequestLobbyData: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> bool #cpp_method;

    SetLobbyGameServer: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: CSteamID) -> void #cpp_method;

    GetLobbyGameServer: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID) -> bool #cpp_method;

    SetLobbyMemberLimit: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, cMaxMembers: s32) -> bool #cpp_method;

    GetLobbyMemberLimit: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> s32 #cpp_method;

    SetLobbyType: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, eLobbyType: ELobbyType) -> bool #cpp_method;

    SetLobbyJoinable: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, bLobbyJoinable: bool) -> bool #cpp_method;

    GetLobbyOwner: (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    SetLobbyOwner: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDNewOwner: CSteamID) -> bool #cpp_method;

    SetLinkedLobby: (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDLobbyDependent: CSteamID) -> bool #cpp_method;
}

ISteamMatchmaking_GetFavoriteGameCount :: inline (this: *ISteamMatchmaking) -> s32 { return this.vtable.GetFavoriteGameCount(this); }

ISteamMatchmaking_GetFavoriteGame :: inline (this: *ISteamMatchmaking, iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32) -> bool { return this.vtable.GetFavoriteGame(this, iGame, pnAppID, pnIP, pnConnPort, pnQueryPort, punFlags, pRTime32LastPlayedOnServer); }

ISteamMatchmaking_AddFavoriteGame :: inline (this: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> s32 { return this.vtable.AddFavoriteGame(this, nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer); }

ISteamMatchmaking_RemoveFavoriteGame :: inline (this: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool { return this.vtable.RemoveFavoriteGame(this, nAppID, nIP, nConnPort, nQueryPort, unFlags); }

ISteamMatchmaking_RequestLobbyList :: inline (this: *ISteamMatchmaking) -> SteamAPICall_t { return this.vtable.RequestLobbyList(this); }

ISteamMatchmaking_AddRequestLobbyListStringFilter :: inline (this: *ISteamMatchmaking, pchKeyToMatch: *u8, pchValueToMatch: *u8, eComparisonType: ELobbyComparison) { this.vtable.AddRequestLobbyListStringFilter(this, pchKeyToMatch, pchValueToMatch, eComparisonType); }

ISteamMatchmaking_AddRequestLobbyListNumericalFilter :: inline (this: *ISteamMatchmaking, pchKeyToMatch: *u8, nValueToMatch: s32, eComparisonType: ELobbyComparison) { this.vtable.AddRequestLobbyListNumericalFilter(this, pchKeyToMatch, nValueToMatch, eComparisonType); }

ISteamMatchmaking_AddRequestLobbyListNearValueFilter :: inline (this: *ISteamMatchmaking, pchKeyToMatch: *u8, nValueToBeCloseTo: s32) { this.vtable.AddRequestLobbyListNearValueFilter(this, pchKeyToMatch, nValueToBeCloseTo); }

ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable :: inline (this: *ISteamMatchmaking, nSlotsAvailable: s32) { this.vtable.AddRequestLobbyListFilterSlotsAvailable(this, nSlotsAvailable); }

ISteamMatchmaking_AddRequestLobbyListDistanceFilter :: inline (this: *ISteamMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) { this.vtable.AddRequestLobbyListDistanceFilter(this, eLobbyDistanceFilter); }

ISteamMatchmaking_AddRequestLobbyListResultCountFilter :: inline (this: *ISteamMatchmaking, cMaxResults: s32) { this.vtable.AddRequestLobbyListResultCountFilter(this, cMaxResults); }

ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) { this.vtable.AddRequestLobbyListCompatibleMembersFilter(this, steamIDLobby); }

ISteamMatchmaking_GetLobbyByIndex :: inline (this: *ISteamMatchmaking, iLobby: s32) -> CSteamID { return this.vtable.GetLobbyByIndex(this, iLobby); }

ISteamMatchmaking_CreateLobby :: inline (this: *ISteamMatchmaking, eLobbyType: ELobbyType, cMaxMembers: s32) -> SteamAPICall_t { return this.vtable.CreateLobby(this, eLobbyType, cMaxMembers); }

ISteamMatchmaking_JoinLobby :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> SteamAPICall_t { return this.vtable.JoinLobby(this, steamIDLobby); }

ISteamMatchmaking_LeaveLobby :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) { this.vtable.LeaveLobby(this, steamIDLobby); }

ISteamMatchmaking_InviteUserToLobby :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDInvitee: CSteamID) -> bool { return this.vtable.InviteUserToLobby(this, steamIDLobby, steamIDInvitee); }

ISteamMatchmaking_GetNumLobbyMembers :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> s32 { return this.vtable.GetNumLobbyMembers(this, steamIDLobby); }

ISteamMatchmaking_GetLobbyMemberByIndex :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, iMember: s32) -> CSteamID { return this.vtable.GetLobbyMemberByIndex(this, steamIDLobby, iMember); }

ISteamMatchmaking_GetLobbyData :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8) -> *u8 { return this.vtable.GetLobbyData(this, steamIDLobby, pchKey); }

ISteamMatchmaking_SetLobbyData :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8, pchValue: *u8) -> bool { return this.vtable.SetLobbyData(this, steamIDLobby, pchKey, pchValue); }

ISteamMatchmaking_GetLobbyDataCount :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> s32 { return this.vtable.GetLobbyDataCount(this, steamIDLobby); }

ISteamMatchmaking_GetLobbyDataByIndex :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, iLobbyData: s32, pchKey: *u8, cchKeyBufferSize: s32, pchValue: *u8, cchValueBufferSize: s32) -> bool { return this.vtable.GetLobbyDataByIndex(this, steamIDLobby, iLobbyData, pchKey, cchKeyBufferSize, pchValue, cchValueBufferSize); }

ISteamMatchmaking_DeleteLobbyData :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8) -> bool { return this.vtable.DeleteLobbyData(this, steamIDLobby, pchKey); }

ISteamMatchmaking_GetLobbyMemberData :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDUser: CSteamID, pchKey: *u8) -> *u8 { return this.vtable.GetLobbyMemberData(this, steamIDLobby, steamIDUser, pchKey); }

ISteamMatchmaking_SetLobbyMemberData :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pchKey: *u8, pchValue: *u8) { this.vtable.SetLobbyMemberData(this, steamIDLobby, pchKey, pchValue); }

ISteamMatchmaking_SendLobbyChatMsg :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, pvMsgBody: *void, cubMsgBody: s32) -> bool { return this.vtable.SendLobbyChatMsg(this, steamIDLobby, pvMsgBody, cubMsgBody); }

ISteamMatchmaking_GetLobbyChatEntry :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 { return this.vtable.GetLobbyChatEntry(this, steamIDLobby, iChatID, pSteamIDUser, pvData, cubData, peChatEntryType); }

ISteamMatchmaking_RequestLobbyData :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> bool { return this.vtable.RequestLobbyData(this, steamIDLobby); }

ISteamMatchmaking_SetLobbyGameServer :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: CSteamID) { this.vtable.SetLobbyGameServer(this, steamIDLobby, unGameServerIP, unGameServerPort, steamIDGameServer); }

ISteamMatchmaking_GetLobbyGameServer :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID) -> bool { return this.vtable.GetLobbyGameServer(this, steamIDLobby, punGameServerIP, punGameServerPort, psteamIDGameServer); }

ISteamMatchmaking_SetLobbyMemberLimit :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, cMaxMembers: s32) -> bool { return this.vtable.SetLobbyMemberLimit(this, steamIDLobby, cMaxMembers); }

ISteamMatchmaking_GetLobbyMemberLimit :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> s32 { return this.vtable.GetLobbyMemberLimit(this, steamIDLobby); }

ISteamMatchmaking_SetLobbyType :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, eLobbyType: ELobbyType) -> bool { return this.vtable.SetLobbyType(this, steamIDLobby, eLobbyType); }

ISteamMatchmaking_SetLobbyJoinable :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, bLobbyJoinable: bool) -> bool { return this.vtable.SetLobbyJoinable(this, steamIDLobby, bLobbyJoinable); }

ISteamMatchmaking_GetLobbyOwner :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID) -> CSteamID { return this.vtable.GetLobbyOwner(this, steamIDLobby); }

ISteamMatchmaking_SetLobbyOwner :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDNewOwner: CSteamID) -> bool { return this.vtable.SetLobbyOwner(this, steamIDLobby, steamIDNewOwner); }

ISteamMatchmaking_SetLinkedLobby :: inline (this: *ISteamMatchmaking, steamIDLobby: CSteamID, steamIDLobbyDependent: CSteamID) -> bool { return this.vtable.SetLinkedLobby(this, steamIDLobby, steamIDLobbyDependent); }

vtable :: (obj: *ISteamMatchmaking) -> *ISteamMatchmaking_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Typedef for handle type you will receive when requesting server list.
//-----------------------------------------------------------------------------
HServerListRequest :: *void;

//-----------------------------------------------------------------------------
// Purpose: Callback interface for receiving responses after a server list refresh
// or an individual server update.
//
// Since you get these callbacks after requesting full list refreshes you will
// usually implement this interface inside an object like CServerBrowser.  If that
// object is getting destructed you should use ISteamMatchMakingServers()->CancelQuery()
// to cancel any in-progress queries so you don't get a callback into the destructed
// object and crash.
//-----------------------------------------------------------------------------
ISteamMatchmakingServerListResponse :: struct {
    vtable: *ISteamMatchmakingServerListResponse_VTable;
}
ISteamMatchmakingServerListResponse_VTable :: struct #type_info_none {
    ServerResponded: (this: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) -> void #cpp_method;

    ServerFailedToRespond: (this: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) -> void #cpp_method;

    RefreshComplete: (this: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, response: EMatchMakingServerResponse) -> void #cpp_method;
}

ISteamMatchmakingServerListResponse_ServerResponded :: inline (this: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) { this.vtable.ServerResponded(this, hRequest, iServer); }

ISteamMatchmakingServerListResponse_ServerFailedToRespond :: inline (this: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) { this.vtable.ServerFailedToRespond(this, hRequest, iServer); }

ISteamMatchmakingServerListResponse_RefreshComplete :: inline (this: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, response: EMatchMakingServerResponse) { this.vtable.RefreshComplete(this, hRequest, response); }

vtable :: (obj: *ISteamMatchmakingServerListResponse) -> *ISteamMatchmakingServerListResponse_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Callback interface for receiving responses after pinging an individual server
//
// These callbacks all occur in response to querying an individual server
// via the ISteamMatchmakingServers()->PingServer() call below.  If you are
// destructing an object that implements this interface then you should call
// ISteamMatchmakingServers()->CancelServerQuery() passing in the handle to the query
// which is in progress.  Failure to cancel in progress queries when destructing
// a callback handler may result in a crash when a callback later occurs.
//-----------------------------------------------------------------------------
ISteamMatchmakingPingResponse :: struct {
    vtable: *ISteamMatchmakingPingResponse_VTable;
}
ISteamMatchmakingPingResponse_VTable :: struct #type_info_none {
    ServerResponded: (this: *ISteamMatchmakingPingResponse, server: *gameserveritem_t) -> void #cpp_method;

    ServerFailedToRespond: (this: *ISteamMatchmakingPingResponse) -> void #cpp_method;
}

ISteamMatchmakingPingResponse_ServerResponded :: inline (this: *ISteamMatchmakingPingResponse, server: *gameserveritem_t) { this.vtable.ServerResponded(this, server); }

ISteamMatchmakingPingResponse_ServerFailedToRespond :: inline (this: *ISteamMatchmakingPingResponse) { this.vtable.ServerFailedToRespond(this); }

vtable :: (obj: *ISteamMatchmakingPingResponse) -> *ISteamMatchmakingPingResponse_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Callback interface for receiving responses after requesting details on
// who is playing on a particular server.
//
// These callbacks all occur in response to querying an individual server
// via the ISteamMatchmakingServers()->PlayerDetails() call below.  If you are
// destructing an object that implements this interface then you should call
// ISteamMatchmakingServers()->CancelServerQuery() passing in the handle to the query
// which is in progress.  Failure to cancel in progress queries when destructing
// a callback handler may result in a crash when a callback later occurs.
//-----------------------------------------------------------------------------
ISteamMatchmakingPlayersResponse :: struct {
    vtable: *ISteamMatchmakingPlayersResponse_VTable;
}
ISteamMatchmakingPlayersResponse_VTable :: struct #type_info_none {
    AddPlayerToList: (this: *ISteamMatchmakingPlayersResponse, pchName: *u8, nScore: s32, flTimePlayed: float) -> void #cpp_method;

    PlayersFailedToRespond: (this: *ISteamMatchmakingPlayersResponse) -> void #cpp_method;

    PlayersRefreshComplete: (this: *ISteamMatchmakingPlayersResponse) -> void #cpp_method;
}

ISteamMatchmakingPlayersResponse_AddPlayerToList :: inline (this: *ISteamMatchmakingPlayersResponse, pchName: *u8, nScore: s32, flTimePlayed: float) { this.vtable.AddPlayerToList(this, pchName, nScore, flTimePlayed); }

ISteamMatchmakingPlayersResponse_PlayersFailedToRespond :: inline (this: *ISteamMatchmakingPlayersResponse) { this.vtable.PlayersFailedToRespond(this); }

ISteamMatchmakingPlayersResponse_PlayersRefreshComplete :: inline (this: *ISteamMatchmakingPlayersResponse) { this.vtable.PlayersRefreshComplete(this); }

vtable :: (obj: *ISteamMatchmakingPlayersResponse) -> *ISteamMatchmakingPlayersResponse_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Callback interface for receiving responses after requesting rules
// details on a particular server.
//
// These callbacks all occur in response to querying an individual server
// via the ISteamMatchmakingServers()->ServerRules() call below.  If you are
// destructing an object that implements this interface then you should call
// ISteamMatchmakingServers()->CancelServerQuery() passing in the handle to the query
// which is in progress.  Failure to cancel in progress queries when destructing
// a callback handler may result in a crash when a callback later occurs.
//-----------------------------------------------------------------------------
ISteamMatchmakingRulesResponse :: struct {
    vtable: *ISteamMatchmakingRulesResponse_VTable;
}
ISteamMatchmakingRulesResponse_VTable :: struct #type_info_none {
    RulesResponded: (this: *ISteamMatchmakingRulesResponse, pchRule: *u8, pchValue: *u8) -> void #cpp_method;

    RulesFailedToRespond: (this: *ISteamMatchmakingRulesResponse) -> void #cpp_method;

    RulesRefreshComplete: (this: *ISteamMatchmakingRulesResponse) -> void #cpp_method;
}

ISteamMatchmakingRulesResponse_RulesResponded :: inline (this: *ISteamMatchmakingRulesResponse, pchRule: *u8, pchValue: *u8) { this.vtable.RulesResponded(this, pchRule, pchValue); }

ISteamMatchmakingRulesResponse_RulesFailedToRespond :: inline (this: *ISteamMatchmakingRulesResponse) { this.vtable.RulesFailedToRespond(this); }

ISteamMatchmakingRulesResponse_RulesRefreshComplete :: inline (this: *ISteamMatchmakingRulesResponse) { this.vtable.RulesRefreshComplete(this); }

vtable :: (obj: *ISteamMatchmakingRulesResponse) -> *ISteamMatchmakingRulesResponse_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Typedef for handle type you will receive when querying details on an individual server.
//-----------------------------------------------------------------------------
HServerQuery :: s32;
HSERVERQUERY_INVALID: s32 : 4294967295;

//-----------------------------------------------------------------------------
// Purpose: Functions for match making services for clients to get to game lists and details
//-----------------------------------------------------------------------------
ISteamMatchmakingServers :: struct {
    vtable: *ISteamMatchmakingServers_VTable;
}
ISteamMatchmakingServers_VTable :: struct #type_info_none {
    RequestInternetServerList: (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #cpp_method;
    RequestLANServerList: (this: *ISteamMatchmakingServers, iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #cpp_method;
    RequestFriendsServerList: (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #cpp_method;
    RequestFavoritesServerList: (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #cpp_method;
    RequestHistoryServerList: (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #cpp_method;
    RequestSpectatorServerList: (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #cpp_method;

    ReleaseRequest: (this: *ISteamMatchmakingServers, hServerListRequest: HServerListRequest) -> void #cpp_method;

    GetServerDetails: (this: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t #cpp_method;

    CancelQuery: (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> void #cpp_method;

    RefreshQuery: (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> void #cpp_method;

    IsRefreshing: (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> bool #cpp_method;

    GetServerCount: (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> s32 #cpp_method;

    RefreshServer: (this: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) -> void #cpp_method;

    PingServer: (this: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery #cpp_method;

    PlayerDetails: (this: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery #cpp_method;

    ServerRules: (this: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery #cpp_method;

    CancelServerQuery: (this: *ISteamMatchmakingServers, hServerQuery: HServerQuery) -> void #cpp_method;
}

ISteamMatchmakingServers_RequestInternetServerList :: inline (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest { return this.vtable.RequestInternetServerList(this, iApp, ppchFilters, nFilters, pRequestServersResponse); }
ISteamMatchmakingServers_RequestLANServerList :: inline (this: *ISteamMatchmakingServers, iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest { return this.vtable.RequestLANServerList(this, iApp, pRequestServersResponse); }
ISteamMatchmakingServers_RequestFriendsServerList :: inline (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest { return this.vtable.RequestFriendsServerList(this, iApp, ppchFilters, nFilters, pRequestServersResponse); }
ISteamMatchmakingServers_RequestFavoritesServerList :: inline (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest { return this.vtable.RequestFavoritesServerList(this, iApp, ppchFilters, nFilters, pRequestServersResponse); }
ISteamMatchmakingServers_RequestHistoryServerList :: inline (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest { return this.vtable.RequestHistoryServerList(this, iApp, ppchFilters, nFilters, pRequestServersResponse); }
ISteamMatchmakingServers_RequestSpectatorServerList :: inline (this: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest { return this.vtable.RequestSpectatorServerList(this, iApp, ppchFilters, nFilters, pRequestServersResponse); }

ISteamMatchmakingServers_ReleaseRequest :: inline (this: *ISteamMatchmakingServers, hServerListRequest: HServerListRequest) { this.vtable.ReleaseRequest(this, hServerListRequest); }

ISteamMatchmakingServers_GetServerDetails :: inline (this: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t { return this.vtable.GetServerDetails(this, hRequest, iServer); }

ISteamMatchmakingServers_CancelQuery :: inline (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) { this.vtable.CancelQuery(this, hRequest); }

ISteamMatchmakingServers_RefreshQuery :: inline (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) { this.vtable.RefreshQuery(this, hRequest); }

ISteamMatchmakingServers_IsRefreshing :: inline (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> bool { return this.vtable.IsRefreshing(this, hRequest); }

ISteamMatchmakingServers_GetServerCount :: inline (this: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> s32 { return this.vtable.GetServerCount(this, hRequest); }

ISteamMatchmakingServers_RefreshServer :: inline (this: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) { this.vtable.RefreshServer(this, hRequest, iServer); }

ISteamMatchmakingServers_PingServer :: inline (this: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery { return this.vtable.PingServer(this, unIP, usPort, pRequestServersResponse); }

ISteamMatchmakingServers_PlayerDetails :: inline (this: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery { return this.vtable.PlayerDetails(this, unIP, usPort, pRequestServersResponse); }

ISteamMatchmakingServers_ServerRules :: inline (this: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery { return this.vtable.ServerRules(this, unIP, usPort, pRequestServersResponse); }

ISteamMatchmakingServers_CancelServerQuery :: inline (this: *ISteamMatchmakingServers, hServerQuery: HServerQuery) { this.vtable.CancelServerQuery(this, hServerQuery); }

vtable :: (obj: *ISteamMatchmakingServers) -> *ISteamMatchmakingServers_VTable { return obj.vtable; }


// game server flags
k_unFavoriteFlagNone: uint32 : 0;
k_unFavoriteFlagFavorite: uint32 : 1; // this game favorite entry is for the favorites list
k_unFavoriteFlagHistory: uint32 : 2; // this game favorite entry is for the history list

//-----------------------------------------------------------------------------
// Purpose: Used in ChatInfo messages - fields specific to a chat member - must fit in a uint32
//-----------------------------------------------------------------------------
EChatMemberStateChange :: enum s32 {
    EChatMemberStateChangeEntered      :: 1;
    EChatMemberStateChangeLeft         :: 2;
    EChatMemberStateChangeDisconnected :: 4;
    EChatMemberStateChangeKicked       :: 8;
    EChatMemberStateChangeBanned       :: 16;

    k_EChatMemberStateChangeEntered      :: EChatMemberStateChangeEntered;
    k_EChatMemberStateChangeLeft         :: EChatMemberStateChangeLeft;
    k_EChatMemberStateChangeDisconnected :: EChatMemberStateChangeDisconnected;
    k_EChatMemberStateChangeKicked       :: EChatMemberStateChangeKicked;
    k_EChatMemberStateChangeBanned       :: EChatMemberStateChangeBanned;
}

//-----------------------------------------------------------------------------
// Purpose: Functions for match making services for clients to get to favorites
//			and to operate on game lobbies.
//-----------------------------------------------------------------------------
ISteamGameSearch :: struct {
    vtable: *ISteamGameSearch_VTable;
}
ISteamGameSearch_VTable :: struct #type_info_none {
    AddGameSearchParams: (this: *ISteamGameSearch, pchKeyToFind: *u8, pchValuesToFind: *u8) -> EGameSearchErrorCode_t #cpp_method;

    SearchForGameWithLobby: (this: *ISteamGameSearch, steamIDLobby: CSteamID, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t #cpp_method;

    SearchForGameSolo: (this: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t #cpp_method;

    AcceptGame: (this: *ISteamGameSearch) -> EGameSearchErrorCode_t #cpp_method;
    DeclineGame: (this: *ISteamGameSearch) -> EGameSearchErrorCode_t #cpp_method;

    RetrieveConnectionDetails: (this: *ISteamGameSearch, steamIDHost: CSteamID, pchConnectionDetails: *u8, cubConnectionDetails: s32) -> EGameSearchErrorCode_t #cpp_method;

    EndGameSearch: (this: *ISteamGameSearch) -> EGameSearchErrorCode_t #cpp_method;

    SetGameHostParams: (this: *ISteamGameSearch, pchKey: *u8, pchValue: *u8) -> EGameSearchErrorCode_t #cpp_method;

    SetConnectionDetails: (this: *ISteamGameSearch, pchConnectionDetails: *u8, cubConnectionDetails: s32) -> EGameSearchErrorCode_t #cpp_method;

    RequestPlayersForGame: (this: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32, nMaxTeamSize: s32) -> EGameSearchErrorCode_t #cpp_method;

    HostConfirmGameStart: (this: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t #cpp_method;

    CancelRequestPlayersForGame: (this: *ISteamGameSearch) -> EGameSearchErrorCode_t #cpp_method;

    SubmitPlayerResult: (this: *ISteamGameSearch, ullUniqueGameID: uint64, steamIDPlayer: CSteamID, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t #cpp_method;

    EndGame: (this: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t #cpp_method;
}

ISteamGameSearch_AddGameSearchParams :: inline (this: *ISteamGameSearch, pchKeyToFind: *u8, pchValuesToFind: *u8) -> EGameSearchErrorCode_t { return this.vtable.AddGameSearchParams(this, pchKeyToFind, pchValuesToFind); }

ISteamGameSearch_SearchForGameWithLobby :: inline (this: *ISteamGameSearch, steamIDLobby: CSteamID, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t { return this.vtable.SearchForGameWithLobby(this, steamIDLobby, nPlayerMin, nPlayerMax); }

ISteamGameSearch_SearchForGameSolo :: inline (this: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t { return this.vtable.SearchForGameSolo(this, nPlayerMin, nPlayerMax); }

ISteamGameSearch_AcceptGame :: inline (this: *ISteamGameSearch) -> EGameSearchErrorCode_t { return this.vtable.AcceptGame(this); }
ISteamGameSearch_DeclineGame :: inline (this: *ISteamGameSearch) -> EGameSearchErrorCode_t { return this.vtable.DeclineGame(this); }

ISteamGameSearch_RetrieveConnectionDetails :: inline (this: *ISteamGameSearch, steamIDHost: CSteamID, pchConnectionDetails: *u8, cubConnectionDetails: s32) -> EGameSearchErrorCode_t { return this.vtable.RetrieveConnectionDetails(this, steamIDHost, pchConnectionDetails, cubConnectionDetails); }

ISteamGameSearch_EndGameSearch :: inline (this: *ISteamGameSearch) -> EGameSearchErrorCode_t { return this.vtable.EndGameSearch(this); }

ISteamGameSearch_SetGameHostParams :: inline (this: *ISteamGameSearch, pchKey: *u8, pchValue: *u8) -> EGameSearchErrorCode_t { return this.vtable.SetGameHostParams(this, pchKey, pchValue); }

ISteamGameSearch_SetConnectionDetails :: inline (this: *ISteamGameSearch, pchConnectionDetails: *u8, cubConnectionDetails: s32) -> EGameSearchErrorCode_t { return this.vtable.SetConnectionDetails(this, pchConnectionDetails, cubConnectionDetails); }

ISteamGameSearch_RequestPlayersForGame :: inline (this: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32, nMaxTeamSize: s32) -> EGameSearchErrorCode_t { return this.vtable.RequestPlayersForGame(this, nPlayerMin, nPlayerMax, nMaxTeamSize); }

ISteamGameSearch_HostConfirmGameStart :: inline (this: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t { return this.vtable.HostConfirmGameStart(this, ullUniqueGameID); }

ISteamGameSearch_CancelRequestPlayersForGame :: inline (this: *ISteamGameSearch) -> EGameSearchErrorCode_t { return this.vtable.CancelRequestPlayersForGame(this); }

ISteamGameSearch_SubmitPlayerResult :: inline (this: *ISteamGameSearch, ullUniqueGameID: uint64, steamIDPlayer: CSteamID, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t { return this.vtable.SubmitPlayerResult(this, ullUniqueGameID, steamIDPlayer, EPlayerResult); }

ISteamGameSearch_EndGame :: inline (this: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t { return this.vtable.EndGame(this, ullUniqueGameID); }

vtable :: (obj: *ISteamGameSearch) -> *ISteamGameSearch_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Functions for quickly creating a Party with friends or acquaintances,
//			EG from chat rooms.
//-----------------------------------------------------------------------------
ESteamPartyBeaconLocationType :: enum s32 {
    Invalid   :: 0;
    ChatGroup :: 1;

    Max       :: 2;

    k_ESteamPartyBeaconLocationType_Invalid   :: Invalid;
    k_ESteamPartyBeaconLocationType_ChatGroup :: ChatGroup;

    k_ESteamPartyBeaconLocationType_Max       :: Max;
}

SteamPartyBeaconLocation_t :: struct {
    m_eType:        ESteamPartyBeaconLocationType;
    m_ulLocationID: uint64;
}

ESteamPartyBeaconLocationData :: enum s32 {
    ESteamPartyBeaconLocationDataInvalid       :: 0;
    ESteamPartyBeaconLocationDataName          :: 1;
    ESteamPartyBeaconLocationDataIconURLSmall  :: 2;
    ESteamPartyBeaconLocationDataIconURLMedium :: 3;
    ESteamPartyBeaconLocationDataIconURLLarge  :: 4;

    k_ESteamPartyBeaconLocationDataInvalid       :: ESteamPartyBeaconLocationDataInvalid;
    k_ESteamPartyBeaconLocationDataName          :: ESteamPartyBeaconLocationDataName;
    k_ESteamPartyBeaconLocationDataIconURLSmall  :: ESteamPartyBeaconLocationDataIconURLSmall;
    k_ESteamPartyBeaconLocationDataIconURLMedium :: ESteamPartyBeaconLocationDataIconURLMedium;
    k_ESteamPartyBeaconLocationDataIconURLLarge  :: ESteamPartyBeaconLocationDataIconURLLarge;
}

ISteamParties :: struct {
    vtable: *ISteamParties_VTable;
}
ISteamParties_VTable :: struct #type_info_none {
    GetNumActiveBeacons: (this: *ISteamParties) -> uint32 #cpp_method;
    GetBeaconByIndex: (this: *ISteamParties, unIndex: uint32) -> PartyBeaconID_t #cpp_method;
    GetBeaconDetails: (this: *ISteamParties, ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *u8, cchMetadata: s32) -> bool #cpp_method;

    JoinParty: (this: *ISteamParties, ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t #cpp_method;

    GetNumAvailableBeaconLocations: (this: *ISteamParties, puNumLocations: *uint32) -> bool #cpp_method;
    GetAvailableBeaconLocations: (this: *ISteamParties, pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool #cpp_method;

    CreateBeacon: (this: *ISteamParties, unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *u8, pchMetadata: *u8) -> SteamAPICall_t #cpp_method;

    OnReservationCompleted: (this: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) -> void #cpp_method;

    CancelReservation: (this: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) -> void #cpp_method;

    ChangeNumOpenSlots: (this: *ISteamParties, ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t #cpp_method;

    DestroyBeacon: (this: *ISteamParties, ulBeacon: PartyBeaconID_t) -> bool #cpp_method;

    GetBeaconLocationData: (this: *ISteamParties, BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *u8, cchDataStringOut: s32) -> bool #cpp_method;
}

ISteamParties_GetNumActiveBeacons :: inline (this: *ISteamParties) -> uint32 { return this.vtable.GetNumActiveBeacons(this); }
ISteamParties_GetBeaconByIndex :: inline (this: *ISteamParties, unIndex: uint32) -> PartyBeaconID_t { return this.vtable.GetBeaconByIndex(this, unIndex); }
ISteamParties_GetBeaconDetails :: inline (this: *ISteamParties, ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *u8, cchMetadata: s32) -> bool { return this.vtable.GetBeaconDetails(this, ulBeaconID, pSteamIDBeaconOwner, pLocation, pchMetadata, cchMetadata); }

ISteamParties_JoinParty :: inline (this: *ISteamParties, ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t { return this.vtable.JoinParty(this, ulBeaconID); }

ISteamParties_GetNumAvailableBeaconLocations :: inline (this: *ISteamParties, puNumLocations: *uint32) -> bool { return this.vtable.GetNumAvailableBeaconLocations(this, puNumLocations); }
ISteamParties_GetAvailableBeaconLocations :: inline (this: *ISteamParties, pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool { return this.vtable.GetAvailableBeaconLocations(this, pLocationList, uMaxNumLocations); }

ISteamParties_CreateBeacon :: inline (this: *ISteamParties, unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *u8, pchMetadata: *u8) -> SteamAPICall_t { return this.vtable.CreateBeacon(this, unOpenSlots, pBeaconLocation, pchConnectString, pchMetadata); }

ISteamParties_OnReservationCompleted :: inline (this: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) { this.vtable.OnReservationCompleted(this, ulBeacon, steamIDUser); }

ISteamParties_CancelReservation :: inline (this: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: CSteamID) { this.vtable.CancelReservation(this, ulBeacon, steamIDUser); }

ISteamParties_ChangeNumOpenSlots :: inline (this: *ISteamParties, ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t { return this.vtable.ChangeNumOpenSlots(this, ulBeacon, unOpenSlots); }

ISteamParties_DestroyBeacon :: inline (this: *ISteamParties, ulBeacon: PartyBeaconID_t) -> bool { return this.vtable.DestroyBeacon(this, ulBeacon); }

ISteamParties_GetBeaconLocationData :: inline (this: *ISteamParties, BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *u8, cchDataStringOut: s32) -> bool { return this.vtable.GetBeaconLocationData(this, BeaconLocation, eData, pchDataStringOut, cchDataStringOut); }

vtable :: (obj: *ISteamParties) -> *ISteamParties_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: a server was added/removed from the favorites list, you should refresh now
//-----------------------------------------------------------------------------
FavoritesListChanged_t :: struct {
    anon_enum_88 :: enum s32 {
        k_iCallback :: 502;
    }
    m_nIP:         uint32; // an IP of 0 means reload the whole list, any other value means just one server
    m_nQueryPort:  uint32;
    m_nConnPort:   uint32;
    m_nAppID:      uint32;
    m_nFlags:      uint32;
    m_bAdd:        bool; // true if this is adding the entry, otherwise it is a remove
    m_unAccountId: AccountID_t;
}

//-----------------------------------------------------------------------------
// Purpose: Someone has invited you to join a Lobby
//			normally you don't need to do anything with this, since
//			the Steam UI will also display a '<user> has invited you to the lobby, join?' dialog
//
//			if the user outside a game chooses to join, your game will be launched with the parameter "+connect_lobby <64-bit lobby id>",
//			or with the callback GameLobbyJoinRequested_t if they're already in-game
//-----------------------------------------------------------------------------
LobbyInvite_t :: struct {
    anon_enum_89 :: enum s32 {
        k_iCallback :: 503;
    }

    m_ulSteamIDUser:  uint64; // Steam ID of the person making the invite
    m_ulSteamIDLobby: uint64; // Steam ID of the Lobby
    m_ulGameID:       uint64; // GameID of the Lobby
}

//-----------------------------------------------------------------------------
// Purpose: Sent on entering a lobby, or on failing to enter
//			m_EChatRoomEnterResponse will be set to k_EChatRoomEnterResponseSuccess on success,
//			or a higher value on failure (see enum EChatRoomEnterResponse)
//-----------------------------------------------------------------------------
LobbyEnter_t :: struct {
    anon_enum_90 :: enum s32 {
        k_iCallback :: 504;
    }

    m_ulSteamIDLobby:         uint64; // SteamID of the Lobby you have entered
    m_rgfChatPermissions:     uint32; // Permissions of the current user
    m_bLocked:                bool; // If true, then only invited users may join
    m_EChatRoomEnterResponse: uint32; // EChatRoomEnterResponse
}

//-----------------------------------------------------------------------------
// Purpose: The lobby metadata has changed
//			if m_ulSteamIDMember is the steamID of a lobby member, use GetLobbyMemberData() to access per-user details
//			if m_ulSteamIDMember == m_ulSteamIDLobby, use GetLobbyData() to access lobby metadata
//-----------------------------------------------------------------------------
LobbyDataUpdate_t :: struct {
    anon_enum_91 :: enum s32 {
        k_iCallback :: 505;
    }

    m_ulSteamIDLobby:  uint64; // steamID of the Lobby
    m_ulSteamIDMember: uint64; // steamID of the member whose data changed, or the room itself
    m_bSuccess:        uint8; // true if we lobby data was successfully changed; 
}

//-----------------------------------------------------------------------------
// Purpose: The lobby chat room state has changed
//			this is usually sent when a user has joined or left the lobby
//-----------------------------------------------------------------------------
LobbyChatUpdate_t :: struct {
    anon_enum_92 :: enum s32 {
        k_iCallback :: 506;
    }

    m_ulSteamIDLobby:           uint64; // Lobby ID
    m_ulSteamIDUserChanged:     uint64; // user who's status in the lobby just changed - can be recipient
    m_ulSteamIDMakingChange:    uint64; // Chat member who made the change (different from SteamIDUserChange if kicking, muting, etc.)

    m_rgfChatMemberStateChange: uint32; // bitfield of EChatMemberStateChange values
}

//-----------------------------------------------------------------------------
// Purpose: A chat message for this lobby has been sent
//			use GetLobbyChatEntry( m_iChatID ) to retrieve the contents of this message
//-----------------------------------------------------------------------------
LobbyChatMsg_t :: struct {
    anon_enum_93 :: enum s32 {
        k_iCallback :: 507;
    }

    m_ulSteamIDLobby: uint64; // the lobby id this is in
    m_ulSteamIDUser:  uint64; // steamID of the user who has sent this message
    m_eChatEntryType: uint8; // type of message
    m_iChatID:        uint32; // index of the chat entry to lookup
}

//-----------------------------------------------------------------------------
// Purpose: A game created a game for all the members of the lobby to join,
//			as triggered by a SetLobbyGameServer()
//			it's up to the individual clients to take action on this; the usual
//			game behavior is to leave the lobby and connect to the specified game server
//-----------------------------------------------------------------------------
LobbyGameCreated_t :: struct {
    anon_enum_94 :: enum s32 {
        k_iCallback :: 509;
    }

    m_ulSteamIDLobby:      uint64; // the lobby we were in
    m_ulSteamIDGameServer: uint64; // the new game server that has been created or found for the lobby members
    m_unIP:                uint32; // IP & Port of the game server (if any)
    m_usPort:              uint16;
}

//-----------------------------------------------------------------------------
// Purpose: Number of matching lobbies found
//			iterate the returned lobbies with GetLobbyByIndex(), from values 0 to m_nLobbiesMatching-1
//-----------------------------------------------------------------------------
LobbyMatchList_t :: struct {
    anon_enum_95 :: enum s32 {
        k_iCallback :: 510;
    }
    m_nLobbiesMatching: uint32; // Number of lobbies that matched search criteria and we have SteamIDs for
}

//-----------------------------------------------------------------------------
// Purpose: posted if a user is forcefully removed from a lobby
//			can occur if a user loses connection to Steam
//-----------------------------------------------------------------------------
LobbyKicked_t :: struct {
    anon_enum_96 :: enum s32 {
        k_iCallback :: 512;
    }
    m_ulSteamIDLobby:         uint64; // Lobby
    m_ulSteamIDAdmin:         uint64; // User who kicked you - possibly the ID of the lobby itself
    m_bKickedDueToDisconnect: uint8; // true if you were kicked from the lobby due to the user losing connection to Steam (currently always true)
}

//-----------------------------------------------------------------------------
// Purpose: Result of our request to create a Lobby
//			m_eResult == k_EResultOK on success
//			at this point, the lobby has been joined and is ready for use
//			a LobbyEnter_t callback will also be received (since the local user is joining their own lobby)
//-----------------------------------------------------------------------------
LobbyCreated_t :: struct {
    anon_enum_97 :: enum s32 {
        k_iCallback :: 513;
    }

    m_eResult:        EResult; // k_EResultOK - the lobby was successfully created

    m_ulSteamIDLobby: uint64; // chat room, zero if failed
}

//-----------------------------------------------------------------------------
// Purpose: Result of CheckForPSNGameBootInvite
//			m_eResult == k_EResultOK on success
//			at this point, the local user may not have finishing joining this lobby;
//			game code should wait until the subsequent LobbyEnter_t callback is received
//-----------------------------------------------------------------------------
PSNGameBootInviteResult_t :: struct {
    anon_enum_98 :: enum s32 {
        k_iCallback :: 515;
    }

    m_bGameBootInviteExists: bool;
    m_steamIDLobby:          CSteamID #align 1; // Should be valid if m_bGameBootInviteExists == true
}

//-----------------------------------------------------------------------------
// Purpose: Result of our request to create a Lobby
//			m_eResult == k_EResultOK on success
//			at this point, the lobby has been joined and is ready for use
//			a LobbyEnter_t callback will also be received (since the local user is joining their own lobby)
//-----------------------------------------------------------------------------
FavoritesListAccountsUpdated_t :: struct {
    anon_enum_99 :: enum s32 {
        k_iCallback :: 516;
    }

    m_eResult: EResult;
}

//-----------------------------------------------------------------------------
// Callbacks for ISteamGameSearch (which go through the regular Steam callback registration system)
SearchForGameProgressCallback_t :: struct {
    anon_enum_100 :: enum s32 {
        k_iCallback :: 5201;
    }

    m_ullSearchID:               uint64; // all future callbacks referencing this search will include this Search ID

    m_eResult:                   EResult; // if search has started this result will be k_EResultOK, any other value indicates search has failed to start or has terminated
    m_lobbyID:                   CSteamID #align 4; // lobby ID if lobby search, invalid steamID otherwise
    m_steamIDEndedSearch:        CSteamID #align 4; // if search was terminated, steamID that terminated search

    m_nSecondsRemainingEstimate: int32;
    m_cPlayersSearching:         int32;
}

// notification to all players searching that a game has been found
SearchForGameResultCallback_t :: struct {
    anon_enum_101 :: enum s32 {
        k_iCallback :: 5202;
    }

    m_ullSearchID:         uint64;

    m_eResult:             EResult; // if game/host was lost this will be an error value

    // if m_bGameFound is true the following are non-zero
    m_nCountPlayersInGame: int32;
    m_nCountAcceptedGame:  int32;

    // if m_steamIDHost is valid the host has started the game
    m_steamIDHost:         CSteamID #align 4;
    m_bFinalCallback:      bool;
}

// callback from RequestPlayersForGame when the matchmaking service has started or ended search
// callback will also follow a call from CancelRequestPlayersForGame - m_bSearchInProgress will be false
RequestPlayersForGameProgressCallback_t :: struct {
    anon_enum_102 :: enum s32 {
        k_iCallback :: 5211;
    }

    m_eResult:     EResult; // m_ullSearchID will be non-zero if this is k_EResultOK
    m_ullSearchID: uint64; // all future callbacks referencing this search will include this Search ID
}

// callback from RequestPlayersForGame
// one of these will be sent per player
// followed by additional callbacks when players accept or decline the game
RequestPlayersForGameResultCallback_t :: struct {
    anon_enum_103 :: enum s32 {
        k_iCallback :: 5212;
    }

    m_eResult:                   EResult; // m_ullSearchID will be non-zero if this is k_EResultOK
    m_ullSearchID:               uint64;

    m_SteamIDPlayerFound:        CSteamID; // player steamID
    m_SteamIDLobby:              CSteamID; // if the player is in a lobby, the lobby ID
    PlayerAcceptState_t :: enum s32 {
        EStateUnknown        :: 0;
        EStatePlayerAccepted :: 1;
        EStatePlayerDeclined :: 2;

        k_EStateUnknown        :: EStateUnknown;
        k_EStatePlayerAccepted :: EStatePlayerAccepted;
        k_EStatePlayerDeclined :: EStatePlayerDeclined;
    }

    m_ePlayerAcceptState:        PlayerAcceptState_t;
    m_nPlayerIndex:              int32;
    m_nTotalPlayersFound:        int32; // expect this many callbacks at minimum
    m_nTotalPlayersAcceptedGame: int32;
    m_nSuggestedTeamIndex:       int32;
    m_ullUniqueGameID:           uint64;
}

RequestPlayersForGameFinalResultCallback_t :: struct {
    anon_enum_104 :: enum s32 {
        k_iCallback :: 5213;
    }

    m_eResult:         EResult;
    m_ullSearchID:     uint64;
    m_ullUniqueGameID: uint64;
}

// this callback confirms that results were received by the matchmaking service for this player
SubmitPlayerResultResultCallback_t :: struct {
    anon_enum_105 :: enum s32 {
        k_iCallback :: 5214;
    }

    m_eResult:       EResult;
    ullUniqueGameID: uint64;
    steamIDPlayer:   CSteamID;
}

// this callback confirms that the game is recorded as complete on the matchmaking service
// the next call to RequestPlayersForGame will generate a new unique game ID
EndGameResultCallback_t :: struct {
    anon_enum_106 :: enum s32 {
        k_iCallback :: 5215;
    }

    m_eResult:       EResult;
    ullUniqueGameID: uint64;
}

// Steam has responded to the user request to join a party via the given Beacon ID.
// If successful, the connect string contains game-specific instructions to connect
// to the game with that party.
JoinPartyCallback_t :: struct {
    anon_enum_107 :: enum s32 {
        k_iCallback :: 5301;
    }

    m_eResult:            EResult;
    m_ulBeaconID:         PartyBeaconID_t;
    m_SteamIDBeaconOwner: CSteamID;
    m_rgchConnectString:  [256] u8;
}

// Response to CreateBeacon request. If successful, the beacon ID is provided.
CreateBeaconCallback_t :: struct {
    anon_enum_108 :: enum s32 {
        k_iCallback :: 5302;
    }

    m_eResult:    EResult;
    m_ulBeaconID: PartyBeaconID_t;
}

// Someone has used the beacon to join your party - they are in-flight now
// and we've reserved one of the open slots for them.
// You should confirm when they join your party by calling OnReservationCompleted().
// Otherwise, Steam may timeout their reservation eventually.
ReservationNotificationCallback_t :: struct {
    anon_enum_109 :: enum s32 {
        k_iCallback :: 5303;
    }

    m_ulBeaconID:    PartyBeaconID_t;
    m_steamIDJoiner: CSteamID;
}

// Response to ChangeNumOpenSlots call
ChangeNumOpenSlotsCallback_t :: struct {
    anon_enum_110 :: enum s32 {
        k_iCallback :: 5304;
    }

    m_eResult: EResult;
}

// The list of possible Party beacon locations has changed
AvailableBeaconLocationsUpdated_t :: struct {
    anon_enum_111 :: enum s32 {
        k_iCallback :: 5305;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

// The list of active beacons may have changed
ActiveBeaconsUpdated_t :: struct {
    anon_enum_112 :: enum s32 {
        k_iCallback :: 5306;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// Purpose: Defines the largest allowed file size. Cloud files cannot be written
// in a single chunk over 100MB (and cannot be over 200MB total.)
//-----------------------------------------------------------------------------
k_unMaxCloudFileChunkSize: uint32 : 100 * 1024 * 1024;

SteamParamStringArray_t :: struct {
    m_ppStrings:   **u8;
    m_nNumStrings: int32;
}

// A handle to a piece of user generated content
UGCHandle_t :: uint64;
PublishedFileUpdateHandle_t :: uint64;
PublishedFileId_t :: uint64;
k_PublishedFileIdInvalid: PublishedFileId_t : 0;
k_UGCHandleInvalid: UGCHandle_t : 0xffff_ffff_ffff_ffff;
k_PublishedFileUpdateHandleInvalid: PublishedFileUpdateHandle_t : 0xffff_ffff_ffff_ffff;

// Handle for writing to Steam Cloud
UGCFileWriteStreamHandle_t :: uint64;
k_UGCFileStreamHandleInvalid: UGCFileWriteStreamHandle_t : 0xffff_ffff_ffff_ffff;

k_cchPublishedDocumentTitleMax: uint32 : 128 + 1;
k_cchPublishedDocumentDescriptionMax: uint32 : 8000;
k_cchPublishedDocumentChangeDescriptionMax: uint32 : 8000;
k_unEnumeratePublishedFilesMaxResults: uint32 : 50;
k_cchTagListMax: uint32 : 1024 + 1;
k_cchFilenameMax: uint32 : 260;
k_cchPublishedFileURLMax: uint32 : 256;

ERemoteStoragePlatform :: enum s32 {
    ERemoteStoragePlatformNone    :: 0;
    ERemoteStoragePlatformWindows :: 1;
    ERemoteStoragePlatformOSX     :: 2;
    ERemoteStoragePlatformPS3     :: 4;
    ERemoteStoragePlatformLinux   :: 8;
    ERemoteStoragePlatformSwitch  :: 16;
    ERemoteStoragePlatformAndroid :: 32;
    ERemoteStoragePlatformIOS     :: 64;

    ERemoteStoragePlatformAll     :: -1;

    k_ERemoteStoragePlatformNone    :: ERemoteStoragePlatformNone;
    k_ERemoteStoragePlatformWindows :: ERemoteStoragePlatformWindows;
    k_ERemoteStoragePlatformOSX     :: ERemoteStoragePlatformOSX;
    k_ERemoteStoragePlatformPS3     :: ERemoteStoragePlatformPS3;
    k_ERemoteStoragePlatformLinux   :: ERemoteStoragePlatformLinux;
    k_ERemoteStoragePlatformSwitch  :: ERemoteStoragePlatformSwitch;
    k_ERemoteStoragePlatformAndroid :: ERemoteStoragePlatformAndroid;
    k_ERemoteStoragePlatformIOS     :: ERemoteStoragePlatformIOS;

    k_ERemoteStoragePlatformAll     :: ERemoteStoragePlatformAll;
}

ERemoteStoragePublishedFileVisibility :: enum s32 {
    ERemoteStoragePublishedFileVisibilityPublic      :: 0;
    ERemoteStoragePublishedFileVisibilityFriendsOnly :: 1;
    ERemoteStoragePublishedFileVisibilityPrivate     :: 2;
    ERemoteStoragePublishedFileVisibilityUnlisted    :: 3;

    k_ERemoteStoragePublishedFileVisibilityPublic      :: ERemoteStoragePublishedFileVisibilityPublic;
    k_ERemoteStoragePublishedFileVisibilityFriendsOnly :: ERemoteStoragePublishedFileVisibilityFriendsOnly;
    k_ERemoteStoragePublishedFileVisibilityPrivate     :: ERemoteStoragePublishedFileVisibilityPrivate;
    k_ERemoteStoragePublishedFileVisibilityUnlisted    :: ERemoteStoragePublishedFileVisibilityUnlisted;
}

EWorkshopFileType :: enum s32 {
    EWorkshopFileTypeFirst                  :: 0;

    EWorkshopFileTypeCommunity              :: 0;
    EWorkshopFileTypeMicrotransaction       :: 1;
    EWorkshopFileTypeCollection             :: 2;
    EWorkshopFileTypeArt                    :: 3;
    EWorkshopFileTypeVideo                  :: 4;
    EWorkshopFileTypeScreenshot             :: 5;
    EWorkshopFileTypeGame                   :: 6;
    EWorkshopFileTypeSoftware               :: 7;
    EWorkshopFileTypeConcept                :: 8;
    EWorkshopFileTypeWebGuide               :: 9;
    EWorkshopFileTypeIntegratedGuide        :: 10;
    EWorkshopFileTypeMerch                  :: 11;
    EWorkshopFileTypeControllerBinding      :: 12;
    EWorkshopFileTypeSteamworksAccessInvite :: 13;
    EWorkshopFileTypeSteamVideo             :: 14;
    EWorkshopFileTypeGameManagedItem        :: 15;
    EWorkshopFileTypeClip                   :: 16;

    EWorkshopFileTypeMax                    :: 17;

    k_EWorkshopFileTypeFirst                  :: EWorkshopFileTypeFirst;

    k_EWorkshopFileTypeCommunity              :: EWorkshopFileTypeCommunity;
    k_EWorkshopFileTypeMicrotransaction       :: EWorkshopFileTypeMicrotransaction;
    k_EWorkshopFileTypeCollection             :: EWorkshopFileTypeCollection;
    k_EWorkshopFileTypeArt                    :: EWorkshopFileTypeArt;
    k_EWorkshopFileTypeVideo                  :: EWorkshopFileTypeVideo;
    k_EWorkshopFileTypeScreenshot             :: EWorkshopFileTypeScreenshot;
    k_EWorkshopFileTypeGame                   :: EWorkshopFileTypeGame;
    k_EWorkshopFileTypeSoftware               :: EWorkshopFileTypeSoftware;
    k_EWorkshopFileTypeConcept                :: EWorkshopFileTypeConcept;
    k_EWorkshopFileTypeWebGuide               :: EWorkshopFileTypeWebGuide;
    k_EWorkshopFileTypeIntegratedGuide        :: EWorkshopFileTypeIntegratedGuide;
    k_EWorkshopFileTypeMerch                  :: EWorkshopFileTypeMerch;
    k_EWorkshopFileTypeControllerBinding      :: EWorkshopFileTypeControllerBinding;
    k_EWorkshopFileTypeSteamworksAccessInvite :: EWorkshopFileTypeSteamworksAccessInvite;
    k_EWorkshopFileTypeSteamVideo             :: EWorkshopFileTypeSteamVideo;
    k_EWorkshopFileTypeGameManagedItem        :: EWorkshopFileTypeGameManagedItem;
    k_EWorkshopFileTypeClip                   :: EWorkshopFileTypeClip;

    k_EWorkshopFileTypeMax                    :: EWorkshopFileTypeMax;
}

EWorkshopVote :: enum s32 {
    EWorkshopVoteUnvoted :: 0;
    EWorkshopVoteFor     :: 1;
    EWorkshopVoteAgainst :: 2;
    EWorkshopVoteLater   :: 3;

    k_EWorkshopVoteUnvoted :: EWorkshopVoteUnvoted;
    k_EWorkshopVoteFor     :: EWorkshopVoteFor;
    k_EWorkshopVoteAgainst :: EWorkshopVoteAgainst;
    k_EWorkshopVoteLater   :: EWorkshopVoteLater;
}

EWorkshopFileAction :: enum s32 {
    EWorkshopFileActionPlayed    :: 0;
    EWorkshopFileActionCompleted :: 1;

    k_EWorkshopFileActionPlayed    :: EWorkshopFileActionPlayed;
    k_EWorkshopFileActionCompleted :: EWorkshopFileActionCompleted;
}

EWorkshopEnumerationType :: enum s32 {
    EWorkshopEnumerationTypeRankedByVote            :: 0;
    EWorkshopEnumerationTypeRecent                  :: 1;
    EWorkshopEnumerationTypeTrending                :: 2;
    EWorkshopEnumerationTypeFavoritesOfFriends      :: 3;
    EWorkshopEnumerationTypeVotedByFriends          :: 4;
    EWorkshopEnumerationTypeContentByFriends        :: 5;
    EWorkshopEnumerationTypeRecentFromFollowedUsers :: 6;

    k_EWorkshopEnumerationTypeRankedByVote            :: EWorkshopEnumerationTypeRankedByVote;
    k_EWorkshopEnumerationTypeRecent                  :: EWorkshopEnumerationTypeRecent;
    k_EWorkshopEnumerationTypeTrending                :: EWorkshopEnumerationTypeTrending;
    k_EWorkshopEnumerationTypeFavoritesOfFriends      :: EWorkshopEnumerationTypeFavoritesOfFriends;
    k_EWorkshopEnumerationTypeVotedByFriends          :: EWorkshopEnumerationTypeVotedByFriends;
    k_EWorkshopEnumerationTypeContentByFriends        :: EWorkshopEnumerationTypeContentByFriends;
    k_EWorkshopEnumerationTypeRecentFromFollowedUsers :: EWorkshopEnumerationTypeRecentFromFollowedUsers;
}

EWorkshopVideoProvider :: enum s32 {
    EWorkshopVideoProviderNone    :: 0;
    EWorkshopVideoProviderYoutube :: 1;

    k_EWorkshopVideoProviderNone    :: EWorkshopVideoProviderNone;
    k_EWorkshopVideoProviderYoutube :: EWorkshopVideoProviderYoutube;
}

EUGCReadAction :: enum s32 {
    ContinueReadingUntilFinished :: 0;

    ContinueReading              :: 1;

    Close                        :: 2;

    k_EUGCRead_ContinueReadingUntilFinished :: ContinueReadingUntilFinished;

    k_EUGCRead_ContinueReading              :: ContinueReading;

    k_EUGCRead_Close                        :: Close;
}

ERemoteStorageLocalFileChange :: enum s32 {
    Invalid     :: 0;

    FileUpdated :: 1;

    FileDeleted :: 2;

    k_ERemoteStorageLocalFileChange_Invalid     :: Invalid;

    k_ERemoteStorageLocalFileChange_FileUpdated :: FileUpdated;

    k_ERemoteStorageLocalFileChange_FileDeleted :: FileDeleted;
}

ERemoteStorageFilePathType :: enum s32 {
    Invalid     :: 0;

    Absolute    :: 1;

    APIFilename :: 2;

    k_ERemoteStorageFilePathType_Invalid     :: Invalid;

    k_ERemoteStorageFilePathType_Absolute    :: Absolute;

    k_ERemoteStorageFilePathType_APIFilename :: APIFilename;
}

//-----------------------------------------------------------------------------
// Purpose: Functions for accessing, reading and writing files stored remotely
//			and cached locally
//-----------------------------------------------------------------------------
ISteamRemoteStorage :: struct {
    vtable: *ISteamRemoteStorage_VTable;
}
ISteamRemoteStorage_VTable :: struct #type_info_none {
    FileWrite: (this: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubData: int32) -> bool #cpp_method;
    FileRead: (this: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubDataToRead: int32) -> int32 #cpp_method;

    FileWriteAsync: (this: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubData: uint32) -> SteamAPICall_t #cpp_method;

    FileReadAsync: (this: *ISteamRemoteStorage, pchFile: *u8, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t #cpp_method;
    FileReadAsyncComplete: (this: *ISteamRemoteStorage, hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32) -> bool #cpp_method;

    FileForget: (this: *ISteamRemoteStorage, pchFile: *u8) -> bool #cpp_method;
    FileDelete: (this: *ISteamRemoteStorage, pchFile: *u8) -> bool #cpp_method;

    FileShare: (this: *ISteamRemoteStorage, pchFile: *u8) -> SteamAPICall_t #cpp_method;
    SetSyncPlatforms: (this: *ISteamRemoteStorage, pchFile: *u8, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool #cpp_method;

    FileWriteStreamOpen: (this: *ISteamRemoteStorage, pchFile: *u8) -> UGCFileWriteStreamHandle_t #cpp_method;
    FileWriteStreamWriteChunk: (this: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32) -> bool #cpp_method;
    FileWriteStreamClose: (this: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool #cpp_method;
    FileWriteStreamCancel: (this: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool #cpp_method;

    FileExists: (this: *ISteamRemoteStorage, pchFile: *u8) -> bool #cpp_method;
    FilePersisted: (this: *ISteamRemoteStorage, pchFile: *u8) -> bool #cpp_method;
    GetFileSize: (this: *ISteamRemoteStorage, pchFile: *u8) -> int32 #cpp_method;
    GetFileTimestamp: (this: *ISteamRemoteStorage, pchFile: *u8) -> int64 #cpp_method;
    GetSyncPlatforms: (this: *ISteamRemoteStorage, pchFile: *u8) -> ERemoteStoragePlatform #cpp_method;

    GetFileCount: (this: *ISteamRemoteStorage) -> int32 #cpp_method;
    GetFileNameAndSize: (this: *ISteamRemoteStorage, iFile: s32, pnFileSizeInBytes: *int32) -> *u8 #cpp_method;

    GetQuota: (this: *ISteamRemoteStorage, pnTotalBytes: *uint64, puAvailableBytes: *uint64) -> bool #cpp_method;
    IsCloudEnabledForAccount: (this: *ISteamRemoteStorage) -> bool #cpp_method;
    IsCloudEnabledForApp: (this: *ISteamRemoteStorage) -> bool #cpp_method;
    SetCloudEnabledForApp: (this: *ISteamRemoteStorage, bEnabled: bool) -> void #cpp_method;

    UGCDownload: (this: *ISteamRemoteStorage, hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t #cpp_method;

    GetUGCDownloadProgress: (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32) -> bool #cpp_method;

    GetUGCDetails: (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **u8, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID) -> bool #cpp_method;

    UGCRead: (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 #cpp_method;

    GetCachedUGCCount: (this: *ISteamRemoteStorage) -> int32 #cpp_method;
    GetCachedUGCHandle: (this: *ISteamRemoteStorage, iCachedContent: int32) -> UGCHandle_t #cpp_method;

    PublishWorkshopFile: (this: *ISteamRemoteStorage, pchFile: *u8, pchPreviewFile: *u8, nConsumerAppId: AppId_t, pchTitle: *u8, pchDescription: *u8, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t #cpp_method;
    CreatePublishedFileUpdateRequest: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t #cpp_method;
    UpdatePublishedFileFile: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchFile: *u8) -> bool #cpp_method;
    UpdatePublishedFilePreviewFile: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *u8) -> bool #cpp_method;
    UpdatePublishedFileTitle: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchTitle: *u8) -> bool #cpp_method;
    UpdatePublishedFileDescription: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchDescription: *u8) -> bool #cpp_method;
    UpdatePublishedFileVisibility: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #cpp_method;
    UpdatePublishedFileTags: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool #cpp_method;

    CommitPublishedFileUpdate: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t #cpp_method;

    GetPublishedFileDetails: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t #cpp_method;

    DeletePublishedFile: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    EnumerateUserPublishedFiles: (this: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t #cpp_method;

    SubscribePublishedFile: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    EnumerateUserSubscribedFiles: (this: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t #cpp_method;

    UnsubscribePublishedFile: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #cpp_method;
    UpdatePublishedFileSetChangeDescription: (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *u8) -> bool #cpp_method;

    GetPublishedItemVoteDetails: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    UpdateUserPublishedItemVote: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #cpp_method;

    GetUserPublishedItemVoteDetails: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    EnumerateUserSharedWorkshopFiles: (this: *ISteamRemoteStorage, steamId: CSteamID, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t #cpp_method;

    PublishVideo: (this: *ISteamRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *u8, pchVideoIdentifier: *u8, pchPreviewFile: *u8, nConsumerAppId: AppId_t, pchTitle: *u8, pchDescription: *u8, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t #cpp_method;

    SetUserPublishedFileAction: (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t #cpp_method;

    EnumeratePublishedFilesByUserAction: (this: *ISteamRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t #cpp_method;

    EnumeratePublishedWorkshopFiles: (this: *ISteamRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t #cpp_method;

    UGCDownloadToLocation: (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pchLocation: *u8, unPriority: uint32) -> SteamAPICall_t #cpp_method;

    GetLocalFileChangeCount: (this: *ISteamRemoteStorage) -> int32 #cpp_method;
    GetLocalFileChange: (this: *ISteamRemoteStorage, iFile: s32, pEChangeType: *ERemoteStorageLocalFileChange, pEFilePathType: *ERemoteStorageFilePathType) -> *u8 #cpp_method;

    BeginFileWriteBatch: (this: *ISteamRemoteStorage) -> bool #cpp_method;
    EndFileWriteBatch: (this: *ISteamRemoteStorage) -> bool #cpp_method;
}

ISteamRemoteStorage_FileWrite :: inline (this: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubData: int32) -> bool { return this.vtable.FileWrite(this, pchFile, pvData, cubData); }
ISteamRemoteStorage_FileRead :: inline (this: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubDataToRead: int32) -> int32 { return this.vtable.FileRead(this, pchFile, pvData, cubDataToRead); }

ISteamRemoteStorage_FileWriteAsync :: inline (this: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubData: uint32) -> SteamAPICall_t { return this.vtable.FileWriteAsync(this, pchFile, pvData, cubData); }

ISteamRemoteStorage_FileReadAsync :: inline (this: *ISteamRemoteStorage, pchFile: *u8, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t { return this.vtable.FileReadAsync(this, pchFile, nOffset, cubToRead); }
ISteamRemoteStorage_FileReadAsyncComplete :: inline (this: *ISteamRemoteStorage, hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32) -> bool { return this.vtable.FileReadAsyncComplete(this, hReadCall, pvBuffer, cubToRead); }

ISteamRemoteStorage_FileForget :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> bool { return this.vtable.FileForget(this, pchFile); }
ISteamRemoteStorage_FileDelete :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> bool { return this.vtable.FileDelete(this, pchFile); }

ISteamRemoteStorage_FileShare :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> SteamAPICall_t { return this.vtable.FileShare(this, pchFile); }
ISteamRemoteStorage_SetSyncPlatforms :: inline (this: *ISteamRemoteStorage, pchFile: *u8, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool { return this.vtable.SetSyncPlatforms(this, pchFile, eRemoteStoragePlatform); }

ISteamRemoteStorage_FileWriteStreamOpen :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> UGCFileWriteStreamHandle_t { return this.vtable.FileWriteStreamOpen(this, pchFile); }
ISteamRemoteStorage_FileWriteStreamWriteChunk :: inline (this: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32) -> bool { return this.vtable.FileWriteStreamWriteChunk(this, writeHandle, pvData, cubData); }
ISteamRemoteStorage_FileWriteStreamClose :: inline (this: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool { return this.vtable.FileWriteStreamClose(this, writeHandle); }
ISteamRemoteStorage_FileWriteStreamCancel :: inline (this: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool { return this.vtable.FileWriteStreamCancel(this, writeHandle); }

ISteamRemoteStorage_FileExists :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> bool { return this.vtable.FileExists(this, pchFile); }
ISteamRemoteStorage_FilePersisted :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> bool { return this.vtable.FilePersisted(this, pchFile); }
ISteamRemoteStorage_GetFileSize :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> int32 { return this.vtable.GetFileSize(this, pchFile); }
ISteamRemoteStorage_GetFileTimestamp :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> int64 { return this.vtable.GetFileTimestamp(this, pchFile); }
ISteamRemoteStorage_GetSyncPlatforms :: inline (this: *ISteamRemoteStorage, pchFile: *u8) -> ERemoteStoragePlatform { return this.vtable.GetSyncPlatforms(this, pchFile); }

ISteamRemoteStorage_GetFileCount :: inline (this: *ISteamRemoteStorage) -> int32 { return this.vtable.GetFileCount(this); }
ISteamRemoteStorage_GetFileNameAndSize :: inline (this: *ISteamRemoteStorage, iFile: s32, pnFileSizeInBytes: *int32) -> *u8 { return this.vtable.GetFileNameAndSize(this, iFile, pnFileSizeInBytes); }

ISteamRemoteStorage_GetQuota :: inline (this: *ISteamRemoteStorage, pnTotalBytes: *uint64, puAvailableBytes: *uint64) -> bool { return this.vtable.GetQuota(this, pnTotalBytes, puAvailableBytes); }
ISteamRemoteStorage_IsCloudEnabledForAccount :: inline (this: *ISteamRemoteStorage) -> bool { return this.vtable.IsCloudEnabledForAccount(this); }
ISteamRemoteStorage_IsCloudEnabledForApp :: inline (this: *ISteamRemoteStorage) -> bool { return this.vtable.IsCloudEnabledForApp(this); }
ISteamRemoteStorage_SetCloudEnabledForApp :: inline (this: *ISteamRemoteStorage, bEnabled: bool) { this.vtable.SetCloudEnabledForApp(this, bEnabled); }

ISteamRemoteStorage_UGCDownload :: inline (this: *ISteamRemoteStorage, hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t { return this.vtable.UGCDownload(this, hContent, unPriority); }

ISteamRemoteStorage_GetUGCDownloadProgress :: inline (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32) -> bool { return this.vtable.GetUGCDownloadProgress(this, hContent, pnBytesDownloaded, pnBytesExpected); }

ISteamRemoteStorage_GetUGCDetails :: inline (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **u8, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID) -> bool { return this.vtable.GetUGCDetails(this, hContent, pnAppID, ppchName, pnFileSizeInBytes, pSteamIDOwner); }

ISteamRemoteStorage_UGCRead :: inline (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 { return this.vtable.UGCRead(this, hContent, pvData, cubDataToRead, cOffset, eAction); }

ISteamRemoteStorage_GetCachedUGCCount :: inline (this: *ISteamRemoteStorage) -> int32 { return this.vtable.GetCachedUGCCount(this); }
ISteamRemoteStorage_GetCachedUGCHandle :: inline (this: *ISteamRemoteStorage, iCachedContent: int32) -> UGCHandle_t { return this.vtable.GetCachedUGCHandle(this, iCachedContent); }

ISteamRemoteStorage_PublishWorkshopFile :: inline (this: *ISteamRemoteStorage, pchFile: *u8, pchPreviewFile: *u8, nConsumerAppId: AppId_t, pchTitle: *u8, pchDescription: *u8, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t { return this.vtable.PublishWorkshopFile(this, pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType); }
ISteamRemoteStorage_CreatePublishedFileUpdateRequest :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t { return this.vtable.CreatePublishedFileUpdateRequest(this, unPublishedFileId); }
ISteamRemoteStorage_UpdatePublishedFileFile :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchFile: *u8) -> bool { return this.vtable.UpdatePublishedFileFile(this, updateHandle, pchFile); }
ISteamRemoteStorage_UpdatePublishedFilePreviewFile :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *u8) -> bool { return this.vtable.UpdatePublishedFilePreviewFile(this, updateHandle, pchPreviewFile); }
ISteamRemoteStorage_UpdatePublishedFileTitle :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchTitle: *u8) -> bool { return this.vtable.UpdatePublishedFileTitle(this, updateHandle, pchTitle); }
ISteamRemoteStorage_UpdatePublishedFileDescription :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchDescription: *u8) -> bool { return this.vtable.UpdatePublishedFileDescription(this, updateHandle, pchDescription); }
ISteamRemoteStorage_UpdatePublishedFileVisibility :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool { return this.vtable.UpdatePublishedFileVisibility(this, updateHandle, eVisibility); }
ISteamRemoteStorage_UpdatePublishedFileTags :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool { return this.vtable.UpdatePublishedFileTags(this, updateHandle, pTags); }

ISteamRemoteStorage_CommitPublishedFileUpdate :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t { return this.vtable.CommitPublishedFileUpdate(this, updateHandle); }

ISteamRemoteStorage_GetPublishedFileDetails :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t { return this.vtable.GetPublishedFileDetails(this, unPublishedFileId, unMaxSecondsOld); }

ISteamRemoteStorage_DeletePublishedFile :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.DeletePublishedFile(this, unPublishedFileId); }

ISteamRemoteStorage_EnumerateUserPublishedFiles :: inline (this: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t { return this.vtable.EnumerateUserPublishedFiles(this, unStartIndex); }

ISteamRemoteStorage_SubscribePublishedFile :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.SubscribePublishedFile(this, unPublishedFileId); }

ISteamRemoteStorage_EnumerateUserSubscribedFiles :: inline (this: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t { return this.vtable.EnumerateUserSubscribedFiles(this, unStartIndex); }

ISteamRemoteStorage_UnsubscribePublishedFile :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.UnsubscribePublishedFile(this, unPublishedFileId); }
ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription :: inline (this: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *u8) -> bool { return this.vtable.UpdatePublishedFileSetChangeDescription(this, updateHandle, pchChangeDescription); }

ISteamRemoteStorage_GetPublishedItemVoteDetails :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.GetPublishedItemVoteDetails(this, unPublishedFileId); }

ISteamRemoteStorage_UpdateUserPublishedItemVote :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t { return this.vtable.UpdateUserPublishedItemVote(this, unPublishedFileId, bVoteUp); }

ISteamRemoteStorage_GetUserPublishedItemVoteDetails :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.GetUserPublishedItemVoteDetails(this, unPublishedFileId); }

ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles :: inline (this: *ISteamRemoteStorage, steamId: CSteamID, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t { return this.vtable.EnumerateUserSharedWorkshopFiles(this, steamId, unStartIndex, pRequiredTags, pExcludedTags); }

ISteamRemoteStorage_PublishVideo :: inline (this: *ISteamRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *u8, pchVideoIdentifier: *u8, pchPreviewFile: *u8, nConsumerAppId: AppId_t, pchTitle: *u8, pchDescription: *u8, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t { return this.vtable.PublishVideo(this, eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags); }

ISteamRemoteStorage_SetUserPublishedFileAction :: inline (this: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t { return this.vtable.SetUserPublishedFileAction(this, unPublishedFileId, eAction); }

ISteamRemoteStorage_EnumeratePublishedFilesByUserAction :: inline (this: *ISteamRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t { return this.vtable.EnumeratePublishedFilesByUserAction(this, eAction, unStartIndex); }

ISteamRemoteStorage_EnumeratePublishedWorkshopFiles :: inline (this: *ISteamRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t { return this.vtable.EnumeratePublishedWorkshopFiles(this, eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags); }

ISteamRemoteStorage_UGCDownloadToLocation :: inline (this: *ISteamRemoteStorage, hContent: UGCHandle_t, pchLocation: *u8, unPriority: uint32) -> SteamAPICall_t { return this.vtable.UGCDownloadToLocation(this, hContent, pchLocation, unPriority); }

ISteamRemoteStorage_GetLocalFileChangeCount :: inline (this: *ISteamRemoteStorage) -> int32 { return this.vtable.GetLocalFileChangeCount(this); }
ISteamRemoteStorage_GetLocalFileChange :: inline (this: *ISteamRemoteStorage, iFile: s32, pEChangeType: *ERemoteStorageLocalFileChange, pEFilePathType: *ERemoteStorageFilePathType) -> *u8 { return this.vtable.GetLocalFileChange(this, iFile, pEChangeType, pEFilePathType); }

ISteamRemoteStorage_BeginFileWriteBatch :: inline (this: *ISteamRemoteStorage) -> bool { return this.vtable.BeginFileWriteBatch(this); }
ISteamRemoteStorage_EndFileWriteBatch :: inline (this: *ISteamRemoteStorage) -> bool { return this.vtable.EndFileWriteBatch(this); }

vtable :: (obj: *ISteamRemoteStorage) -> *ISteamRemoteStorage_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: The result of a call to FileShare()
//-----------------------------------------------------------------------------
RemoteStorageFileShareResult_t :: struct {
    anon_enum_113 :: enum s32 {
        k_iCallback :: 1307;
    }
    m_eResult:      EResult; // The result of the operation
    m_hFile:        UGCHandle_t; // The handle that can be shared with users and features
    m_rgchFilename: [260] u8; // The name of the file that was shared
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to PublishFile()
//-----------------------------------------------------------------------------
RemoteStoragePublishFileResult_t :: struct {
    anon_enum_114 :: enum s32 {
        k_iCallback :: 1309;
    }
    m_eResult:                                  EResult; // The result of the operation.
    m_nPublishedFileId:                         PublishedFileId_t;
    m_bUserNeedsToAcceptWorkshopLegalAgreement: bool;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to DeletePublishedFile()
//-----------------------------------------------------------------------------
RemoteStorageDeletePublishedFileResult_t :: struct {
    anon_enum_115 :: enum s32 {
        k_iCallback :: 1311;
    }
    m_eResult:          EResult; // The result of the operation.
    m_nPublishedFileId: PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to EnumerateUserPublishedFiles()
//-----------------------------------------------------------------------------
RemoteStorageEnumerateUserPublishedFilesResult_t :: struct {
    anon_enum_116 :: enum s32 {
        k_iCallback :: 1312;
    }
    m_eResult:           EResult; // The result of the operation.
    m_nResultsReturned:  int32;
    m_nTotalResultCount: int32;
    m_rgPublishedFileId: [50] PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to SubscribePublishedFile()
//-----------------------------------------------------------------------------
RemoteStorageSubscribePublishedFileResult_t :: struct {
    anon_enum_117 :: enum s32 {
        k_iCallback :: 1313;
    }
    m_eResult:          EResult; // The result of the operation.
    m_nPublishedFileId: PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to EnumerateSubscribePublishedFiles()
//-----------------------------------------------------------------------------
RemoteStorageEnumerateUserSubscribedFilesResult_t :: struct {
    anon_enum_118 :: enum s32 {
        k_iCallback :: 1314;
    }
    m_eResult:           EResult; // The result of the operation.
    m_nResultsReturned:  int32;
    m_nTotalResultCount: int32;
    m_rgPublishedFileId: [50] PublishedFileId_t;
    m_rgRTimeSubscribed: [50] uint32;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to UnsubscribePublishedFile()
//-----------------------------------------------------------------------------
RemoteStorageUnsubscribePublishedFileResult_t :: struct {
    anon_enum_119 :: enum s32 {
        k_iCallback :: 1315;
    }
    m_eResult:          EResult; // The result of the operation.
    m_nPublishedFileId: PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to CommitPublishedFileUpdate()
//-----------------------------------------------------------------------------
RemoteStorageUpdatePublishedFileResult_t :: struct {
    anon_enum_120 :: enum s32 {
        k_iCallback :: 1316;
    }
    m_eResult:                                  EResult; // The result of the operation.
    m_nPublishedFileId:                         PublishedFileId_t;
    m_bUserNeedsToAcceptWorkshopLegalAgreement: bool;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to UGCDownload()
//-----------------------------------------------------------------------------
RemoteStorageDownloadUGCResult_t :: struct {
    anon_enum_121 :: enum s32 {
        k_iCallback :: 1317;
    }
    m_eResult:        EResult; // The result of the operation.
    m_hFile:          UGCHandle_t; // The handle to the file that was attempted to be downloaded.
    m_nAppID:         AppId_t; // ID of the app that created this file.
    m_nSizeInBytes:   int32; // The size of the file that was downloaded, in bytes.
    m_pchFileName:    [260] u8; // The name of the file that was downloaded. 
    m_ulSteamIDOwner: uint64; // Steam ID of the user who created this content.
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to GetPublishedFileDetails()
//-----------------------------------------------------------------------------
RemoteStorageGetPublishedFileDetailsResult_t :: struct {
    anon_enum_122 :: enum s32 {
        k_iCallback :: 1318;
    }
    m_eResult:          EResult; // The result of the operation.
    m_nPublishedFileId: PublishedFileId_t;
    m_nCreatorAppID:    AppId_t; // ID of the app that created this file.
    m_nConsumerAppID:   AppId_t; // ID of the app that will consume this file.
    m_rgchTitle:        [129] u8; // title of document
    m_rgchDescription:  [8000] u8; // description of document
    m_hFile:            UGCHandle_t; // The handle of the primary file
    m_hPreviewFile:     UGCHandle_t; // The handle of the preview file
    m_ulSteamIDOwner:   uint64; // Steam ID of the user who created this content.
    m_rtimeCreated:     uint32; // time when the published file was created
    m_rtimeUpdated:     uint32; // time when the published file was last updated
    m_eVisibility:      ERemoteStoragePublishedFileVisibility;
    m_bBanned:          bool;
    m_rgchTags:         [1025] u8; // comma separated list of all tags associated with this file
    m_bTagsTruncated:   bool; // whether the list of tags was too long to be returned in the provided buffer
    m_pchFileName:      [260] u8; // The name of the primary file
    m_nFileSize:        int32; // Size of the primary file
    m_nPreviewFileSize: int32; // Size of the preview file
    m_rgchURL:          [256] u8; // URL (for a video or a website)
    m_eFileType:        EWorkshopFileType; // Type of the file
    m_bAcceptedForUse:  bool; // developer has specifically flagged this item as accepted in the Workshop
}

RemoteStorageEnumerateWorkshopFilesResult_t :: struct {
    anon_enum_123 :: enum s32 {
        k_iCallback :: 1319;
    }
    m_eResult:           EResult;
    m_nResultsReturned:  int32;
    m_nTotalResultCount: int32;
    m_rgPublishedFileId: [50] PublishedFileId_t;
    m_rgScore:           [50] float;
    m_nAppId:            AppId_t;
    m_unStartIndex:      uint32;
}

//-----------------------------------------------------------------------------
// Purpose: The result of GetPublishedItemVoteDetails
//-----------------------------------------------------------------------------
RemoteStorageGetPublishedItemVoteDetailsResult_t :: struct {
    anon_enum_124 :: enum s32 {
        k_iCallback :: 1320;
    }
    m_eResult:           EResult;
    m_unPublishedFileId: PublishedFileId_t;
    m_nVotesFor:         int32;
    m_nVotesAgainst:     int32;
    m_nReports:          int32;
    m_fScore:            float;
}

//-----------------------------------------------------------------------------
// Purpose: User subscribed to a file for the app (from within the app or on the web)
//-----------------------------------------------------------------------------
RemoteStoragePublishedFileSubscribed_t :: struct {
    anon_enum_125 :: enum s32 {
        k_iCallback :: 1321;
    }
    m_nPublishedFileId: PublishedFileId_t; // The published file id
    m_nAppID:           AppId_t; // ID of the app that will consume this file.
}

//-----------------------------------------------------------------------------
// Purpose: User unsubscribed from a file for the app (from within the app or on the web)
//-----------------------------------------------------------------------------
RemoteStoragePublishedFileUnsubscribed_t :: struct {
    anon_enum_126 :: enum s32 {
        k_iCallback :: 1322;
    }
    m_nPublishedFileId: PublishedFileId_t; // The published file id
    m_nAppID:           AppId_t; // ID of the app that will consume this file.
}

//-----------------------------------------------------------------------------
// Purpose: Published file that a user owns was deleted (from within the app or the web)
//-----------------------------------------------------------------------------
RemoteStoragePublishedFileDeleted_t :: struct {
    anon_enum_127 :: enum s32 {
        k_iCallback :: 1323;
    }
    m_nPublishedFileId: PublishedFileId_t; // The published file id
    m_nAppID:           AppId_t; // ID of the app that will consume this file.
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to UpdateUserPublishedItemVote()
//-----------------------------------------------------------------------------
RemoteStorageUpdateUserPublishedItemVoteResult_t :: struct {
    anon_enum_128 :: enum s32 {
        k_iCallback :: 1324;
    }
    m_eResult:          EResult; // The result of the operation.
    m_nPublishedFileId: PublishedFileId_t; // The published file id
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to GetUserPublishedItemVoteDetails()
//-----------------------------------------------------------------------------
RemoteStorageUserVoteDetails_t :: struct {
    anon_enum_129 :: enum s32 {
        k_iCallback :: 1325;
    }
    m_eResult:          EResult; // The result of the operation.
    m_nPublishedFileId: PublishedFileId_t; // The published file id
    m_eVote:            EWorkshopVote; // what the user voted
}

RemoteStorageEnumerateUserSharedWorkshopFilesResult_t :: struct {
    anon_enum_130 :: enum s32 {
        k_iCallback :: 1326;
    }
    m_eResult:           EResult; // The result of the operation.
    m_nResultsReturned:  int32;
    m_nTotalResultCount: int32;
    m_rgPublishedFileId: [50] PublishedFileId_t;
}

RemoteStorageSetUserPublishedFileActionResult_t :: struct {
    anon_enum_131 :: enum s32 {
        k_iCallback :: 1327;
    }
    m_eResult:          EResult; // The result of the operation.
    m_nPublishedFileId: PublishedFileId_t; // The published file id
    m_eAction:          EWorkshopFileAction; // the action that was attempted
}

RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: struct {
    anon_enum_132 :: enum s32 {
        k_iCallback :: 1328;
    }
    m_eResult:           EResult; // The result of the operation.
    m_eAction:           EWorkshopFileAction; // the action that was filtered on
    m_nResultsReturned:  int32;
    m_nTotalResultCount: int32;
    m_rgPublishedFileId: [50] PublishedFileId_t;
    m_rgRTimeUpdated:    [50] uint32;
}

//-----------------------------------------------------------------------------
// Purpose: Called periodically while a PublishWorkshopFile is in progress
//-----------------------------------------------------------------------------
RemoteStoragePublishFileProgress_t :: struct {
    anon_enum_133 :: enum s32 {
        k_iCallback :: 1329;
    }
    m_dPercentFile: float64;
    m_bPreview:     bool;
}

//-----------------------------------------------------------------------------
// Purpose: Called when the content for a published file is updated
//-----------------------------------------------------------------------------
RemoteStoragePublishedFileUpdated_t :: struct {
    anon_enum_134 :: enum s32 {
        k_iCallback :: 1330;
    }
    m_nPublishedFileId: PublishedFileId_t; // The published file id
    m_nAppID:           AppId_t; // ID of the app that will consume this file.
    m_ulUnused:         uint64; // not used anymore
}

//-----------------------------------------------------------------------------
// Purpose: Called when a FileWriteAsync completes
//-----------------------------------------------------------------------------
RemoteStorageFileWriteAsyncComplete_t :: struct {
    anon_enum_135 :: enum s32 {
        k_iCallback :: 1331;
    }
    m_eResult: EResult; // result
}

//-----------------------------------------------------------------------------
// Purpose: Called when a FileReadAsync completes
//-----------------------------------------------------------------------------
RemoteStorageFileReadAsyncComplete_t :: struct {
    anon_enum_136 :: enum s32 {
        k_iCallback :: 1332;
    }
    m_hFileReadAsync: SteamAPICall_t; // call handle of the async read which was made
    m_eResult:        EResult; // result
    m_nOffset:        uint32; // offset in the file this read was at
    m_cubRead:        uint32; // amount read - will the <= the amount requested
}

//-----------------------------------------------------------------------------
// Purpose: one or more files for this app have changed locally after syncing
//			to remote session changes
//			Note: only posted if this happens DURING the local app session
//-----------------------------------------------------------------------------
RemoteStorageLocalFileChange_t :: struct {
    anon_enum_137 :: enum s32 {
        k_iCallback :: 1333;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

// size limit on stat or achievement name (UTF-8 encoded)
anon_enum_138 :: enum s32 {
    k_cchStatNameMax :: 128;
}

// maximum number of bytes for a leaderboard name (UTF-8 encoded)
anon_enum_139 :: enum s32 {
    k_cchLeaderboardNameMax :: 128;
}

// maximum number of details int32's storable for a single leaderboard entry
anon_enum_140 :: enum s32 {
    k_cLeaderboardDetailsMax :: 64;
}

// handle to a single leaderboard
SteamLeaderboard_t :: uint64;

// handle to a set of downloaded entries in a leaderboard
SteamLeaderboardEntries_t :: uint64;

// type of data request, when downloading leaderboard entries
ELeaderboardDataRequest :: enum s32 {
    ELeaderboardDataRequestGlobal           :: 0;
    ELeaderboardDataRequestGlobalAroundUser :: 1;
    ELeaderboardDataRequestFriends          :: 2;
    ELeaderboardDataRequestUsers            :: 3;

    k_ELeaderboardDataRequestGlobal           :: ELeaderboardDataRequestGlobal;
    k_ELeaderboardDataRequestGlobalAroundUser :: ELeaderboardDataRequestGlobalAroundUser;
    k_ELeaderboardDataRequestFriends          :: ELeaderboardDataRequestFriends;
    k_ELeaderboardDataRequestUsers            :: ELeaderboardDataRequestUsers;
}

// the sort order of a leaderboard
ELeaderboardSortMethod :: enum s32 {
    ELeaderboardSortMethodNone       :: 0;
    ELeaderboardSortMethodAscending  :: 1;
    ELeaderboardSortMethodDescending :: 2;

    k_ELeaderboardSortMethodNone       :: ELeaderboardSortMethodNone;
    k_ELeaderboardSortMethodAscending  :: ELeaderboardSortMethodAscending;
    k_ELeaderboardSortMethodDescending :: ELeaderboardSortMethodDescending;
}

// the display type (used by the Steam Community web site) for a leaderboard
ELeaderboardDisplayType :: enum s32 {
    ELeaderboardDisplayTypeNone             :: 0;
    ELeaderboardDisplayTypeNumeric          :: 1;
    ELeaderboardDisplayTypeTimeSeconds      :: 2;
    ELeaderboardDisplayTypeTimeMilliSeconds :: 3;

    k_ELeaderboardDisplayTypeNone             :: ELeaderboardDisplayTypeNone;
    k_ELeaderboardDisplayTypeNumeric          :: ELeaderboardDisplayTypeNumeric;
    k_ELeaderboardDisplayTypeTimeSeconds      :: ELeaderboardDisplayTypeTimeSeconds;
    k_ELeaderboardDisplayTypeTimeMilliSeconds :: ELeaderboardDisplayTypeTimeMilliSeconds;
}

ELeaderboardUploadScoreMethod :: enum s32 {
    ELeaderboardUploadScoreMethodNone        :: 0;
    ELeaderboardUploadScoreMethodKeepBest    :: 1;
    ELeaderboardUploadScoreMethodForceUpdate :: 2;

    k_ELeaderboardUploadScoreMethodNone        :: ELeaderboardUploadScoreMethodNone;
    k_ELeaderboardUploadScoreMethodKeepBest    :: ELeaderboardUploadScoreMethodKeepBest;
    k_ELeaderboardUploadScoreMethodForceUpdate :: ELeaderboardUploadScoreMethodForceUpdate;
}

LeaderboardEntry_t :: struct {
    m_steamIDUser: CSteamID; // user with the entry - use SteamFriends()->GetFriendPersonaName() & SteamFriends()->GetFriendAvatar() to get more info
    m_nGlobalRank: int32; // [1..N], where N is the number of users with an entry in the leaderboard
    m_nScore:      int32; // score as set in the leaderboard
    m_cDetails:    int32; // number of int32 details available for this entry
    m_hUGC:        UGCHandle_t; // handle for UGC attached to the entry
}

//-----------------------------------------------------------------------------
// Purpose: Functions for accessing stats, achievements, and leaderboard information
//-----------------------------------------------------------------------------
ISteamUserStats :: struct {
    vtable: *ISteamUserStats_VTable;
}
ISteamUserStats_VTable :: struct #type_info_none {
    RequestCurrentStats: (this: *ISteamUserStats) -> bool #cpp_method;

    GetStat: (this: *ISteamUserStats, pchName: *u8, pData: *float) -> bool #cpp_method;

    GetStat_1: (this: *ISteamUserStats, pchName: /*const*/ *u8, pData: *int32) -> bool #cpp_method;

    SetStat: (this: *ISteamUserStats, pchName: *u8, fData: float) -> bool #cpp_method;

    SetStat_1: (this: *ISteamUserStats, pchName: /*const*/ *u8, nData: int32) -> bool #cpp_method;

    UpdateAvgRateStat: (this: *ISteamUserStats, pchName: *u8, flCountThisSession: float, dSessionLength: float64) -> bool #cpp_method;

    GetAchievement: (this: *ISteamUserStats, pchName: *u8, pbAchieved: *bool) -> bool #cpp_method;
    SetAchievement: (this: *ISteamUserStats, pchName: *u8) -> bool #cpp_method;
    ClearAchievement: (this: *ISteamUserStats, pchName: *u8) -> bool #cpp_method;

    GetAchievementAndUnlockTime: (this: *ISteamUserStats, pchName: *u8, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #cpp_method;

    StoreStats: (this: *ISteamUserStats) -> bool #cpp_method;

    GetAchievementIcon: (this: *ISteamUserStats, pchName: *u8) -> s32 #cpp_method;

    GetAchievementDisplayAttribute: (this: *ISteamUserStats, pchName: *u8, pchKey: *u8) -> *u8 #cpp_method;

    IndicateAchievementProgress: (this: *ISteamUserStats, pchName: *u8, nCurProgress: uint32, nMaxProgress: uint32) -> bool #cpp_method;

    GetNumAchievements: (this: *ISteamUserStats) -> uint32 #cpp_method;

    GetAchievementName: (this: *ISteamUserStats, iAchievement: uint32) -> *u8 #cpp_method;

    RequestUserStats: (this: *ISteamUserStats, steamIDUser: CSteamID) -> SteamAPICall_t #cpp_method;

    GetUserStat: (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: *u8, pData: *float) -> bool #cpp_method;

    GetUserStat_1: (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, pData: *int32) -> bool #cpp_method;

    GetUserAchievement: (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: *u8, pbAchieved: *bool) -> bool #cpp_method;

    GetUserAchievementAndUnlockTime: (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: *u8, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #cpp_method;

    ResetAllStats: (this: *ISteamUserStats, bAchievementsToo: bool) -> bool #cpp_method;

    FindOrCreateLeaderboard: (this: *ISteamUserStats, pchLeaderboardName: *u8, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t #cpp_method;

    FindLeaderboard: (this: *ISteamUserStats, pchLeaderboardName: *u8) -> SteamAPICall_t #cpp_method;

    GetLeaderboardName: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> *u8 #cpp_method;

    GetLeaderboardEntryCount: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> s32 #cpp_method;

    GetLeaderboardSortMethod: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod #cpp_method;

    GetLeaderboardDisplayType: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType #cpp_method;

    DownloadLeaderboardEntries: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t #cpp_method;

    DownloadLeaderboardEntriesForUsers: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t #cpp_method;

    GetDownloadedLeaderboardEntry: (this: *ISteamUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool #cpp_method;

    UploadLeaderboardScore: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t #cpp_method;

    AttachLeaderboardUGC: (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t #cpp_method;

    GetNumberOfCurrentPlayers: (this: *ISteamUserStats) -> SteamAPICall_t #cpp_method;

    RequestGlobalAchievementPercentages: (this: *ISteamUserStats) -> SteamAPICall_t #cpp_method;

    GetMostAchievedAchievementInfo: (this: *ISteamUserStats, pchName: *u8, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #cpp_method;

    GetNextMostAchievedAchievementInfo: (this: *ISteamUserStats, iIteratorPrevious: s32, pchName: *u8, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #cpp_method;

    GetAchievementAchievedPercent: (this: *ISteamUserStats, pchName: *u8, pflPercent: *float) -> bool #cpp_method;

    RequestGlobalStats: (this: *ISteamUserStats, nHistoryDays: s32) -> SteamAPICall_t #cpp_method;

    GetGlobalStat: (this: *ISteamUserStats, pchStatName: *u8, pData: *float64) -> bool #cpp_method;

    GetGlobalStat_1: (this: *ISteamUserStats, pchStatName: /*const*/ *u8, pData: *int64) -> bool #cpp_method;

    GetGlobalStatHistory: (this: *ISteamUserStats, pchStatName: *u8, pData: *float64, cubData: uint32) -> int32 #cpp_method;

    GetGlobalStatHistory_1: (this: *ISteamUserStats, pchStatName: /*const*/ *u8, pData: *int64, cubData: uint32) -> int32 #cpp_method;

    GetAchievementProgressLimits: (this: *ISteamUserStats, pchName: *u8, pfMinProgress: *float, pfMaxProgress: *float) -> bool #cpp_method;

    GetAchievementProgressLimits_1: (this: *ISteamUserStats, pchName: /*const*/ *u8, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool #cpp_method;
}

ISteamUserStats_RequestCurrentStats :: inline (this: *ISteamUserStats) -> bool { return this.vtable.RequestCurrentStats(this); }

ISteamUserStats_GetStat :: inline (this: *ISteamUserStats, pchName: /*const*/ *u8, pData: *float) -> bool { return this.vtable.GetStat(this, pchName, pData); }

ISteamUserStats_GetStat_1 :: inline (this: *ISteamUserStats, pchName: /*const*/ *u8, pData: *int32) -> bool { return this.vtable.GetStat_1(this, pchName, pData); }

ISteamUserStats_SetStat :: inline (this: *ISteamUserStats, pchName: /*const*/ *u8, fData: float) -> bool { return this.vtable.SetStat(this, pchName, fData); }

ISteamUserStats_SetStat_1 :: inline (this: *ISteamUserStats, pchName: /*const*/ *u8, nData: int32) -> bool { return this.vtable.SetStat_1(this, pchName, nData); }

ISteamUserStats_UpdateAvgRateStat :: inline (this: *ISteamUserStats, pchName: *u8, flCountThisSession: float, dSessionLength: float64) -> bool { return this.vtable.UpdateAvgRateStat(this, pchName, flCountThisSession, dSessionLength); }

ISteamUserStats_GetAchievement :: inline (this: *ISteamUserStats, pchName: *u8, pbAchieved: *bool) -> bool { return this.vtable.GetAchievement(this, pchName, pbAchieved); }
ISteamUserStats_SetAchievement :: inline (this: *ISteamUserStats, pchName: *u8) -> bool { return this.vtable.SetAchievement(this, pchName); }
ISteamUserStats_ClearAchievement :: inline (this: *ISteamUserStats, pchName: *u8) -> bool { return this.vtable.ClearAchievement(this, pchName); }

ISteamUserStats_GetAchievementAndUnlockTime :: inline (this: *ISteamUserStats, pchName: *u8, pbAchieved: *bool, punUnlockTime: *uint32) -> bool { return this.vtable.GetAchievementAndUnlockTime(this, pchName, pbAchieved, punUnlockTime); }

ISteamUserStats_StoreStats :: inline (this: *ISteamUserStats) -> bool { return this.vtable.StoreStats(this); }

ISteamUserStats_GetAchievementIcon :: inline (this: *ISteamUserStats, pchName: *u8) -> s32 { return this.vtable.GetAchievementIcon(this, pchName); }

ISteamUserStats_GetAchievementDisplayAttribute :: inline (this: *ISteamUserStats, pchName: *u8, pchKey: *u8) -> *u8 { return this.vtable.GetAchievementDisplayAttribute(this, pchName, pchKey); }

ISteamUserStats_IndicateAchievementProgress :: inline (this: *ISteamUserStats, pchName: *u8, nCurProgress: uint32, nMaxProgress: uint32) -> bool { return this.vtable.IndicateAchievementProgress(this, pchName, nCurProgress, nMaxProgress); }

ISteamUserStats_GetNumAchievements :: inline (this: *ISteamUserStats) -> uint32 { return this.vtable.GetNumAchievements(this); }

ISteamUserStats_GetAchievementName :: inline (this: *ISteamUserStats, iAchievement: uint32) -> *u8 { return this.vtable.GetAchievementName(this, iAchievement); }

ISteamUserStats_RequestUserStats :: inline (this: *ISteamUserStats, steamIDUser: CSteamID) -> SteamAPICall_t { return this.vtable.RequestUserStats(this, steamIDUser); }

ISteamUserStats_GetUserStat :: inline (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, pData: *float) -> bool { return this.vtable.GetUserStat(this, steamIDUser, pchName, pData); }

ISteamUserStats_GetUserStat_1 :: inline (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, pData: *int32) -> bool { return this.vtable.GetUserStat_1(this, steamIDUser, pchName, pData); }

ISteamUserStats_GetUserAchievement :: inline (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: *u8, pbAchieved: *bool) -> bool { return this.vtable.GetUserAchievement(this, steamIDUser, pchName, pbAchieved); }

ISteamUserStats_GetUserAchievementAndUnlockTime :: inline (this: *ISteamUserStats, steamIDUser: CSteamID, pchName: *u8, pbAchieved: *bool, punUnlockTime: *uint32) -> bool { return this.vtable.GetUserAchievementAndUnlockTime(this, steamIDUser, pchName, pbAchieved, punUnlockTime); }

ISteamUserStats_ResetAllStats :: inline (this: *ISteamUserStats, bAchievementsToo: bool) -> bool { return this.vtable.ResetAllStats(this, bAchievementsToo); }

ISteamUserStats_FindOrCreateLeaderboard :: inline (this: *ISteamUserStats, pchLeaderboardName: *u8, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t { return this.vtable.FindOrCreateLeaderboard(this, pchLeaderboardName, eLeaderboardSortMethod, eLeaderboardDisplayType); }

ISteamUserStats_FindLeaderboard :: inline (this: *ISteamUserStats, pchLeaderboardName: *u8) -> SteamAPICall_t { return this.vtable.FindLeaderboard(this, pchLeaderboardName); }

ISteamUserStats_GetLeaderboardName :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> *u8 { return this.vtable.GetLeaderboardName(this, hSteamLeaderboard); }

ISteamUserStats_GetLeaderboardEntryCount :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> s32 { return this.vtable.GetLeaderboardEntryCount(this, hSteamLeaderboard); }

ISteamUserStats_GetLeaderboardSortMethod :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod { return this.vtable.GetLeaderboardSortMethod(this, hSteamLeaderboard); }

ISteamUserStats_GetLeaderboardDisplayType :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType { return this.vtable.GetLeaderboardDisplayType(this, hSteamLeaderboard); }

ISteamUserStats_DownloadLeaderboardEntries :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t { return this.vtable.DownloadLeaderboardEntries(this, hSteamLeaderboard, eLeaderboardDataRequest, nRangeStart, nRangeEnd); }

ISteamUserStats_DownloadLeaderboardEntriesForUsers :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t { return this.vtable.DownloadLeaderboardEntriesForUsers(this, hSteamLeaderboard, prgUsers, cUsers); }

ISteamUserStats_GetDownloadedLeaderboardEntry :: inline (this: *ISteamUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool { return this.vtable.GetDownloadedLeaderboardEntry(this, hSteamLeaderboardEntries, index, pLeaderboardEntry, pDetails, cDetailsMax); }

ISteamUserStats_UploadLeaderboardScore :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t { return this.vtable.UploadLeaderboardScore(this, hSteamLeaderboard, eLeaderboardUploadScoreMethod, nScore, pScoreDetails, cScoreDetailsCount); }

ISteamUserStats_AttachLeaderboardUGC :: inline (this: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t { return this.vtable.AttachLeaderboardUGC(this, hSteamLeaderboard, hUGC); }

ISteamUserStats_GetNumberOfCurrentPlayers :: inline (this: *ISteamUserStats) -> SteamAPICall_t { return this.vtable.GetNumberOfCurrentPlayers(this); }

ISteamUserStats_RequestGlobalAchievementPercentages :: inline (this: *ISteamUserStats) -> SteamAPICall_t { return this.vtable.RequestGlobalAchievementPercentages(this); }

ISteamUserStats_GetMostAchievedAchievementInfo :: inline (this: *ISteamUserStats, pchName: *u8, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 { return this.vtable.GetMostAchievedAchievementInfo(this, pchName, unNameBufLen, pflPercent, pbAchieved); }

ISteamUserStats_GetNextMostAchievedAchievementInfo :: inline (this: *ISteamUserStats, iIteratorPrevious: s32, pchName: *u8, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 { return this.vtable.GetNextMostAchievedAchievementInfo(this, iIteratorPrevious, pchName, unNameBufLen, pflPercent, pbAchieved); }

ISteamUserStats_GetAchievementAchievedPercent :: inline (this: *ISteamUserStats, pchName: *u8, pflPercent: *float) -> bool { return this.vtable.GetAchievementAchievedPercent(this, pchName, pflPercent); }

ISteamUserStats_RequestGlobalStats :: inline (this: *ISteamUserStats, nHistoryDays: s32) -> SteamAPICall_t { return this.vtable.RequestGlobalStats(this, nHistoryDays); }

ISteamUserStats_GetGlobalStat :: inline (this: *ISteamUserStats, pchStatName: /*const*/ *u8, pData: *float64) -> bool { return this.vtable.GetGlobalStat(this, pchStatName, pData); }

ISteamUserStats_GetGlobalStat_1 :: inline (this: *ISteamUserStats, pchStatName: /*const*/ *u8, pData: *int64) -> bool { return this.vtable.GetGlobalStat_1(this, pchStatName, pData); }

ISteamUserStats_GetGlobalStatHistory :: inline (this: *ISteamUserStats, pchStatName: /*const*/ *u8, pData: *float64, cubData: uint32) -> int32 { return this.vtable.GetGlobalStatHistory(this, pchStatName, pData, cubData); }

ISteamUserStats_GetGlobalStatHistory_1 :: inline (this: *ISteamUserStats, pchStatName: /*const*/ *u8, pData: *int64, cubData: uint32) -> int32 { return this.vtable.GetGlobalStatHistory_1(this, pchStatName, pData, cubData); }

ISteamUserStats_GetAchievementProgressLimits :: inline (this: *ISteamUserStats, pchName: /*const*/ *u8, pfMinProgress: *float, pfMaxProgress: *float) -> bool { return this.vtable.GetAchievementProgressLimits(this, pchName, pfMinProgress, pfMaxProgress); }

ISteamUserStats_GetAchievementProgressLimits_1 :: inline (this: *ISteamUserStats, pchName: /*const*/ *u8, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool { return this.vtable.GetAchievementProgressLimits_1(this, pchName, pnMinProgress, pnMaxProgress); }

vtable :: (obj: *ISteamUserStats) -> *ISteamUserStats_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: called when the latests stats and achievements have been received
//			from the server
//-----------------------------------------------------------------------------
UserStatsReceived_t :: struct {
    anon_enum_141 :: enum s32 {
        k_iCallback :: 1101;
    }
    m_nGameID:     uint64; // Game these stats are for
    m_eResult:     EResult; // Success / error fetching the stats
    m_steamIDUser: CSteamID #align 4; // The user for whom the stats are retrieved for
}

//-----------------------------------------------------------------------------
// Purpose: result of a request to store the user stats for a game
//-----------------------------------------------------------------------------
UserStatsStored_t :: struct {
    anon_enum_142 :: enum s32 {
        k_iCallback :: 1102;
    }
    m_nGameID: uint64; // Game these stats are for
    m_eResult: EResult; // success / error
}

//-----------------------------------------------------------------------------
// Purpose: result of a request to store the achievements for a game, or an
//			"indicate progress" call. If both m_nCurProgress and m_nMaxProgress
//			are zero, that means the achievement has been fully unlocked.
//-----------------------------------------------------------------------------
UserAchievementStored_t :: struct {
    anon_enum_143 :: enum s32 {
        k_iCallback :: 1103;
    }

    m_nGameID:             uint64; // Game this is for
    m_bGroupAchievement:   bool; // if this is a "group" achievement
    m_rgchAchievementName: [128] u8; // name of the achievement
    m_nCurProgress:        uint32; // current progress towards the achievement
    m_nMaxProgress:        uint32; // "out of" this many
}

//-----------------------------------------------------------------------------
// Purpose: call result for finding a leaderboard, returned as a result of FindOrCreateLeaderboard() or FindLeaderboard()
//			use CCallResult<> to map this async result to a member function
//-----------------------------------------------------------------------------
LeaderboardFindResult_t :: struct {
    anon_enum_144 :: enum s32 {
        k_iCallback :: 1104;
    }
    m_hSteamLeaderboard: SteamLeaderboard_t; // handle to the leaderboard serarched for, 0 if no leaderboard found
    m_bLeaderboardFound: uint8; // 0 if no leaderboard found
}

//-----------------------------------------------------------------------------
// Purpose: call result indicating scores for a leaderboard have been downloaded and are ready to be retrieved, returned as a result of DownloadLeaderboardEntries()
//			use CCallResult<> to map this async result to a member function
//-----------------------------------------------------------------------------
LeaderboardScoresDownloaded_t :: struct {
    anon_enum_145 :: enum s32 {
        k_iCallback :: 1105;
    }
    m_hSteamLeaderboard:        SteamLeaderboard_t;
    m_hSteamLeaderboardEntries: SteamLeaderboardEntries_t; // the handle to pass into GetDownloadedLeaderboardEntries()
    m_cEntryCount:              s32; // the number of entries downloaded
}

//-----------------------------------------------------------------------------
// Purpose: call result indicating scores has been uploaded, returned as a result of UploadLeaderboardScore()
//			use CCallResult<> to map this async result to a member function
//-----------------------------------------------------------------------------
LeaderboardScoreUploaded_t :: struct {
    anon_enum_146 :: enum s32 {
        k_iCallback :: 1106;
    }
    m_bSuccess:            uint8; // 1 if the call was successful
    m_hSteamLeaderboard:   SteamLeaderboard_t; // the leaderboard handle that was
    m_nScore:              int32; // the score that was attempted to set
    m_bScoreChanged:       uint8; // true if the score in the leaderboard change, false if the existing score was better
    m_nGlobalRankNew:      s32; // the new global rank of the user in this leaderboard
    m_nGlobalRankPrevious: s32; // the previous global rank of the user in this leaderboard; 0 if the user had no existing entry in the leaderboard
}

NumberOfCurrentPlayers_t :: struct {
    anon_enum_147 :: enum s32 {
        k_iCallback :: 1107;
    }
    m_bSuccess: uint8; // 1 if the call was successful
    m_cPlayers: int32; // Number of players currently playing
}

//-----------------------------------------------------------------------------
// Purpose: Callback indicating that a user's stats have been unloaded.
//  Call RequestUserStats again to access stats for this user
//-----------------------------------------------------------------------------
UserStatsUnloaded_t :: struct {
    anon_enum_148 :: enum s32 {
        k_iCallback :: 1108;
    }
    m_steamIDUser: CSteamID; // User whose stats have been unloaded
}

//-----------------------------------------------------------------------------
// Purpose: Callback indicating that an achievement icon has been fetched
//-----------------------------------------------------------------------------
UserAchievementIconFetched_t :: struct {
    anon_enum_149 :: enum s32 {
        k_iCallback :: 1109;
    }

    m_nGameID:             CGameID; // Game this is for
    m_rgchAchievementName: [128] u8; // name of the achievement
    m_bAchieved:           bool; // Is the icon for the achieved or not achieved version?
    m_nIconHandle:         s32; // Handle to the image, which can be used in SteamUtils()->GetImageRGBA(), 0 means no image is set for the achievement
}

//-----------------------------------------------------------------------------
// Purpose: Callback indicating that global achievement percentages are fetched
//-----------------------------------------------------------------------------
GlobalAchievementPercentagesReady_t :: struct {
    anon_enum_150 :: enum s32 {
        k_iCallback :: 1110;
    }

    m_nGameID: uint64; // Game this is for
    m_eResult: EResult; // Result of the operation
}

//-----------------------------------------------------------------------------
// Purpose: call result indicating UGC has been uploaded, returned as a result of SetLeaderboardUGC()
//-----------------------------------------------------------------------------
LeaderboardUGCSet_t :: struct {
    anon_enum_151 :: enum s32 {
        k_iCallback :: 1111;
    }
    m_eResult:           EResult; // The result of the operation
    m_hSteamLeaderboard: SteamLeaderboard_t; // the leaderboard handle that was
}

//-----------------------------------------------------------------------------
// Purpose: callback indicating that PS3 trophies have been installed
//-----------------------------------------------------------------------------
PS3TrophiesInstalled_t :: struct {
    anon_enum_152 :: enum s32 {
        k_iCallback :: 1112;
    }
    m_nGameID:             uint64; // Game these stats are for
    m_eResult:             EResult; // The result of the operation
    m_ulRequiredDiskSpace: uint64; // If m_eResult is k_EResultDiskFull, will contain the amount of space needed to install trophies
}

//-----------------------------------------------------------------------------
// Purpose: callback indicating global stats have been received.
//	Returned as a result of RequestGlobalStats()
//-----------------------------------------------------------------------------
GlobalStatsReceived_t :: struct {
    anon_enum_153 :: enum s32 {
        k_iCallback :: 1112;
    }
    m_nGameID: uint64; // Game global stats were requested for
    m_eResult: EResult; // The result of the request
}

k_cubAppProofOfPurchaseKeyMax: s32 : 240; // max supported length of a legacy cd key 

//-----------------------------------------------------------------------------
// Purpose: interface to app data
//-----------------------------------------------------------------------------
ISteamApps :: struct {
    vtable: *ISteamApps_VTable;
}
ISteamApps_VTable :: struct #type_info_none {
    BIsSubscribed: (this: *ISteamApps) -> bool #cpp_method;
    BIsLowViolence: (this: *ISteamApps) -> bool #cpp_method;
    BIsCybercafe: (this: *ISteamApps) -> bool #cpp_method;
    BIsVACBanned: (this: *ISteamApps) -> bool #cpp_method;
    GetCurrentGameLanguage: (this: *ISteamApps) -> *u8 #cpp_method;
    GetAvailableGameLanguages: (this: *ISteamApps) -> *u8 #cpp_method;

    BIsSubscribedApp: (this: *ISteamApps, appID: AppId_t) -> bool #cpp_method;

    BIsDlcInstalled: (this: *ISteamApps, appID: AppId_t) -> bool #cpp_method;

    GetEarliestPurchaseUnixTime: (this: *ISteamApps, nAppID: AppId_t) -> uint32 #cpp_method;

    BIsSubscribedFromFreeWeekend: (this: *ISteamApps) -> bool #cpp_method;

    GetDLCCount: (this: *ISteamApps) -> s32 #cpp_method;

    BGetDLCDataByIndex: (this: *ISteamApps, iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *u8, cchNameBufferSize: s32) -> bool #cpp_method;

    InstallDLC: (this: *ISteamApps, nAppID: AppId_t) -> void #cpp_method;
    UninstallDLC: (this: *ISteamApps, nAppID: AppId_t) -> void #cpp_method;

    RequestAppProofOfPurchaseKey: (this: *ISteamApps, nAppID: AppId_t) -> void #cpp_method;

    GetCurrentBetaName: (this: *ISteamApps, pchName: *u8, cchNameBufferSize: s32) -> bool #cpp_method;
    MarkContentCorrupt: (this: *ISteamApps, bMissingFilesOnly: bool) -> bool #cpp_method;
    GetInstalledDepots: (this: *ISteamApps, appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 #cpp_method;

    GetAppInstallDir: (this: *ISteamApps, appID: AppId_t, pchFolder: *u8, cchFolderBufferSize: uint32) -> uint32 #cpp_method;
    BIsAppInstalled: (this: *ISteamApps, appID: AppId_t) -> bool #cpp_method;

    GetAppOwner: (this: *ISteamApps) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    GetLaunchQueryParam: (this: *ISteamApps, pchKey: *u8) -> *u8 #cpp_method;

    GetDlcDownloadProgress: (this: *ISteamApps, nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #cpp_method;

    GetAppBuildId: (this: *ISteamApps) -> s32 #cpp_method;

    RequestAllProofOfPurchaseKeys: (this: *ISteamApps) -> void #cpp_method;

    GetFileDetails: (this: *ISteamApps, pszFileName: *u8) -> SteamAPICall_t #cpp_method;

    GetLaunchCommandLine: (this: *ISteamApps, pszCommandLine: *u8, cubCommandLine: s32) -> s32 #cpp_method;

    BIsSubscribedFromFamilySharing: (this: *ISteamApps) -> bool #cpp_method;

    BIsTimedTrial: (this: *ISteamApps, punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool #cpp_method;

    SetDlcContext: (this: *ISteamApps, nAppID: AppId_t) -> bool #cpp_method;

    GetNumBetas: (this: *ISteamApps, pnAvailable: *s32, pnPrivate: *s32) -> s32 #cpp_method;

    GetBetaInfo: (this: *ISteamApps, iBetaIndex: s32, punFlags: *uint32, punBuildID: *uint32, pchBetaName: *u8, cchBetaName: s32, pchDescription: *u8, cchDescription: s32) -> bool #cpp_method;

    SetActiveBeta: (this: *ISteamApps, pchBetaName: *u8) -> bool #cpp_method;
}

ISteamApps_BIsSubscribed :: inline (this: *ISteamApps) -> bool { return this.vtable.BIsSubscribed(this); }
ISteamApps_BIsLowViolence :: inline (this: *ISteamApps) -> bool { return this.vtable.BIsLowViolence(this); }
ISteamApps_BIsCybercafe :: inline (this: *ISteamApps) -> bool { return this.vtable.BIsCybercafe(this); }
ISteamApps_BIsVACBanned :: inline (this: *ISteamApps) -> bool { return this.vtable.BIsVACBanned(this); }
ISteamApps_GetCurrentGameLanguage :: inline (this: *ISteamApps) -> *u8 { return this.vtable.GetCurrentGameLanguage(this); }
ISteamApps_GetAvailableGameLanguages :: inline (this: *ISteamApps) -> *u8 { return this.vtable.GetAvailableGameLanguages(this); }

ISteamApps_BIsSubscribedApp :: inline (this: *ISteamApps, appID: AppId_t) -> bool { return this.vtable.BIsSubscribedApp(this, appID); }

ISteamApps_BIsDlcInstalled :: inline (this: *ISteamApps, appID: AppId_t) -> bool { return this.vtable.BIsDlcInstalled(this, appID); }

ISteamApps_GetEarliestPurchaseUnixTime :: inline (this: *ISteamApps, nAppID: AppId_t) -> uint32 { return this.vtable.GetEarliestPurchaseUnixTime(this, nAppID); }

ISteamApps_BIsSubscribedFromFreeWeekend :: inline (this: *ISteamApps) -> bool { return this.vtable.BIsSubscribedFromFreeWeekend(this); }

ISteamApps_GetDLCCount :: inline (this: *ISteamApps) -> s32 { return this.vtable.GetDLCCount(this); }

ISteamApps_BGetDLCDataByIndex :: inline (this: *ISteamApps, iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *u8, cchNameBufferSize: s32) -> bool { return this.vtable.BGetDLCDataByIndex(this, iDLC, pAppID, pbAvailable, pchName, cchNameBufferSize); }

ISteamApps_InstallDLC :: inline (this: *ISteamApps, nAppID: AppId_t) { this.vtable.InstallDLC(this, nAppID); }
ISteamApps_UninstallDLC :: inline (this: *ISteamApps, nAppID: AppId_t) { this.vtable.UninstallDLC(this, nAppID); }

ISteamApps_RequestAppProofOfPurchaseKey :: inline (this: *ISteamApps, nAppID: AppId_t) { this.vtable.RequestAppProofOfPurchaseKey(this, nAppID); }

ISteamApps_GetCurrentBetaName :: inline (this: *ISteamApps, pchName: *u8, cchNameBufferSize: s32) -> bool { return this.vtable.GetCurrentBetaName(this, pchName, cchNameBufferSize); }
ISteamApps_MarkContentCorrupt :: inline (this: *ISteamApps, bMissingFilesOnly: bool) -> bool { return this.vtable.MarkContentCorrupt(this, bMissingFilesOnly); }
ISteamApps_GetInstalledDepots :: inline (this: *ISteamApps, appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 { return this.vtable.GetInstalledDepots(this, appID, pvecDepots, cMaxDepots); }

ISteamApps_GetAppInstallDir :: inline (this: *ISteamApps, appID: AppId_t, pchFolder: *u8, cchFolderBufferSize: uint32) -> uint32 { return this.vtable.GetAppInstallDir(this, appID, pchFolder, cchFolderBufferSize); }
ISteamApps_BIsAppInstalled :: inline (this: *ISteamApps, appID: AppId_t) -> bool { return this.vtable.BIsAppInstalled(this, appID); }

ISteamApps_GetAppOwner :: inline (this: *ISteamApps) -> CSteamID { return this.vtable.GetAppOwner(this); }

ISteamApps_GetLaunchQueryParam :: inline (this: *ISteamApps, pchKey: *u8) -> *u8 { return this.vtable.GetLaunchQueryParam(this, pchKey); }

ISteamApps_GetDlcDownloadProgress :: inline (this: *ISteamApps, nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool { return this.vtable.GetDlcDownloadProgress(this, nAppID, punBytesDownloaded, punBytesTotal); }

ISteamApps_GetAppBuildId :: inline (this: *ISteamApps) -> s32 { return this.vtable.GetAppBuildId(this); }

ISteamApps_RequestAllProofOfPurchaseKeys :: inline (this: *ISteamApps) { this.vtable.RequestAllProofOfPurchaseKeys(this); }

ISteamApps_GetFileDetails :: inline (this: *ISteamApps, pszFileName: *u8) -> SteamAPICall_t { return this.vtable.GetFileDetails(this, pszFileName); }

ISteamApps_GetLaunchCommandLine :: inline (this: *ISteamApps, pszCommandLine: *u8, cubCommandLine: s32) -> s32 { return this.vtable.GetLaunchCommandLine(this, pszCommandLine, cubCommandLine); }

ISteamApps_BIsSubscribedFromFamilySharing :: inline (this: *ISteamApps) -> bool { return this.vtable.BIsSubscribedFromFamilySharing(this); }

ISteamApps_BIsTimedTrial :: inline (this: *ISteamApps, punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool { return this.vtable.BIsTimedTrial(this, punSecondsAllowed, punSecondsPlayed); }

ISteamApps_SetDlcContext :: inline (this: *ISteamApps, nAppID: AppId_t) -> bool { return this.vtable.SetDlcContext(this, nAppID); }

ISteamApps_GetNumBetas :: inline (this: *ISteamApps, pnAvailable: *s32, pnPrivate: *s32) -> s32 { return this.vtable.GetNumBetas(this, pnAvailable, pnPrivate); }

ISteamApps_GetBetaInfo :: inline (this: *ISteamApps, iBetaIndex: s32, punFlags: *uint32, punBuildID: *uint32, pchBetaName: *u8, cchBetaName: s32, pchDescription: *u8, cchDescription: s32) -> bool { return this.vtable.GetBetaInfo(this, iBetaIndex, punFlags, punBuildID, pchBetaName, cchBetaName, pchDescription, cchDescription); }

ISteamApps_SetActiveBeta :: inline (this: *ISteamApps, pchBetaName: *u8) -> bool { return this.vtable.SetActiveBeta(this, pchBetaName); }

vtable :: (obj: *ISteamApps) -> *ISteamApps_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: posted after the user gains ownership of DLC & that DLC is installed
//-----------------------------------------------------------------------------
DlcInstalled_t :: struct {
    anon_enum_154 :: enum s32 {
        k_iCallback :: 1005;
    }
    m_nAppID: AppId_t; // AppID of the DLC
}

//---------------------------------------------------------------------------------
// Purpose: posted after the user gains executes a Steam URL with command line or query parameters
// such as steam://run/<appid>//-commandline/?param1=value1&param2=value2&param3=value3 etc
// while the game is already running.  The new params can be queried
// with GetLaunchQueryParam and GetLaunchCommandLine
//---------------------------------------------------------------------------------
NewUrlLaunchParameters_t :: struct {
    anon_enum_155 :: enum s32 {
        k_iCallback :: 1014;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// Purpose: response to RequestAppProofOfPurchaseKey/RequestAllProofOfPurchaseKeys
// for supporting third-party CD keys, or other proof-of-purchase systems.
//-----------------------------------------------------------------------------
AppProofOfPurchaseKeyResponse_t :: struct {
    anon_enum_156 :: enum s32 {
        k_iCallback :: 1021;
    }
    m_eResult:      EResult;
    m_nAppID:       uint32;
    m_cchKeyLength: uint32;
    m_rgchKey:      [240] u8;
}

//-----------------------------------------------------------------------------
// Purpose: response to GetFileDetails
//-----------------------------------------------------------------------------
FileDetailsResult_t :: struct {
    anon_enum_157 :: enum s32 {
        k_iCallback :: 1023;
    }
    m_eResult:    EResult;
    m_ulFileSize: uint64; // original file size in bytes
    m_FileSHA:    [20] uint8; // original file SHA1 hash
    m_unFlags:    uint32; // 
}

//-----------------------------------------------------------------------------
// Purpose: called for games in Timed Trial mode
//-----------------------------------------------------------------------------
TimedTrialStatus_t :: struct {
    anon_enum_158 :: enum s32 {
        k_iCallback :: 1030;
    }
    m_unAppID:          AppId_t; // appID
    m_bIsOffline:       bool; // if true, time allowed / played refers to offline time, not total time
    m_unSecondsAllowed: uint32; // how many seconds the app can be played in total 
    m_unSecondsPlayed:  uint32; // how many seconds the app was already played
}

// list of possible errors returned by SendP2PPacket() API
// these will be posted in the P2PSessionConnectFail_t callback
EP2PSessionError :: enum s32 {
    EP2PSessionErrorNone                           :: 0;
    EP2PSessionErrorNoRightsToApp                  :: 2;
    EP2PSessionErrorTimeout                        :: 4;

    EP2PSessionErrorNotRunningApp_DELETED          :: 1;
    EP2PSessionErrorDestinationNotLoggedIn_DELETED :: 3;

    EP2PSessionErrorMax                            :: 5;

    k_EP2PSessionErrorNone                           :: EP2PSessionErrorNone;
    k_EP2PSessionErrorNoRightsToApp                  :: EP2PSessionErrorNoRightsToApp;
    k_EP2PSessionErrorTimeout                        :: EP2PSessionErrorTimeout;

    k_EP2PSessionErrorNotRunningApp_DELETED          :: EP2PSessionErrorNotRunningApp_DELETED;
    k_EP2PSessionErrorDestinationNotLoggedIn_DELETED :: EP2PSessionErrorDestinationNotLoggedIn_DELETED;

    k_EP2PSessionErrorMax                            :: EP2PSessionErrorMax;
}

// SendP2PPacket() send types
// Typically k_EP2PSendUnreliable is what you want for UDP-like packets, k_EP2PSendReliable for TCP-like packets
EP2PSend :: enum s32 {
    EP2PSendUnreliable            :: 0;

    EP2PSendUnreliableNoDelay     :: 1;

    EP2PSendReliable              :: 2;

    EP2PSendReliableWithBuffering :: 3;

    k_EP2PSendUnreliable            :: EP2PSendUnreliable;

    k_EP2PSendUnreliableNoDelay     :: EP2PSendUnreliableNoDelay;

    k_EP2PSendReliable              :: EP2PSendReliable;

    k_EP2PSendReliableWithBuffering :: EP2PSendReliableWithBuffering;
}

P2PSessionState_t :: struct {
    m_bConnectionActive:     uint8; // true if we've got an active open connection
    m_bConnecting:           uint8; // true if we're currently trying to establish a connection
    m_eP2PSessionError:      uint8; // last error recorded (see enum above)
    m_bUsingRelay:           uint8; // true if it's going through a relay server (TURN)
    m_nBytesQueuedForSend:   int32;
    m_nPacketsQueuedForSend: int32;
    m_nRemoteIP:             uint32; // potential IP:Port of remote host. Could be TURN server. 
    m_nRemotePort:           uint16; // Only exists for compatibility with older authentication api's
}

// handle to a socket
SNetSocket_t :: uint32;
SNetListenSocket_t :: uint32;

// connection progress indicators, used by CreateP2PConnectionSocket()
ESNetSocketState :: enum s32 {
    ESNetSocketStateInvalid                  :: 0;

    ESNetSocketStateConnected                :: 1;

    ESNetSocketStateInitiated                :: 10;

    ESNetSocketStateLocalCandidatesFound     :: 11;
    ESNetSocketStateReceivedRemoteCandidates :: 12;

    ESNetSocketStateChallengeHandshake       :: 15;

    ESNetSocketStateDisconnecting            :: 21;
    ESNetSocketStateLocalDisconnect          :: 22;
    ESNetSocketStateTimeoutDuringConnect     :: 23;
    ESNetSocketStateRemoteEndDisconnected    :: 24;
    ESNetSocketStateConnectionBroken         :: 25;

    k_ESNetSocketStateInvalid                  :: ESNetSocketStateInvalid;

    k_ESNetSocketStateConnected                :: ESNetSocketStateConnected;

    k_ESNetSocketStateInitiated                :: ESNetSocketStateInitiated;

    k_ESNetSocketStateLocalCandidatesFound     :: ESNetSocketStateLocalCandidatesFound;
    k_ESNetSocketStateReceivedRemoteCandidates :: ESNetSocketStateReceivedRemoteCandidates;

    k_ESNetSocketStateChallengeHandshake       :: ESNetSocketStateChallengeHandshake;

    k_ESNetSocketStateDisconnecting            :: ESNetSocketStateDisconnecting;
    k_ESNetSocketStateLocalDisconnect          :: ESNetSocketStateLocalDisconnect;
    k_ESNetSocketStateTimeoutDuringConnect     :: ESNetSocketStateTimeoutDuringConnect;
    k_ESNetSocketStateRemoteEndDisconnected    :: ESNetSocketStateRemoteEndDisconnected;
    k_ESNetSocketStateConnectionBroken         :: ESNetSocketStateConnectionBroken;
}

// describes how the socket is currently connected
ESNetSocketConnectionType :: enum s32 {
    ESNetSocketConnectionTypeNotConnected :: 0;
    ESNetSocketConnectionTypeUDP          :: 1;
    ESNetSocketConnectionTypeUDPRelay     :: 2;

    k_ESNetSocketConnectionTypeNotConnected :: ESNetSocketConnectionTypeNotConnected;
    k_ESNetSocketConnectionTypeUDP          :: ESNetSocketConnectionTypeUDP;
    k_ESNetSocketConnectionTypeUDPRelay     :: ESNetSocketConnectionTypeUDPRelay;
}

//-----------------------------------------------------------------------------
// Purpose: Functions for making connections and sending data between clients,
//			traversing NAT's where possible
//
// NOTE: This interface is deprecated and may be removed in a future release of
///      the Steamworks SDK.  Please see ISteamNetworkingSockets and
///      ISteamNetworkingMessages
//-----------------------------------------------------------------------------
ISteamNetworking :: struct {
    vtable: *ISteamNetworking_VTable;
}
ISteamNetworking_VTable :: struct #type_info_none {
    SendP2PPacket: (this: *ISteamNetworking, steamIDRemote: CSteamID, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32 = 0) -> bool #cpp_method;

    IsP2PPacketAvailable: (this: *ISteamNetworking, pcubMsgSize: *uint32, nChannel: s32 = 0) -> bool #cpp_method;

    ReadP2PPacket: (this: *ISteamNetworking, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32 = 0) -> bool #cpp_method;

    AcceptP2PSessionWithUser: (this: *ISteamNetworking, steamIDRemote: CSteamID) -> bool #cpp_method;

    CloseP2PSessionWithUser: (this: *ISteamNetworking, steamIDRemote: CSteamID) -> bool #cpp_method;

    CloseP2PChannelWithUser: (this: *ISteamNetworking, steamIDRemote: CSteamID, nChannel: s32) -> bool #cpp_method;

    GetP2PSessionState: (this: *ISteamNetworking, steamIDRemote: CSteamID, pConnectionState: *P2PSessionState_t) -> bool #cpp_method;

    AllowP2PPacketRelay: (this: *ISteamNetworking, bAllow: bool) -> bool #cpp_method;

    CreateListenSocket: (this: *ISteamNetworking, nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t #cpp_method;

    CreateP2PConnectionSocket: (this: *ISteamNetworking, steamIDTarget: CSteamID, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool) -> SNetSocket_t #cpp_method;
    CreateConnectionSocket: (this: *ISteamNetworking, nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32) -> SNetSocket_t #cpp_method;

    DestroySocket: (this: *ISteamNetworking, hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool #cpp_method;

    DestroyListenSocket: (this: *ISteamNetworking, hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool #cpp_method;

    SendDataOnSocket: (this: *ISteamNetworking, hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool) -> bool #cpp_method;

    IsDataAvailableOnSocket: (this: *ISteamNetworking, hSocket: SNetSocket_t, pcubMsgSize: *uint32) -> bool #cpp_method;

    RetrieveDataFromSocket: (this: *ISteamNetworking, hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32) -> bool #cpp_method;

    IsDataAvailable: (this: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #cpp_method;

    RetrieveData: (this: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #cpp_method;

    GetSocketInfo: (this: *ISteamNetworking, hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16) -> bool #cpp_method;

    GetListenSocketInfo: (this: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16) -> bool #cpp_method;

    GetSocketConnectionType: (this: *ISteamNetworking, hSocket: SNetSocket_t) -> ESNetSocketConnectionType #cpp_method;

    GetMaxPacketSize: (this: *ISteamNetworking, hSocket: SNetSocket_t) -> s32 #cpp_method;
}

ISteamNetworking_SendP2PPacket :: inline (this: *ISteamNetworking, steamIDRemote: CSteamID, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32 = 0) -> bool { return this.vtable.SendP2PPacket(this, steamIDRemote, pubData, cubData, eP2PSendType, nChannel); }

ISteamNetworking_IsP2PPacketAvailable :: inline (this: *ISteamNetworking, pcubMsgSize: *uint32, nChannel: s32 = 0) -> bool { return this.vtable.IsP2PPacketAvailable(this, pcubMsgSize, nChannel); }

ISteamNetworking_ReadP2PPacket :: inline (this: *ISteamNetworking, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32 = 0) -> bool { return this.vtable.ReadP2PPacket(this, pubDest, cubDest, pcubMsgSize, psteamIDRemote, nChannel); }

ISteamNetworking_AcceptP2PSessionWithUser :: inline (this: *ISteamNetworking, steamIDRemote: CSteamID) -> bool { return this.vtable.AcceptP2PSessionWithUser(this, steamIDRemote); }

ISteamNetworking_CloseP2PSessionWithUser :: inline (this: *ISteamNetworking, steamIDRemote: CSteamID) -> bool { return this.vtable.CloseP2PSessionWithUser(this, steamIDRemote); }

ISteamNetworking_CloseP2PChannelWithUser :: inline (this: *ISteamNetworking, steamIDRemote: CSteamID, nChannel: s32) -> bool { return this.vtable.CloseP2PChannelWithUser(this, steamIDRemote, nChannel); }

ISteamNetworking_GetP2PSessionState :: inline (this: *ISteamNetworking, steamIDRemote: CSteamID, pConnectionState: *P2PSessionState_t) -> bool { return this.vtable.GetP2PSessionState(this, steamIDRemote, pConnectionState); }

ISteamNetworking_AllowP2PPacketRelay :: inline (this: *ISteamNetworking, bAllow: bool) -> bool { return this.vtable.AllowP2PPacketRelay(this, bAllow); }

ISteamNetworking_CreateListenSocket :: inline (this: *ISteamNetworking, nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t { return this.vtable.CreateListenSocket(this, nVirtualP2PPort, nIP, nPort, bAllowUseOfPacketRelay); }

ISteamNetworking_CreateP2PConnectionSocket :: inline (this: *ISteamNetworking, steamIDTarget: CSteamID, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool) -> SNetSocket_t { return this.vtable.CreateP2PConnectionSocket(this, steamIDTarget, nVirtualPort, nTimeoutSec, bAllowUseOfPacketRelay); }
ISteamNetworking_CreateConnectionSocket :: inline (this: *ISteamNetworking, nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32) -> SNetSocket_t { return this.vtable.CreateConnectionSocket(this, nIP, nPort, nTimeoutSec); }

ISteamNetworking_DestroySocket :: inline (this: *ISteamNetworking, hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool { return this.vtable.DestroySocket(this, hSocket, bNotifyRemoteEnd); }

ISteamNetworking_DestroyListenSocket :: inline (this: *ISteamNetworking, hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool { return this.vtable.DestroyListenSocket(this, hSocket, bNotifyRemoteEnd); }

ISteamNetworking_SendDataOnSocket :: inline (this: *ISteamNetworking, hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool) -> bool { return this.vtable.SendDataOnSocket(this, hSocket, pubData, cubData, bReliable); }

ISteamNetworking_IsDataAvailableOnSocket :: inline (this: *ISteamNetworking, hSocket: SNetSocket_t, pcubMsgSize: *uint32) -> bool { return this.vtable.IsDataAvailableOnSocket(this, hSocket, pcubMsgSize); }

ISteamNetworking_RetrieveDataFromSocket :: inline (this: *ISteamNetworking, hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32) -> bool { return this.vtable.RetrieveDataFromSocket(this, hSocket, pubDest, cubDest, pcubMsgSize); }

ISteamNetworking_IsDataAvailable :: inline (this: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool { return this.vtable.IsDataAvailable(this, hListenSocket, pcubMsgSize, phSocket); }

ISteamNetworking_RetrieveData :: inline (this: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool { return this.vtable.RetrieveData(this, hListenSocket, pubDest, cubDest, pcubMsgSize, phSocket); }

ISteamNetworking_GetSocketInfo :: inline (this: *ISteamNetworking, hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16) -> bool { return this.vtable.GetSocketInfo(this, hSocket, pSteamIDRemote, peSocketStatus, punIPRemote, punPortRemote); }

ISteamNetworking_GetListenSocketInfo :: inline (this: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16) -> bool { return this.vtable.GetListenSocketInfo(this, hListenSocket, pnIP, pnPort); }

ISteamNetworking_GetSocketConnectionType :: inline (this: *ISteamNetworking, hSocket: SNetSocket_t) -> ESNetSocketConnectionType { return this.vtable.GetSocketConnectionType(this, hSocket); }

ISteamNetworking_GetMaxPacketSize :: inline (this: *ISteamNetworking, hSocket: SNetSocket_t) -> s32 { return this.vtable.GetMaxPacketSize(this, hSocket); }

vtable :: (obj: *ISteamNetworking) -> *ISteamNetworking_VTable { return obj.vtable; }


// callback notification - a user wants to talk to us over the P2P channel via the SendP2PPacket() API
// in response, a call to AcceptP2PPacketsFromUser() needs to be made, if you want to talk with them
P2PSessionRequest_t :: struct {
    anon_enum_159 :: enum s32 {
        k_iCallback :: 1202;
    }
    m_steamIDRemote: CSteamID; // user who wants to talk to us
}

// callback notification - packets can't get through to the specified user via the SendP2PPacket() API
// all packets queued packets unsent at this point will be dropped
// further attempts to send will retry making the connection (but will be dropped if we fail again)
P2PSessionConnectFail_t :: struct {
    anon_enum_160 :: enum s32 {
        k_iCallback :: 1203;
    }
    m_steamIDRemote:    CSteamID; // user we were sending packets to
    m_eP2PSessionError: uint8; // EP2PSessionError indicating why we're having trouble
}

// callback notification - status of a socket has changed
// used as part of the CreateListenSocket() / CreateP2PConnectionSocket()
SocketStatusCallback_t :: struct {
    anon_enum_161 :: enum s32 {
        k_iCallback :: 1201;
    }
    m_hSocket:          SNetSocket_t; // the socket used to send/receive data to the remote host
    m_hListenSocket:    SNetListenSocket_t; // this is the server socket that we were listening on; NULL if this was an outgoing connection
    m_steamIDRemote:    CSteamID; // remote steamID we have connected to, if it has one
    m_eSNetSocketState: s32; // socket state, ESNetSocketState
}

k_nScreenshotMaxTaggedUsers: uint32 : 32;
k_nScreenshotMaxTaggedPublishedFiles: uint32 : 32;
k_cubUFSTagTypeMax: s32 : 255;
k_cubUFSTagValueMax: s32 : 255;

// Required with of a thumbnail provided to AddScreenshotToLibrary.  If you do not provide a thumbnail
// one will be generated.
k_ScreenshotThumbWidth: s32 : 200;

// Handle is valid for the lifetime of your process and no longer
ScreenshotHandle :: uint32;

EVRScreenshotType :: enum s32 {
    None           :: 0;
    Mono           :: 1;
    Stereo         :: 2;
    MonoCubemap    :: 3;
    MonoPanorama   :: 4;
    StereoPanorama :: 5;

    k_EVRScreenshotType_None           :: None;
    k_EVRScreenshotType_Mono           :: Mono;
    k_EVRScreenshotType_Stereo         :: Stereo;
    k_EVRScreenshotType_MonoCubemap    :: MonoCubemap;
    k_EVRScreenshotType_MonoPanorama   :: MonoPanorama;
    k_EVRScreenshotType_StereoPanorama :: StereoPanorama;
}

//-----------------------------------------------------------------------------
// Purpose: Functions for adding screenshots to the user's screenshot library
//-----------------------------------------------------------------------------
ISteamScreenshots :: struct {
    vtable: *ISteamScreenshots_VTable;
}
ISteamScreenshots_VTable :: struct #type_info_none {
    WriteScreenshot: (this: *ISteamScreenshots, pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle #cpp_method;

    AddScreenshotToLibrary: (this: *ISteamScreenshots, pchFilename: *u8, pchThumbnailFilename: *u8, nWidth: s32, nHeight: s32) -> ScreenshotHandle #cpp_method;

    TriggerScreenshot: (this: *ISteamScreenshots) -> void #cpp_method;

    HookScreenshots: (this: *ISteamScreenshots, bHook: bool) -> void #cpp_method;

    SetLocation: (this: *ISteamScreenshots, hScreenshot: ScreenshotHandle, pchLocation: *u8) -> bool #cpp_method;

    TagUser: (this: *ISteamScreenshots, hScreenshot: ScreenshotHandle, steamID: CSteamID) -> bool #cpp_method;

    TagPublishedFile: (this: *ISteamScreenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool #cpp_method;

    IsScreenshotsHooked: (this: *ISteamScreenshots) -> bool #cpp_method;

    AddVRScreenshotToLibrary: (this: *ISteamScreenshots, eType: EVRScreenshotType, pchFilename: *u8, pchVRFilename: *u8) -> ScreenshotHandle #cpp_method;
}

ISteamScreenshots_WriteScreenshot :: inline (this: *ISteamScreenshots, pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle { return this.vtable.WriteScreenshot(this, pubRGB, cubRGB, nWidth, nHeight); }

ISteamScreenshots_AddScreenshotToLibrary :: inline (this: *ISteamScreenshots, pchFilename: *u8, pchThumbnailFilename: *u8, nWidth: s32, nHeight: s32) -> ScreenshotHandle { return this.vtable.AddScreenshotToLibrary(this, pchFilename, pchThumbnailFilename, nWidth, nHeight); }

ISteamScreenshots_TriggerScreenshot :: inline (this: *ISteamScreenshots) { this.vtable.TriggerScreenshot(this); }

ISteamScreenshots_HookScreenshots :: inline (this: *ISteamScreenshots, bHook: bool) { this.vtable.HookScreenshots(this, bHook); }

ISteamScreenshots_SetLocation :: inline (this: *ISteamScreenshots, hScreenshot: ScreenshotHandle, pchLocation: *u8) -> bool { return this.vtable.SetLocation(this, hScreenshot, pchLocation); }

ISteamScreenshots_TagUser :: inline (this: *ISteamScreenshots, hScreenshot: ScreenshotHandle, steamID: CSteamID) -> bool { return this.vtable.TagUser(this, hScreenshot, steamID); }

ISteamScreenshots_TagPublishedFile :: inline (this: *ISteamScreenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool { return this.vtable.TagPublishedFile(this, hScreenshot, unPublishedFileID); }

ISteamScreenshots_IsScreenshotsHooked :: inline (this: *ISteamScreenshots) -> bool { return this.vtable.IsScreenshotsHooked(this); }

ISteamScreenshots_AddVRScreenshotToLibrary :: inline (this: *ISteamScreenshots, eType: EVRScreenshotType, pchFilename: *u8, pchVRFilename: *u8) -> ScreenshotHandle { return this.vtable.AddVRScreenshotToLibrary(this, eType, pchFilename, pchVRFilename); }

vtable :: (obj: *ISteamScreenshots) -> *ISteamScreenshots_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Screenshot successfully written or otherwise added to the library
// and can now be tagged
//-----------------------------------------------------------------------------
ScreenshotReady_t :: struct {
    anon_enum_162 :: enum s32 {
        k_iCallback :: 2301;
    }
    m_hLocal:  ScreenshotHandle;
    m_eResult: EResult;
}

//-----------------------------------------------------------------------------
// Purpose: Screenshot has been requested by the user.  Only sent if
// HookScreenshots() has been called, in which case Steam will not take
// the screenshot itself.
//-----------------------------------------------------------------------------
ScreenshotRequested_t :: struct {
    anon_enum_163 :: enum s32 {
        k_iCallback :: 2302;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
AudioPlayback_Status :: enum s32 {
    Undefined :: 0;
    Playing   :: 1;
    Paused    :: 2;
    Idle      :: 3;

    AudioPlayback_Undefined :: Undefined;
    AudioPlayback_Playing   :: Playing;
    AudioPlayback_Paused    :: Paused;
    AudioPlayback_Idle      :: Idle;
}

//-----------------------------------------------------------------------------
// Purpose: Functions to control music playback in the steam client
//-----------------------------------------------------------------------------
ISteamMusic :: struct {
    vtable: *ISteamMusic_VTable;
}
ISteamMusic_VTable :: struct #type_info_none {
    BIsEnabled: (this: *ISteamMusic) -> bool #cpp_method;
    BIsPlaying: (this: *ISteamMusic) -> bool #cpp_method;

    GetPlaybackStatus: (this: *ISteamMusic) -> AudioPlayback_Status #cpp_method;

    Play: (this: *ISteamMusic) -> void #cpp_method;
    Pause: (this: *ISteamMusic) -> void #cpp_method;
    PlayPrevious: (this: *ISteamMusic) -> void #cpp_method;
    PlayNext: (this: *ISteamMusic) -> void #cpp_method;

    SetVolume: (this: *ISteamMusic, flVolume: float) -> void #cpp_method;
    GetVolume: (this: *ISteamMusic) -> float #cpp_method;
}

ISteamMusic_BIsEnabled :: inline (this: *ISteamMusic) -> bool { return this.vtable.BIsEnabled(this); }
ISteamMusic_BIsPlaying :: inline (this: *ISteamMusic) -> bool { return this.vtable.BIsPlaying(this); }

ISteamMusic_GetPlaybackStatus :: inline (this: *ISteamMusic) -> AudioPlayback_Status { return this.vtable.GetPlaybackStatus(this); }

ISteamMusic_Play :: inline (this: *ISteamMusic) { this.vtable.Play(this); }
ISteamMusic_Pause :: inline (this: *ISteamMusic) { this.vtable.Pause(this); }
ISteamMusic_PlayPrevious :: inline (this: *ISteamMusic) { this.vtable.PlayPrevious(this); }
ISteamMusic_PlayNext :: inline (this: *ISteamMusic) { this.vtable.PlayNext(this); }

ISteamMusic_SetVolume :: inline (this: *ISteamMusic, flVolume: float) { this.vtable.SetVolume(this, flVolume); }
ISteamMusic_GetVolume :: inline (this: *ISteamMusic) -> float { return this.vtable.GetVolume(this); }

vtable :: (obj: *ISteamMusic) -> *ISteamMusic_VTable { return obj.vtable; }


PlaybackStatusHasChanged_t :: struct {
    anon_enum_164 :: enum s32 {
        k_iCallback :: 4001;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

VolumeHasChanged_t :: struct {
    anon_enum_165 :: enum s32 {
        k_iCallback :: 4002;
    }
    m_flNewVolume: float;
}

ISteamMusicRemote :: struct {
    vtable: *ISteamMusicRemote_VTable;
}
ISteamMusicRemote_VTable :: struct #type_info_none {
    RegisterSteamMusicRemote: (this: *ISteamMusicRemote, pchName: *u8) -> bool #cpp_method;
    DeregisterSteamMusicRemote: (this: *ISteamMusicRemote) -> bool #cpp_method;
    BIsCurrentMusicRemote: (this: *ISteamMusicRemote) -> bool #cpp_method;
    BActivationSuccess: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;

    SetDisplayName: (this: *ISteamMusicRemote, pchDisplayName: *u8) -> bool #cpp_method;
    SetPNGIcon_64x64: (this: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool #cpp_method;

    EnablePlayPrevious: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;
    EnablePlayNext: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;
    EnableShuffled: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;
    EnableLooped: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;
    EnableQueue: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;
    EnablePlaylists: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;

    UpdatePlaybackStatus: (this: *ISteamMusicRemote, nStatus: AudioPlayback_Status) -> bool #cpp_method;
    UpdateShuffled: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;
    UpdateLooped: (this: *ISteamMusicRemote, bValue: bool) -> bool #cpp_method;
    UpdateVolume: (this: *ISteamMusicRemote, flValue: float) -> bool #cpp_method;

    CurrentEntryWillChange: (this: *ISteamMusicRemote) -> bool #cpp_method;
    CurrentEntryIsAvailable: (this: *ISteamMusicRemote, bAvailable: bool) -> bool #cpp_method;
    UpdateCurrentEntryText: (this: *ISteamMusicRemote, pchText: *u8) -> bool #cpp_method;
    UpdateCurrentEntryElapsedSeconds: (this: *ISteamMusicRemote, nValue: s32) -> bool #cpp_method;
    UpdateCurrentEntryCoverArt: (this: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool #cpp_method;
    CurrentEntryDidChange: (this: *ISteamMusicRemote) -> bool #cpp_method;

    QueueWillChange: (this: *ISteamMusicRemote) -> bool #cpp_method;
    ResetQueueEntries: (this: *ISteamMusicRemote) -> bool #cpp_method;
    SetQueueEntry: (this: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *u8) -> bool #cpp_method;
    SetCurrentQueueEntry: (this: *ISteamMusicRemote, nID: s32) -> bool #cpp_method;
    QueueDidChange: (this: *ISteamMusicRemote) -> bool #cpp_method;

    PlaylistWillChange: (this: *ISteamMusicRemote) -> bool #cpp_method;
    ResetPlaylistEntries: (this: *ISteamMusicRemote) -> bool #cpp_method;
    SetPlaylistEntry: (this: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *u8) -> bool #cpp_method;
    SetCurrentPlaylistEntry: (this: *ISteamMusicRemote, nID: s32) -> bool #cpp_method;
    PlaylistDidChange: (this: *ISteamMusicRemote) -> bool #cpp_method;
}

ISteamMusicRemote_RegisterSteamMusicRemote :: inline (this: *ISteamMusicRemote, pchName: *u8) -> bool { return this.vtable.RegisterSteamMusicRemote(this, pchName); }
ISteamMusicRemote_DeregisterSteamMusicRemote :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.DeregisterSteamMusicRemote(this); }
ISteamMusicRemote_BIsCurrentMusicRemote :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.BIsCurrentMusicRemote(this); }
ISteamMusicRemote_BActivationSuccess :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.BActivationSuccess(this, bValue); }

ISteamMusicRemote_SetDisplayName :: inline (this: *ISteamMusicRemote, pchDisplayName: *u8) -> bool { return this.vtable.SetDisplayName(this, pchDisplayName); }
ISteamMusicRemote_SetPNGIcon_64x64 :: inline (this: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool { return this.vtable.SetPNGIcon_64x64(this, pvBuffer, cbBufferLength); }

ISteamMusicRemote_EnablePlayPrevious :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.EnablePlayPrevious(this, bValue); }
ISteamMusicRemote_EnablePlayNext :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.EnablePlayNext(this, bValue); }
ISteamMusicRemote_EnableShuffled :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.EnableShuffled(this, bValue); }
ISteamMusicRemote_EnableLooped :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.EnableLooped(this, bValue); }
ISteamMusicRemote_EnableQueue :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.EnableQueue(this, bValue); }
ISteamMusicRemote_EnablePlaylists :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.EnablePlaylists(this, bValue); }

ISteamMusicRemote_UpdatePlaybackStatus :: inline (this: *ISteamMusicRemote, nStatus: AudioPlayback_Status) -> bool { return this.vtable.UpdatePlaybackStatus(this, nStatus); }
ISteamMusicRemote_UpdateShuffled :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.UpdateShuffled(this, bValue); }
ISteamMusicRemote_UpdateLooped :: inline (this: *ISteamMusicRemote, bValue: bool) -> bool { return this.vtable.UpdateLooped(this, bValue); }
ISteamMusicRemote_UpdateVolume :: inline (this: *ISteamMusicRemote, flValue: float) -> bool { return this.vtable.UpdateVolume(this, flValue); }

ISteamMusicRemote_CurrentEntryWillChange :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.CurrentEntryWillChange(this); }
ISteamMusicRemote_CurrentEntryIsAvailable :: inline (this: *ISteamMusicRemote, bAvailable: bool) -> bool { return this.vtable.CurrentEntryIsAvailable(this, bAvailable); }
ISteamMusicRemote_UpdateCurrentEntryText :: inline (this: *ISteamMusicRemote, pchText: *u8) -> bool { return this.vtable.UpdateCurrentEntryText(this, pchText); }
ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds :: inline (this: *ISteamMusicRemote, nValue: s32) -> bool { return this.vtable.UpdateCurrentEntryElapsedSeconds(this, nValue); }
ISteamMusicRemote_UpdateCurrentEntryCoverArt :: inline (this: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool { return this.vtable.UpdateCurrentEntryCoverArt(this, pvBuffer, cbBufferLength); }
ISteamMusicRemote_CurrentEntryDidChange :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.CurrentEntryDidChange(this); }

ISteamMusicRemote_QueueWillChange :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.QueueWillChange(this); }
ISteamMusicRemote_ResetQueueEntries :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.ResetQueueEntries(this); }
ISteamMusicRemote_SetQueueEntry :: inline (this: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *u8) -> bool { return this.vtable.SetQueueEntry(this, nID, nPosition, pchEntryText); }
ISteamMusicRemote_SetCurrentQueueEntry :: inline (this: *ISteamMusicRemote, nID: s32) -> bool { return this.vtable.SetCurrentQueueEntry(this, nID); }
ISteamMusicRemote_QueueDidChange :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.QueueDidChange(this); }

ISteamMusicRemote_PlaylistWillChange :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.PlaylistWillChange(this); }
ISteamMusicRemote_ResetPlaylistEntries :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.ResetPlaylistEntries(this); }
ISteamMusicRemote_SetPlaylistEntry :: inline (this: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *u8) -> bool { return this.vtable.SetPlaylistEntry(this, nID, nPosition, pchEntryText); }
ISteamMusicRemote_SetCurrentPlaylistEntry :: inline (this: *ISteamMusicRemote, nID: s32) -> bool { return this.vtable.SetCurrentPlaylistEntry(this, nID); }
ISteamMusicRemote_PlaylistDidChange :: inline (this: *ISteamMusicRemote) -> bool { return this.vtable.PlaylistDidChange(this); }

vtable :: (obj: *ISteamMusicRemote) -> *ISteamMusicRemote_VTable { return obj.vtable; }


MusicPlayerRemoteWillActivate_t :: struct {
    anon_enum_166 :: enum s32 {
        k_iCallback :: 4101;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerRemoteWillDeactivate_t :: struct {
    anon_enum_167 :: enum s32 {
        k_iCallback :: 4102;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerRemoteToFront_t :: struct {
    anon_enum_168 :: enum s32 {
        k_iCallback :: 4103;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerWillQuit_t :: struct {
    anon_enum_169 :: enum s32 {
        k_iCallback :: 4104;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerWantsPlay_t :: struct {
    anon_enum_170 :: enum s32 {
        k_iCallback :: 4105;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerWantsPause_t :: struct {
    anon_enum_171 :: enum s32 {
        k_iCallback :: 4106;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerWantsPlayPrevious_t :: struct {
    anon_enum_172 :: enum s32 {
        k_iCallback :: 4107;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerWantsPlayNext_t :: struct {
    anon_enum_173 :: enum s32 {
        k_iCallback :: 4108;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

MusicPlayerWantsShuffled_t :: struct {
    anon_enum_174 :: enum s32 {
        k_iCallback :: 4109;
    }
    m_bShuffled: bool;
}

MusicPlayerWantsLooped_t :: struct {
    anon_enum_175 :: enum s32 {
        k_iCallback :: 4110;
    }
    m_bLooped: bool;
}

MusicPlayerWantsVolume_t :: struct {
    anon_enum_176 :: enum s32 {
        k_iCallback :: 4011;
    }
    m_flNewVolume: float;
}

MusicPlayerSelectsQueueEntry_t :: struct {
    anon_enum_177 :: enum s32 {
        k_iCallback :: 4012;
    }
    nID: s32;
}

MusicPlayerSelectsPlaylistEntry_t :: struct {
    anon_enum_178 :: enum s32 {
        k_iCallback :: 4013;
    }
    nID: s32;
}

MusicPlayerWantsPlayingRepeatStatus_t :: struct {
    anon_enum_179 :: enum s32 {
        k_iCallback :: 4114;
    }
    m_nPlayingRepeatStatus: s32;
}

// This enum is used in client API methods, do not re-number existing values.
EHTTPMethod :: enum s32 {
    EHTTPMethodInvalid :: 0;
    EHTTPMethodGET     :: 1;
    EHTTPMethodHEAD    :: 2;
    EHTTPMethodPOST    :: 3;
    EHTTPMethodPUT     :: 4;
    EHTTPMethodDELETE  :: 5;
    EHTTPMethodOPTIONS :: 6;
    EHTTPMethodPATCH   :: 7;

    k_EHTTPMethodInvalid :: EHTTPMethodInvalid;
    k_EHTTPMethodGET     :: EHTTPMethodGET;
    k_EHTTPMethodHEAD    :: EHTTPMethodHEAD;
    k_EHTTPMethodPOST    :: EHTTPMethodPOST;
    k_EHTTPMethodPUT     :: EHTTPMethodPUT;
    k_EHTTPMethodDELETE  :: EHTTPMethodDELETE;
    k_EHTTPMethodOPTIONS :: EHTTPMethodOPTIONS;
    k_EHTTPMethodPATCH   :: EHTTPMethodPATCH;
}

// HTTP Status codes that the server can send in response to a request, see rfc2616 section 10.3 for descriptions
// of each of these.
EHTTPStatusCode :: enum s32 {
    EHTTPStatusCodeInvalid                         :: 0;

    EHTTPStatusCode100Continue                     :: 100;
    EHTTPStatusCode101SwitchingProtocols           :: 101;

    EHTTPStatusCode200OK                           :: 200;
    EHTTPStatusCode201Created                      :: 201;
    EHTTPStatusCode202Accepted                     :: 202;
    EHTTPStatusCode203NonAuthoritative             :: 203;
    EHTTPStatusCode204NoContent                    :: 204;
    EHTTPStatusCode205ResetContent                 :: 205;
    EHTTPStatusCode206PartialContent               :: 206;

    EHTTPStatusCode300MultipleChoices              :: 300;
    EHTTPStatusCode301MovedPermanently             :: 301;
    EHTTPStatusCode302Found                        :: 302;
    EHTTPStatusCode303SeeOther                     :: 303;
    EHTTPStatusCode304NotModified                  :: 304;
    EHTTPStatusCode305UseProxy                     :: 305;

    EHTTPStatusCode307TemporaryRedirect            :: 307;
    EHTTPStatusCode308PermanentRedirect            :: 308;

    EHTTPStatusCode400BadRequest                   :: 400;
    EHTTPStatusCode401Unauthorized                 :: 401;
    EHTTPStatusCode402PaymentRequired              :: 402;
    EHTTPStatusCode403Forbidden                    :: 403;
    EHTTPStatusCode404NotFound                     :: 404;
    EHTTPStatusCode405MethodNotAllowed             :: 405;
    EHTTPStatusCode406NotAcceptable                :: 406;
    EHTTPStatusCode407ProxyAuthRequired            :: 407;
    EHTTPStatusCode408RequestTimeout               :: 408;
    EHTTPStatusCode409Conflict                     :: 409;
    EHTTPStatusCode410Gone                         :: 410;
    EHTTPStatusCode411LengthRequired               :: 411;
    EHTTPStatusCode412PreconditionFailed           :: 412;
    EHTTPStatusCode413RequestEntityTooLarge        :: 413;
    EHTTPStatusCode414RequestURITooLong            :: 414;
    EHTTPStatusCode415UnsupportedMediaType         :: 415;
    EHTTPStatusCode416RequestedRangeNotSatisfiable :: 416;
    EHTTPStatusCode417ExpectationFailed            :: 417;
    EHTTPStatusCode4xxUnknown                      :: 418;
    EHTTPStatusCode429TooManyRequests              :: 429;
    EHTTPStatusCode444ConnectionClosed             :: 444;

    EHTTPStatusCode500InternalServerError          :: 500;
    EHTTPStatusCode501NotImplemented               :: 501;
    EHTTPStatusCode502BadGateway                   :: 502;
    EHTTPStatusCode503ServiceUnavailable           :: 503;
    EHTTPStatusCode504GatewayTimeout               :: 504;
    EHTTPStatusCode505HTTPVersionNotSupported      :: 505;
    EHTTPStatusCode5xxUnknown                      :: 599;

    k_EHTTPStatusCodeInvalid                         :: EHTTPStatusCodeInvalid;

    k_EHTTPStatusCode100Continue                     :: EHTTPStatusCode100Continue;
    k_EHTTPStatusCode101SwitchingProtocols           :: EHTTPStatusCode101SwitchingProtocols;

    k_EHTTPStatusCode200OK                           :: EHTTPStatusCode200OK;
    k_EHTTPStatusCode201Created                      :: EHTTPStatusCode201Created;
    k_EHTTPStatusCode202Accepted                     :: EHTTPStatusCode202Accepted;
    k_EHTTPStatusCode203NonAuthoritative             :: EHTTPStatusCode203NonAuthoritative;
    k_EHTTPStatusCode204NoContent                    :: EHTTPStatusCode204NoContent;
    k_EHTTPStatusCode205ResetContent                 :: EHTTPStatusCode205ResetContent;
    k_EHTTPStatusCode206PartialContent               :: EHTTPStatusCode206PartialContent;

    k_EHTTPStatusCode300MultipleChoices              :: EHTTPStatusCode300MultipleChoices;
    k_EHTTPStatusCode301MovedPermanently             :: EHTTPStatusCode301MovedPermanently;
    k_EHTTPStatusCode302Found                        :: EHTTPStatusCode302Found;
    k_EHTTPStatusCode303SeeOther                     :: EHTTPStatusCode303SeeOther;
    k_EHTTPStatusCode304NotModified                  :: EHTTPStatusCode304NotModified;
    k_EHTTPStatusCode305UseProxy                     :: EHTTPStatusCode305UseProxy;

    k_EHTTPStatusCode307TemporaryRedirect            :: EHTTPStatusCode307TemporaryRedirect;
    k_EHTTPStatusCode308PermanentRedirect            :: EHTTPStatusCode308PermanentRedirect;

    k_EHTTPStatusCode400BadRequest                   :: EHTTPStatusCode400BadRequest;
    k_EHTTPStatusCode401Unauthorized                 :: EHTTPStatusCode401Unauthorized;
    k_EHTTPStatusCode402PaymentRequired              :: EHTTPStatusCode402PaymentRequired;
    k_EHTTPStatusCode403Forbidden                    :: EHTTPStatusCode403Forbidden;
    k_EHTTPStatusCode404NotFound                     :: EHTTPStatusCode404NotFound;
    k_EHTTPStatusCode405MethodNotAllowed             :: EHTTPStatusCode405MethodNotAllowed;
    k_EHTTPStatusCode406NotAcceptable                :: EHTTPStatusCode406NotAcceptable;
    k_EHTTPStatusCode407ProxyAuthRequired            :: EHTTPStatusCode407ProxyAuthRequired;
    k_EHTTPStatusCode408RequestTimeout               :: EHTTPStatusCode408RequestTimeout;
    k_EHTTPStatusCode409Conflict                     :: EHTTPStatusCode409Conflict;
    k_EHTTPStatusCode410Gone                         :: EHTTPStatusCode410Gone;
    k_EHTTPStatusCode411LengthRequired               :: EHTTPStatusCode411LengthRequired;
    k_EHTTPStatusCode412PreconditionFailed           :: EHTTPStatusCode412PreconditionFailed;
    k_EHTTPStatusCode413RequestEntityTooLarge        :: EHTTPStatusCode413RequestEntityTooLarge;
    k_EHTTPStatusCode414RequestURITooLong            :: EHTTPStatusCode414RequestURITooLong;
    k_EHTTPStatusCode415UnsupportedMediaType         :: EHTTPStatusCode415UnsupportedMediaType;
    k_EHTTPStatusCode416RequestedRangeNotSatisfiable :: EHTTPStatusCode416RequestedRangeNotSatisfiable;
    k_EHTTPStatusCode417ExpectationFailed            :: EHTTPStatusCode417ExpectationFailed;
    k_EHTTPStatusCode4xxUnknown                      :: EHTTPStatusCode4xxUnknown;
    k_EHTTPStatusCode429TooManyRequests              :: EHTTPStatusCode429TooManyRequests;
    k_EHTTPStatusCode444ConnectionClosed             :: EHTTPStatusCode444ConnectionClosed;

    k_EHTTPStatusCode500InternalServerError          :: EHTTPStatusCode500InternalServerError;
    k_EHTTPStatusCode501NotImplemented               :: EHTTPStatusCode501NotImplemented;
    k_EHTTPStatusCode502BadGateway                   :: EHTTPStatusCode502BadGateway;
    k_EHTTPStatusCode503ServiceUnavailable           :: EHTTPStatusCode503ServiceUnavailable;
    k_EHTTPStatusCode504GatewayTimeout               :: EHTTPStatusCode504GatewayTimeout;
    k_EHTTPStatusCode505HTTPVersionNotSupported      :: EHTTPStatusCode505HTTPVersionNotSupported;
    k_EHTTPStatusCode5xxUnknown                      :: EHTTPStatusCode5xxUnknown;
}

// Handle to a HTTP Request handle
HTTPRequestHandle :: uint32;

HTTPCookieContainerHandle :: uint32;

//-----------------------------------------------------------------------------
// Purpose: interface to http client
//-----------------------------------------------------------------------------
ISteamHTTP :: struct {
    vtable: *ISteamHTTP_VTable;
}
ISteamHTTP_VTable :: struct #type_info_none {
    CreateHTTPRequest: (this: *ISteamHTTP, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *u8) -> HTTPRequestHandle #cpp_method;

    SetHTTPRequestContextValue: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool #cpp_method;

    SetHTTPRequestNetworkActivityTimeout: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool #cpp_method;

    SetHTTPRequestHeaderValue: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, pchHeaderValue: *u8) -> bool #cpp_method;

    SetHTTPRequestGetOrPostParameter: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchParamName: *u8, pchParamValue: *u8) -> bool #cpp_method;

    SendHTTPRequest: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #cpp_method;

    SendHTTPRequestAndStreamResponse: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #cpp_method;

    DeferHTTPRequest: (this: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #cpp_method;

    PrioritizeHTTPRequest: (this: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #cpp_method;

    GetHTTPResponseHeaderSize: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, unResponseHeaderSize: *uint32) -> bool #cpp_method;

    GetHTTPResponseHeaderValue: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool #cpp_method;

    GetHTTPResponseBodySize: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool #cpp_method;

    GetHTTPResponseBodyData: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #cpp_method;

    GetHTTPStreamingResponseBodyData: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #cpp_method;

    ReleaseHTTPRequest: (this: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #cpp_method;

    GetHTTPDownloadProgressPct: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool #cpp_method;

    SetHTTPRequestRawPostBody: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchContentType: *u8, pubBody: *uint8, unBodyLen: uint32) -> bool #cpp_method;

    CreateCookieContainer: (this: *ISteamHTTP, bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle #cpp_method;

    ReleaseCookieContainer: (this: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle) -> bool #cpp_method;

    SetCookie: (this: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle, pchHost: *u8, pchUrl: *u8, pchCookie: *u8) -> bool #cpp_method;

    SetHTTPRequestCookieContainer: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool #cpp_method;

    SetHTTPRequestUserAgentInfo: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchUserAgentInfo: *u8) -> bool #cpp_method;

    SetHTTPRequestRequiresVerifiedCertificate: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool #cpp_method;

    SetHTTPRequestAbsoluteTimeoutMS: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool #cpp_method;

    GetHTTPRequestWasTimedOut: (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool #cpp_method;
}

ISteamHTTP_CreateHTTPRequest :: inline (this: *ISteamHTTP, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *u8) -> HTTPRequestHandle { return this.vtable.CreateHTTPRequest(this, eHTTPRequestMethod, pchAbsoluteURL); }

ISteamHTTP_SetHTTPRequestContextValue :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool { return this.vtable.SetHTTPRequestContextValue(this, hRequest, ulContextValue); }

ISteamHTTP_SetHTTPRequestNetworkActivityTimeout :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool { return this.vtable.SetHTTPRequestNetworkActivityTimeout(this, hRequest, unTimeoutSeconds); }

ISteamHTTP_SetHTTPRequestHeaderValue :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, pchHeaderValue: *u8) -> bool { return this.vtable.SetHTTPRequestHeaderValue(this, hRequest, pchHeaderName, pchHeaderValue); }

ISteamHTTP_SetHTTPRequestGetOrPostParameter :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchParamName: *u8, pchParamValue: *u8) -> bool { return this.vtable.SetHTTPRequestGetOrPostParameter(this, hRequest, pchParamName, pchParamValue); }

ISteamHTTP_SendHTTPRequest :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool { return this.vtable.SendHTTPRequest(this, hRequest, pCallHandle); }

ISteamHTTP_SendHTTPRequestAndStreamResponse :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool { return this.vtable.SendHTTPRequestAndStreamResponse(this, hRequest, pCallHandle); }

ISteamHTTP_DeferHTTPRequest :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool { return this.vtable.DeferHTTPRequest(this, hRequest); }

ISteamHTTP_PrioritizeHTTPRequest :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool { return this.vtable.PrioritizeHTTPRequest(this, hRequest); }

ISteamHTTP_GetHTTPResponseHeaderSize :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, unResponseHeaderSize: *uint32) -> bool { return this.vtable.GetHTTPResponseHeaderSize(this, hRequest, pchHeaderName, unResponseHeaderSize); }

ISteamHTTP_GetHTTPResponseHeaderValue :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool { return this.vtable.GetHTTPResponseHeaderValue(this, hRequest, pchHeaderName, pHeaderValueBuffer, unBufferSize); }

ISteamHTTP_GetHTTPResponseBodySize :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool { return this.vtable.GetHTTPResponseBodySize(this, hRequest, unBodySize); }

ISteamHTTP_GetHTTPResponseBodyData :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool { return this.vtable.GetHTTPResponseBodyData(this, hRequest, pBodyDataBuffer, unBufferSize); }

ISteamHTTP_GetHTTPStreamingResponseBodyData :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool { return this.vtable.GetHTTPStreamingResponseBodyData(this, hRequest, cOffset, pBodyDataBuffer, unBufferSize); }

ISteamHTTP_ReleaseHTTPRequest :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool { return this.vtable.ReleaseHTTPRequest(this, hRequest); }

ISteamHTTP_GetHTTPDownloadProgressPct :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool { return this.vtable.GetHTTPDownloadProgressPct(this, hRequest, pflPercentOut); }

ISteamHTTP_SetHTTPRequestRawPostBody :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchContentType: *u8, pubBody: *uint8, unBodyLen: uint32) -> bool { return this.vtable.SetHTTPRequestRawPostBody(this, hRequest, pchContentType, pubBody, unBodyLen); }

ISteamHTTP_CreateCookieContainer :: inline (this: *ISteamHTTP, bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle { return this.vtable.CreateCookieContainer(this, bAllowResponsesToModify); }

ISteamHTTP_ReleaseCookieContainer :: inline (this: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle) -> bool { return this.vtable.ReleaseCookieContainer(this, hCookieContainer); }

ISteamHTTP_SetCookie :: inline (this: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle, pchHost: *u8, pchUrl: *u8, pchCookie: *u8) -> bool { return this.vtable.SetCookie(this, hCookieContainer, pchHost, pchUrl, pchCookie); }

ISteamHTTP_SetHTTPRequestCookieContainer :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool { return this.vtable.SetHTTPRequestCookieContainer(this, hRequest, hCookieContainer); }

ISteamHTTP_SetHTTPRequestUserAgentInfo :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pchUserAgentInfo: *u8) -> bool { return this.vtable.SetHTTPRequestUserAgentInfo(this, hRequest, pchUserAgentInfo); }

ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool { return this.vtable.SetHTTPRequestRequiresVerifiedCertificate(this, hRequest, bRequireVerifiedCertificate); }

ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool { return this.vtable.SetHTTPRequestAbsoluteTimeoutMS(this, hRequest, unMilliseconds); }

ISteamHTTP_GetHTTPRequestWasTimedOut :: inline (this: *ISteamHTTP, hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool { return this.vtable.GetHTTPRequestWasTimedOut(this, hRequest, pbWasTimedOut); }

vtable :: (obj: *ISteamHTTP) -> *ISteamHTTP_VTable { return obj.vtable; }


HTTPRequestCompleted_t :: struct {
    anon_enum_180 :: enum s32 {
        k_iCallback :: 2101;
    }

    // Handle value for the request that has completed.
    m_hRequest:           HTTPRequestHandle;

    // Context value that the user defined on the request that this callback is associated with, 0 if
    // no context value was set.
    m_ulContextValue:     uint64;

    // This will be true if we actually got any sort of response from the server (even an error).
    // It will be false if we failed due to an internal error or client side network failure.
    m_bRequestSuccessful: bool;

    // Will be the HTTP status code value returned by the server, k_EHTTPStatusCode200OK is the normal
    // OK response, if you get something else you probably need to treat it as a failure.
    m_eStatusCode:        EHTTPStatusCode;

    m_unBodySize:         uint32; // Same as GetHTTPResponseBodySize()
}

HTTPRequestHeadersReceived_t :: struct {
    anon_enum_181 :: enum s32 {
        k_iCallback :: 2102;
    }

    // Handle value for the request that has received headers.
    m_hRequest:       HTTPRequestHandle;

    // Context value that the user defined on the request that this callback is associated with, 0 if
    // no context value was set.
    m_ulContextValue: uint64;
}

HTTPRequestDataReceived_t :: struct {
    anon_enum_182 :: enum s32 {
        k_iCallback :: 2103;
    }

    // Handle value for the request that has received data.
    m_hRequest:       HTTPRequestHandle;

    // Context value that the user defined on the request that this callback is associated with, 0 if
    // no context value was set.
    m_ulContextValue: uint64;

    // Offset to provide to GetHTTPStreamingResponseBodyData to get this chunk of data
    m_cOffset:        uint32;

    // Size to provide to GetHTTPStreamingResponseBodyData to get this chunk of data
    m_cBytesReceived: uint32;
}

EInputSourceMode :: enum s32 {
    None           :: 0;
    Dpad           :: 1;
    Buttons        :: 2;
    FourButtons    :: 3;
    AbsoluteMouse  :: 4;
    RelativeMouse  :: 5;
    JoystickMove   :: 6;
    JoystickMouse  :: 7;
    JoystickCamera :: 8;
    ScrollWheel    :: 9;
    Trigger        :: 10;
    TouchMenu      :: 11;
    MouseJoystick  :: 12;
    MouseRegion    :: 13;
    RadialMenu     :: 14;
    SingleButton   :: 15;
    Switches       :: 16;

    k_EInputSourceMode_None           :: None;
    k_EInputSourceMode_Dpad           :: Dpad;
    k_EInputSourceMode_Buttons        :: Buttons;
    k_EInputSourceMode_FourButtons    :: FourButtons;
    k_EInputSourceMode_AbsoluteMouse  :: AbsoluteMouse;
    k_EInputSourceMode_RelativeMouse  :: RelativeMouse;
    k_EInputSourceMode_JoystickMove   :: JoystickMove;
    k_EInputSourceMode_JoystickMouse  :: JoystickMouse;
    k_EInputSourceMode_JoystickCamera :: JoystickCamera;
    k_EInputSourceMode_ScrollWheel    :: ScrollWheel;
    k_EInputSourceMode_Trigger        :: Trigger;
    k_EInputSourceMode_TouchMenu      :: TouchMenu;
    k_EInputSourceMode_MouseJoystick  :: MouseJoystick;
    k_EInputSourceMode_MouseRegion    :: MouseRegion;
    k_EInputSourceMode_RadialMenu     :: RadialMenu;
    k_EInputSourceMode_SingleButton   :: SingleButton;
    k_EInputSourceMode_Switches       :: Switches;
}

// Note: Please do not use action origins as a way to identify controller types. There is no
// guarantee that they will be added in a contiguous manner - use GetInputTypeForHandle instead.
// Versions of Steam that add new controller types in the future will extend this enum so if you're
// using a lookup table please check the bounds of any origins returned by Steam.
EInputActionOrigin :: enum s32 {
    None                                :: 0;
    SteamController_A                   :: 1;
    SteamController_B                   :: 2;
    SteamController_X                   :: 3;
    SteamController_Y                   :: 4;
    SteamController_LeftBumper          :: 5;
    SteamController_RightBumper         :: 6;
    SteamController_LeftGrip            :: 7;
    SteamController_RightGrip           :: 8;
    SteamController_Start               :: 9;
    SteamController_Back                :: 10;
    SteamController_LeftPad_Touch       :: 11;
    SteamController_LeftPad_Swipe       :: 12;
    SteamController_LeftPad_Click       :: 13;
    SteamController_LeftPad_DPadNorth   :: 14;
    SteamController_LeftPad_DPadSouth   :: 15;
    SteamController_LeftPad_DPadWest    :: 16;
    SteamController_LeftPad_DPadEast    :: 17;
    SteamController_RightPad_Touch      :: 18;
    SteamController_RightPad_Swipe      :: 19;
    SteamController_RightPad_Click      :: 20;
    SteamController_RightPad_DPadNorth  :: 21;
    SteamController_RightPad_DPadSouth  :: 22;
    SteamController_RightPad_DPadWest   :: 23;
    SteamController_RightPad_DPadEast   :: 24;
    SteamController_LeftTrigger_Pull    :: 25;
    SteamController_LeftTrigger_Click   :: 26;
    SteamController_RightTrigger_Pull   :: 27;
    SteamController_RightTrigger_Click  :: 28;
    SteamController_LeftStick_Move      :: 29;
    SteamController_LeftStick_Click     :: 30;
    SteamController_LeftStick_DPadNorth :: 31;
    SteamController_LeftStick_DPadSouth :: 32;
    SteamController_LeftStick_DPadWest  :: 33;
    SteamController_LeftStick_DPadEast  :: 34;
    SteamController_Gyro_Move           :: 35;
    SteamController_Gyro_Pitch          :: 36;
    SteamController_Gyro_Yaw            :: 37;
    SteamController_Gyro_Roll           :: 38;
    SteamController_Reserved0           :: 39;
    SteamController_Reserved1           :: 40;
    SteamController_Reserved2           :: 41;
    SteamController_Reserved3           :: 42;
    SteamController_Reserved4           :: 43;
    SteamController_Reserved5           :: 44;
    SteamController_Reserved6           :: 45;
    SteamController_Reserved7           :: 46;
    SteamController_Reserved8           :: 47;
    SteamController_Reserved9           :: 48;
    SteamController_Reserved10          :: 49;

    PS4_X                               :: 50;
    PS4_Circle                          :: 51;
    PS4_Triangle                        :: 52;
    PS4_Square                          :: 53;
    PS4_LeftBumper                      :: 54;
    PS4_RightBumper                     :: 55;
    PS4_Options                         :: 56;
    PS4_Share                           :: 57;
    PS4_LeftPad_Touch                   :: 58;
    PS4_LeftPad_Swipe                   :: 59;
    PS4_LeftPad_Click                   :: 60;
    PS4_LeftPad_DPadNorth               :: 61;
    PS4_LeftPad_DPadSouth               :: 62;
    PS4_LeftPad_DPadWest                :: 63;
    PS4_LeftPad_DPadEast                :: 64;
    PS4_RightPad_Touch                  :: 65;
    PS4_RightPad_Swipe                  :: 66;
    PS4_RightPad_Click                  :: 67;
    PS4_RightPad_DPadNorth              :: 68;
    PS4_RightPad_DPadSouth              :: 69;
    PS4_RightPad_DPadWest               :: 70;
    PS4_RightPad_DPadEast               :: 71;
    PS4_CenterPad_Touch                 :: 72;
    PS4_CenterPad_Swipe                 :: 73;
    PS4_CenterPad_Click                 :: 74;
    PS4_CenterPad_DPadNorth             :: 75;
    PS4_CenterPad_DPadSouth             :: 76;
    PS4_CenterPad_DPadWest              :: 77;
    PS4_CenterPad_DPadEast              :: 78;
    PS4_LeftTrigger_Pull                :: 79;
    PS4_LeftTrigger_Click               :: 80;
    PS4_RightTrigger_Pull               :: 81;
    PS4_RightTrigger_Click              :: 82;
    PS4_LeftStick_Move                  :: 83;
    PS4_LeftStick_Click                 :: 84;
    PS4_LeftStick_DPadNorth             :: 85;
    PS4_LeftStick_DPadSouth             :: 86;
    PS4_LeftStick_DPadWest              :: 87;
    PS4_LeftStick_DPadEast              :: 88;
    PS4_RightStick_Move                 :: 89;
    PS4_RightStick_Click                :: 90;
    PS4_RightStick_DPadNorth            :: 91;
    PS4_RightStick_DPadSouth            :: 92;
    PS4_RightStick_DPadWest             :: 93;
    PS4_RightStick_DPadEast             :: 94;
    PS4_DPad_North                      :: 95;
    PS4_DPad_South                      :: 96;
    PS4_DPad_West                       :: 97;
    PS4_DPad_East                       :: 98;
    PS4_Gyro_Move                       :: 99;
    PS4_Gyro_Pitch                      :: 100;
    PS4_Gyro_Yaw                        :: 101;
    PS4_Gyro_Roll                       :: 102;
    PS4_DPad_Move                       :: 103;
    PS4_Reserved1                       :: 104;
    PS4_Reserved2                       :: 105;
    PS4_Reserved3                       :: 106;
    PS4_Reserved4                       :: 107;
    PS4_Reserved5                       :: 108;
    PS4_Reserved6                       :: 109;
    PS4_Reserved7                       :: 110;
    PS4_Reserved8                       :: 111;
    PS4_Reserved9                       :: 112;
    PS4_Reserved10                      :: 113;

    XBoxOne_A                           :: 114;
    XBoxOne_B                           :: 115;
    XBoxOne_X                           :: 116;
    XBoxOne_Y                           :: 117;
    XBoxOne_LeftBumper                  :: 118;
    XBoxOne_RightBumper                 :: 119;
    XBoxOne_Menu                        :: 120;
    XBoxOne_View                        :: 121;
    XBoxOne_LeftTrigger_Pull            :: 122;
    XBoxOne_LeftTrigger_Click           :: 123;
    XBoxOne_RightTrigger_Pull           :: 124;
    XBoxOne_RightTrigger_Click          :: 125;
    XBoxOne_LeftStick_Move              :: 126;
    XBoxOne_LeftStick_Click             :: 127;
    XBoxOne_LeftStick_DPadNorth         :: 128;
    XBoxOne_LeftStick_DPadSouth         :: 129;
    XBoxOne_LeftStick_DPadWest          :: 130;
    XBoxOne_LeftStick_DPadEast          :: 131;
    XBoxOne_RightStick_Move             :: 132;
    XBoxOne_RightStick_Click            :: 133;
    XBoxOne_RightStick_DPadNorth        :: 134;
    XBoxOne_RightStick_DPadSouth        :: 135;
    XBoxOne_RightStick_DPadWest         :: 136;
    XBoxOne_RightStick_DPadEast         :: 137;
    XBoxOne_DPad_North                  :: 138;
    XBoxOne_DPad_South                  :: 139;
    XBoxOne_DPad_West                   :: 140;
    XBoxOne_DPad_East                   :: 141;
    XBoxOne_DPad_Move                   :: 142;
    XBoxOne_LeftGrip_Lower              :: 143;
    XBoxOne_LeftGrip_Upper              :: 144;
    XBoxOne_RightGrip_Lower             :: 145;
    XBoxOne_RightGrip_Upper             :: 146;
    XBoxOne_Share                       :: 147;
    XBoxOne_Reserved6                   :: 148;
    XBoxOne_Reserved7                   :: 149;
    XBoxOne_Reserved8                   :: 150;
    XBoxOne_Reserved9                   :: 151;
    XBoxOne_Reserved10                  :: 152;

    XBox360_A                           :: 153;
    XBox360_B                           :: 154;
    XBox360_X                           :: 155;
    XBox360_Y                           :: 156;
    XBox360_LeftBumper                  :: 157;
    XBox360_RightBumper                 :: 158;
    XBox360_Start                       :: 159;
    XBox360_Back                        :: 160;
    XBox360_LeftTrigger_Pull            :: 161;
    XBox360_LeftTrigger_Click           :: 162;
    XBox360_RightTrigger_Pull           :: 163;
    XBox360_RightTrigger_Click          :: 164;
    XBox360_LeftStick_Move              :: 165;
    XBox360_LeftStick_Click             :: 166;
    XBox360_LeftStick_DPadNorth         :: 167;
    XBox360_LeftStick_DPadSouth         :: 168;
    XBox360_LeftStick_DPadWest          :: 169;
    XBox360_LeftStick_DPadEast          :: 170;
    XBox360_RightStick_Move             :: 171;
    XBox360_RightStick_Click            :: 172;
    XBox360_RightStick_DPadNorth        :: 173;
    XBox360_RightStick_DPadSouth        :: 174;
    XBox360_RightStick_DPadWest         :: 175;
    XBox360_RightStick_DPadEast         :: 176;
    XBox360_DPad_North                  :: 177;
    XBox360_DPad_South                  :: 178;
    XBox360_DPad_West                   :: 179;
    XBox360_DPad_East                   :: 180;
    XBox360_DPad_Move                   :: 181;
    XBox360_Reserved1                   :: 182;
    XBox360_Reserved2                   :: 183;
    XBox360_Reserved3                   :: 184;
    XBox360_Reserved4                   :: 185;
    XBox360_Reserved5                   :: 186;
    XBox360_Reserved6                   :: 187;
    XBox360_Reserved7                   :: 188;
    XBox360_Reserved8                   :: 189;
    XBox360_Reserved9                   :: 190;
    XBox360_Reserved10                  :: 191;

    Switch_A                            :: 192;
    Switch_B                            :: 193;
    Switch_X                            :: 194;
    Switch_Y                            :: 195;
    Switch_LeftBumper                   :: 196;
    Switch_RightBumper                  :: 197;
    Switch_Plus                         :: 198;
    Switch_Minus                        :: 199;
    Switch_Capture                      :: 200;
    Switch_LeftTrigger_Pull             :: 201;
    Switch_LeftTrigger_Click            :: 202;
    Switch_RightTrigger_Pull            :: 203;
    Switch_RightTrigger_Click           :: 204;
    Switch_LeftStick_Move               :: 205;
    Switch_LeftStick_Click              :: 206;
    Switch_LeftStick_DPadNorth          :: 207;
    Switch_LeftStick_DPadSouth          :: 208;
    Switch_LeftStick_DPadWest           :: 209;
    Switch_LeftStick_DPadEast           :: 210;
    Switch_RightStick_Move              :: 211;
    Switch_RightStick_Click             :: 212;
    Switch_RightStick_DPadNorth         :: 213;
    Switch_RightStick_DPadSouth         :: 214;
    Switch_RightStick_DPadWest          :: 215;
    Switch_RightStick_DPadEast          :: 216;
    Switch_DPad_North                   :: 217;
    Switch_DPad_South                   :: 218;
    Switch_DPad_West                    :: 219;
    Switch_DPad_East                    :: 220;
    Switch_ProGyro_Move                 :: 221;
    Switch_ProGyro_Pitch                :: 222;
    Switch_ProGyro_Yaw                  :: 223;
    Switch_ProGyro_Roll                 :: 224;
    Switch_DPad_Move                    :: 225;
    Switch_Reserved1                    :: 226;
    Switch_Reserved2                    :: 227;
    Switch_Reserved3                    :: 228;
    Switch_Reserved4                    :: 229;
    Switch_Reserved5                    :: 230;
    Switch_Reserved6                    :: 231;
    Switch_Reserved7                    :: 232;
    Switch_Reserved8                    :: 233;
    Switch_Reserved9                    :: 234;
    Switch_Reserved10                   :: 235;

    Switch_RightGyro_Move               :: 236;
    Switch_RightGyro_Pitch              :: 237;
    Switch_RightGyro_Yaw                :: 238;
    Switch_RightGyro_Roll               :: 239;
    Switch_LeftGyro_Move                :: 240;
    Switch_LeftGyro_Pitch               :: 241;
    Switch_LeftGyro_Yaw                 :: 242;
    Switch_LeftGyro_Roll                :: 243;
    Switch_LeftGrip_Lower               :: 244;
    Switch_LeftGrip_Upper               :: 245;
    Switch_RightGrip_Lower              :: 246;
    Switch_RightGrip_Upper              :: 247;
    Switch_JoyConButton_N               :: 248;
    Switch_JoyConButton_E               :: 249;
    Switch_JoyConButton_S               :: 250;
    Switch_JoyConButton_W               :: 251;
    Switch_Reserved15                   :: 252;
    Switch_Reserved16                   :: 253;
    Switch_Reserved17                   :: 254;
    Switch_Reserved18                   :: 255;
    Switch_Reserved19                   :: 256;
    Switch_Reserved20                   :: 257;

    PS5_X                               :: 258;
    PS5_Circle                          :: 259;
    PS5_Triangle                        :: 260;
    PS5_Square                          :: 261;
    PS5_LeftBumper                      :: 262;
    PS5_RightBumper                     :: 263;
    PS5_Option                          :: 264;
    PS5_Create                          :: 265;
    PS5_Mute                            :: 266;
    PS5_LeftPad_Touch                   :: 267;
    PS5_LeftPad_Swipe                   :: 268;
    PS5_LeftPad_Click                   :: 269;
    PS5_LeftPad_DPadNorth               :: 270;
    PS5_LeftPad_DPadSouth               :: 271;
    PS5_LeftPad_DPadWest                :: 272;
    PS5_LeftPad_DPadEast                :: 273;
    PS5_RightPad_Touch                  :: 274;
    PS5_RightPad_Swipe                  :: 275;
    PS5_RightPad_Click                  :: 276;
    PS5_RightPad_DPadNorth              :: 277;
    PS5_RightPad_DPadSouth              :: 278;
    PS5_RightPad_DPadWest               :: 279;
    PS5_RightPad_DPadEast               :: 280;
    PS5_CenterPad_Touch                 :: 281;
    PS5_CenterPad_Swipe                 :: 282;
    PS5_CenterPad_Click                 :: 283;
    PS5_CenterPad_DPadNorth             :: 284;
    PS5_CenterPad_DPadSouth             :: 285;
    PS5_CenterPad_DPadWest              :: 286;
    PS5_CenterPad_DPadEast              :: 287;
    PS5_LeftTrigger_Pull                :: 288;
    PS5_LeftTrigger_Click               :: 289;
    PS5_RightTrigger_Pull               :: 290;
    PS5_RightTrigger_Click              :: 291;
    PS5_LeftStick_Move                  :: 292;
    PS5_LeftStick_Click                 :: 293;
    PS5_LeftStick_DPadNorth             :: 294;
    PS5_LeftStick_DPadSouth             :: 295;
    PS5_LeftStick_DPadWest              :: 296;
    PS5_LeftStick_DPadEast              :: 297;
    PS5_RightStick_Move                 :: 298;
    PS5_RightStick_Click                :: 299;
    PS5_RightStick_DPadNorth            :: 300;
    PS5_RightStick_DPadSouth            :: 301;
    PS5_RightStick_DPadWest             :: 302;
    PS5_RightStick_DPadEast             :: 303;
    PS5_DPad_North                      :: 304;
    PS5_DPad_South                      :: 305;
    PS5_DPad_West                       :: 306;
    PS5_DPad_East                       :: 307;
    PS5_Gyro_Move                       :: 308;
    PS5_Gyro_Pitch                      :: 309;
    PS5_Gyro_Yaw                        :: 310;
    PS5_Gyro_Roll                       :: 311;
    PS5_DPad_Move                       :: 312;
    PS5_LeftGrip                        :: 313;
    PS5_RightGrip                       :: 314;
    PS5_LeftFn                          :: 315;
    PS5_RightFn                         :: 316;
    PS5_Reserved5                       :: 317;
    PS5_Reserved6                       :: 318;
    PS5_Reserved7                       :: 319;
    PS5_Reserved8                       :: 320;
    PS5_Reserved9                       :: 321;
    PS5_Reserved10                      :: 322;
    PS5_Reserved11                      :: 323;
    PS5_Reserved12                      :: 324;
    PS5_Reserved13                      :: 325;
    PS5_Reserved14                      :: 326;
    PS5_Reserved15                      :: 327;
    PS5_Reserved16                      :: 328;
    PS5_Reserved17                      :: 329;
    PS5_Reserved18                      :: 330;
    PS5_Reserved19                      :: 331;
    PS5_Reserved20                      :: 332;

    SteamDeck_A                         :: 333;
    SteamDeck_B                         :: 334;
    SteamDeck_X                         :: 335;
    SteamDeck_Y                         :: 336;
    SteamDeck_L1                        :: 337;
    SteamDeck_R1                        :: 338;
    SteamDeck_Menu                      :: 339;
    SteamDeck_View                      :: 340;
    SteamDeck_LeftPad_Touch             :: 341;
    SteamDeck_LeftPad_Swipe             :: 342;
    SteamDeck_LeftPad_Click             :: 343;
    SteamDeck_LeftPad_DPadNorth         :: 344;
    SteamDeck_LeftPad_DPadSouth         :: 345;
    SteamDeck_LeftPad_DPadWest          :: 346;
    SteamDeck_LeftPad_DPadEast          :: 347;
    SteamDeck_RightPad_Touch            :: 348;
    SteamDeck_RightPad_Swipe            :: 349;
    SteamDeck_RightPad_Click            :: 350;
    SteamDeck_RightPad_DPadNorth        :: 351;
    SteamDeck_RightPad_DPadSouth        :: 352;
    SteamDeck_RightPad_DPadWest         :: 353;
    SteamDeck_RightPad_DPadEast         :: 354;
    SteamDeck_L2_SoftPull               :: 355;
    SteamDeck_L2                        :: 356;
    SteamDeck_R2_SoftPull               :: 357;
    SteamDeck_R2                        :: 358;
    SteamDeck_LeftStick_Move            :: 359;
    SteamDeck_L3                        :: 360;
    SteamDeck_LeftStick_DPadNorth       :: 361;
    SteamDeck_LeftStick_DPadSouth       :: 362;
    SteamDeck_LeftStick_DPadWest        :: 363;
    SteamDeck_LeftStick_DPadEast        :: 364;
    SteamDeck_LeftStick_Touch           :: 365;
    SteamDeck_RightStick_Move           :: 366;
    SteamDeck_R3                        :: 367;
    SteamDeck_RightStick_DPadNorth      :: 368;
    SteamDeck_RightStick_DPadSouth      :: 369;
    SteamDeck_RightStick_DPadWest       :: 370;
    SteamDeck_RightStick_DPadEast       :: 371;
    SteamDeck_RightStick_Touch          :: 372;
    SteamDeck_L4                        :: 373;
    SteamDeck_R4                        :: 374;
    SteamDeck_L5                        :: 375;
    SteamDeck_R5                        :: 376;
    SteamDeck_DPad_Move                 :: 377;
    SteamDeck_DPad_North                :: 378;
    SteamDeck_DPad_South                :: 379;
    SteamDeck_DPad_West                 :: 380;
    SteamDeck_DPad_East                 :: 381;
    SteamDeck_Gyro_Move                 :: 382;
    SteamDeck_Gyro_Pitch                :: 383;
    SteamDeck_Gyro_Yaw                  :: 384;
    SteamDeck_Gyro_Roll                 :: 385;
    SteamDeck_Reserved1                 :: 386;
    SteamDeck_Reserved2                 :: 387;
    SteamDeck_Reserved3                 :: 388;
    SteamDeck_Reserved4                 :: 389;
    SteamDeck_Reserved5                 :: 390;
    SteamDeck_Reserved6                 :: 391;
    SteamDeck_Reserved7                 :: 392;
    SteamDeck_Reserved8                 :: 393;
    SteamDeck_Reserved9                 :: 394;
    SteamDeck_Reserved10                :: 395;
    SteamDeck_Reserved11                :: 396;
    SteamDeck_Reserved12                :: 397;
    SteamDeck_Reserved13                :: 398;
    SteamDeck_Reserved14                :: 399;
    SteamDeck_Reserved15                :: 400;
    SteamDeck_Reserved16                :: 401;
    SteamDeck_Reserved17                :: 402;
    SteamDeck_Reserved18                :: 403;
    SteamDeck_Reserved19                :: 404;
    SteamDeck_Reserved20                :: 405;

    Count                               :: 406;
    MaximumPossibleValue                :: 32767;

    k_EInputActionOrigin_None                                :: None;
    k_EInputActionOrigin_SteamController_A                   :: SteamController_A;
    k_EInputActionOrigin_SteamController_B                   :: SteamController_B;
    k_EInputActionOrigin_SteamController_X                   :: SteamController_X;
    k_EInputActionOrigin_SteamController_Y                   :: SteamController_Y;
    k_EInputActionOrigin_SteamController_LeftBumper          :: SteamController_LeftBumper;
    k_EInputActionOrigin_SteamController_RightBumper         :: SteamController_RightBumper;
    k_EInputActionOrigin_SteamController_LeftGrip            :: SteamController_LeftGrip;
    k_EInputActionOrigin_SteamController_RightGrip           :: SteamController_RightGrip;
    k_EInputActionOrigin_SteamController_Start               :: SteamController_Start;
    k_EInputActionOrigin_SteamController_Back                :: SteamController_Back;
    k_EInputActionOrigin_SteamController_LeftPad_Touch       :: SteamController_LeftPad_Touch;
    k_EInputActionOrigin_SteamController_LeftPad_Swipe       :: SteamController_LeftPad_Swipe;
    k_EInputActionOrigin_SteamController_LeftPad_Click       :: SteamController_LeftPad_Click;
    k_EInputActionOrigin_SteamController_LeftPad_DPadNorth   :: SteamController_LeftPad_DPadNorth;
    k_EInputActionOrigin_SteamController_LeftPad_DPadSouth   :: SteamController_LeftPad_DPadSouth;
    k_EInputActionOrigin_SteamController_LeftPad_DPadWest    :: SteamController_LeftPad_DPadWest;
    k_EInputActionOrigin_SteamController_LeftPad_DPadEast    :: SteamController_LeftPad_DPadEast;
    k_EInputActionOrigin_SteamController_RightPad_Touch      :: SteamController_RightPad_Touch;
    k_EInputActionOrigin_SteamController_RightPad_Swipe      :: SteamController_RightPad_Swipe;
    k_EInputActionOrigin_SteamController_RightPad_Click      :: SteamController_RightPad_Click;
    k_EInputActionOrigin_SteamController_RightPad_DPadNorth  :: SteamController_RightPad_DPadNorth;
    k_EInputActionOrigin_SteamController_RightPad_DPadSouth  :: SteamController_RightPad_DPadSouth;
    k_EInputActionOrigin_SteamController_RightPad_DPadWest   :: SteamController_RightPad_DPadWest;
    k_EInputActionOrigin_SteamController_RightPad_DPadEast   :: SteamController_RightPad_DPadEast;
    k_EInputActionOrigin_SteamController_LeftTrigger_Pull    :: SteamController_LeftTrigger_Pull;
    k_EInputActionOrigin_SteamController_LeftTrigger_Click   :: SteamController_LeftTrigger_Click;
    k_EInputActionOrigin_SteamController_RightTrigger_Pull   :: SteamController_RightTrigger_Pull;
    k_EInputActionOrigin_SteamController_RightTrigger_Click  :: SteamController_RightTrigger_Click;
    k_EInputActionOrigin_SteamController_LeftStick_Move      :: SteamController_LeftStick_Move;
    k_EInputActionOrigin_SteamController_LeftStick_Click     :: SteamController_LeftStick_Click;
    k_EInputActionOrigin_SteamController_LeftStick_DPadNorth :: SteamController_LeftStick_DPadNorth;
    k_EInputActionOrigin_SteamController_LeftStick_DPadSouth :: SteamController_LeftStick_DPadSouth;
    k_EInputActionOrigin_SteamController_LeftStick_DPadWest  :: SteamController_LeftStick_DPadWest;
    k_EInputActionOrigin_SteamController_LeftStick_DPadEast  :: SteamController_LeftStick_DPadEast;
    k_EInputActionOrigin_SteamController_Gyro_Move           :: SteamController_Gyro_Move;
    k_EInputActionOrigin_SteamController_Gyro_Pitch          :: SteamController_Gyro_Pitch;
    k_EInputActionOrigin_SteamController_Gyro_Yaw            :: SteamController_Gyro_Yaw;
    k_EInputActionOrigin_SteamController_Gyro_Roll           :: SteamController_Gyro_Roll;
    k_EInputActionOrigin_SteamController_Reserved0           :: SteamController_Reserved0;
    k_EInputActionOrigin_SteamController_Reserved1           :: SteamController_Reserved1;
    k_EInputActionOrigin_SteamController_Reserved2           :: SteamController_Reserved2;
    k_EInputActionOrigin_SteamController_Reserved3           :: SteamController_Reserved3;
    k_EInputActionOrigin_SteamController_Reserved4           :: SteamController_Reserved4;
    k_EInputActionOrigin_SteamController_Reserved5           :: SteamController_Reserved5;
    k_EInputActionOrigin_SteamController_Reserved6           :: SteamController_Reserved6;
    k_EInputActionOrigin_SteamController_Reserved7           :: SteamController_Reserved7;
    k_EInputActionOrigin_SteamController_Reserved8           :: SteamController_Reserved8;
    k_EInputActionOrigin_SteamController_Reserved9           :: SteamController_Reserved9;
    k_EInputActionOrigin_SteamController_Reserved10          :: SteamController_Reserved10;

    k_EInputActionOrigin_PS4_X                               :: PS4_X;
    k_EInputActionOrigin_PS4_Circle                          :: PS4_Circle;
    k_EInputActionOrigin_PS4_Triangle                        :: PS4_Triangle;
    k_EInputActionOrigin_PS4_Square                          :: PS4_Square;
    k_EInputActionOrigin_PS4_LeftBumper                      :: PS4_LeftBumper;
    k_EInputActionOrigin_PS4_RightBumper                     :: PS4_RightBumper;
    k_EInputActionOrigin_PS4_Options                         :: PS4_Options;
    k_EInputActionOrigin_PS4_Share                           :: PS4_Share;
    k_EInputActionOrigin_PS4_LeftPad_Touch                   :: PS4_LeftPad_Touch;
    k_EInputActionOrigin_PS4_LeftPad_Swipe                   :: PS4_LeftPad_Swipe;
    k_EInputActionOrigin_PS4_LeftPad_Click                   :: PS4_LeftPad_Click;
    k_EInputActionOrigin_PS4_LeftPad_DPadNorth               :: PS4_LeftPad_DPadNorth;
    k_EInputActionOrigin_PS4_LeftPad_DPadSouth               :: PS4_LeftPad_DPadSouth;
    k_EInputActionOrigin_PS4_LeftPad_DPadWest                :: PS4_LeftPad_DPadWest;
    k_EInputActionOrigin_PS4_LeftPad_DPadEast                :: PS4_LeftPad_DPadEast;
    k_EInputActionOrigin_PS4_RightPad_Touch                  :: PS4_RightPad_Touch;
    k_EInputActionOrigin_PS4_RightPad_Swipe                  :: PS4_RightPad_Swipe;
    k_EInputActionOrigin_PS4_RightPad_Click                  :: PS4_RightPad_Click;
    k_EInputActionOrigin_PS4_RightPad_DPadNorth              :: PS4_RightPad_DPadNorth;
    k_EInputActionOrigin_PS4_RightPad_DPadSouth              :: PS4_RightPad_DPadSouth;
    k_EInputActionOrigin_PS4_RightPad_DPadWest               :: PS4_RightPad_DPadWest;
    k_EInputActionOrigin_PS4_RightPad_DPadEast               :: PS4_RightPad_DPadEast;
    k_EInputActionOrigin_PS4_CenterPad_Touch                 :: PS4_CenterPad_Touch;
    k_EInputActionOrigin_PS4_CenterPad_Swipe                 :: PS4_CenterPad_Swipe;
    k_EInputActionOrigin_PS4_CenterPad_Click                 :: PS4_CenterPad_Click;
    k_EInputActionOrigin_PS4_CenterPad_DPadNorth             :: PS4_CenterPad_DPadNorth;
    k_EInputActionOrigin_PS4_CenterPad_DPadSouth             :: PS4_CenterPad_DPadSouth;
    k_EInputActionOrigin_PS4_CenterPad_DPadWest              :: PS4_CenterPad_DPadWest;
    k_EInputActionOrigin_PS4_CenterPad_DPadEast              :: PS4_CenterPad_DPadEast;
    k_EInputActionOrigin_PS4_LeftTrigger_Pull                :: PS4_LeftTrigger_Pull;
    k_EInputActionOrigin_PS4_LeftTrigger_Click               :: PS4_LeftTrigger_Click;
    k_EInputActionOrigin_PS4_RightTrigger_Pull               :: PS4_RightTrigger_Pull;
    k_EInputActionOrigin_PS4_RightTrigger_Click              :: PS4_RightTrigger_Click;
    k_EInputActionOrigin_PS4_LeftStick_Move                  :: PS4_LeftStick_Move;
    k_EInputActionOrigin_PS4_LeftStick_Click                 :: PS4_LeftStick_Click;
    k_EInputActionOrigin_PS4_LeftStick_DPadNorth             :: PS4_LeftStick_DPadNorth;
    k_EInputActionOrigin_PS4_LeftStick_DPadSouth             :: PS4_LeftStick_DPadSouth;
    k_EInputActionOrigin_PS4_LeftStick_DPadWest              :: PS4_LeftStick_DPadWest;
    k_EInputActionOrigin_PS4_LeftStick_DPadEast              :: PS4_LeftStick_DPadEast;
    k_EInputActionOrigin_PS4_RightStick_Move                 :: PS4_RightStick_Move;
    k_EInputActionOrigin_PS4_RightStick_Click                :: PS4_RightStick_Click;
    k_EInputActionOrigin_PS4_RightStick_DPadNorth            :: PS4_RightStick_DPadNorth;
    k_EInputActionOrigin_PS4_RightStick_DPadSouth            :: PS4_RightStick_DPadSouth;
    k_EInputActionOrigin_PS4_RightStick_DPadWest             :: PS4_RightStick_DPadWest;
    k_EInputActionOrigin_PS4_RightStick_DPadEast             :: PS4_RightStick_DPadEast;
    k_EInputActionOrigin_PS4_DPad_North                      :: PS4_DPad_North;
    k_EInputActionOrigin_PS4_DPad_South                      :: PS4_DPad_South;
    k_EInputActionOrigin_PS4_DPad_West                       :: PS4_DPad_West;
    k_EInputActionOrigin_PS4_DPad_East                       :: PS4_DPad_East;
    k_EInputActionOrigin_PS4_Gyro_Move                       :: PS4_Gyro_Move;
    k_EInputActionOrigin_PS4_Gyro_Pitch                      :: PS4_Gyro_Pitch;
    k_EInputActionOrigin_PS4_Gyro_Yaw                        :: PS4_Gyro_Yaw;
    k_EInputActionOrigin_PS4_Gyro_Roll                       :: PS4_Gyro_Roll;
    k_EInputActionOrigin_PS4_DPad_Move                       :: PS4_DPad_Move;
    k_EInputActionOrigin_PS4_Reserved1                       :: PS4_Reserved1;
    k_EInputActionOrigin_PS4_Reserved2                       :: PS4_Reserved2;
    k_EInputActionOrigin_PS4_Reserved3                       :: PS4_Reserved3;
    k_EInputActionOrigin_PS4_Reserved4                       :: PS4_Reserved4;
    k_EInputActionOrigin_PS4_Reserved5                       :: PS4_Reserved5;
    k_EInputActionOrigin_PS4_Reserved6                       :: PS4_Reserved6;
    k_EInputActionOrigin_PS4_Reserved7                       :: PS4_Reserved7;
    k_EInputActionOrigin_PS4_Reserved8                       :: PS4_Reserved8;
    k_EInputActionOrigin_PS4_Reserved9                       :: PS4_Reserved9;
    k_EInputActionOrigin_PS4_Reserved10                      :: PS4_Reserved10;

    k_EInputActionOrigin_XBoxOne_A                           :: XBoxOne_A;
    k_EInputActionOrigin_XBoxOne_B                           :: XBoxOne_B;
    k_EInputActionOrigin_XBoxOne_X                           :: XBoxOne_X;
    k_EInputActionOrigin_XBoxOne_Y                           :: XBoxOne_Y;
    k_EInputActionOrigin_XBoxOne_LeftBumper                  :: XBoxOne_LeftBumper;
    k_EInputActionOrigin_XBoxOne_RightBumper                 :: XBoxOne_RightBumper;
    k_EInputActionOrigin_XBoxOne_Menu                        :: XBoxOne_Menu;
    k_EInputActionOrigin_XBoxOne_View                        :: XBoxOne_View;
    k_EInputActionOrigin_XBoxOne_LeftTrigger_Pull            :: XBoxOne_LeftTrigger_Pull;
    k_EInputActionOrigin_XBoxOne_LeftTrigger_Click           :: XBoxOne_LeftTrigger_Click;
    k_EInputActionOrigin_XBoxOne_RightTrigger_Pull           :: XBoxOne_RightTrigger_Pull;
    k_EInputActionOrigin_XBoxOne_RightTrigger_Click          :: XBoxOne_RightTrigger_Click;
    k_EInputActionOrigin_XBoxOne_LeftStick_Move              :: XBoxOne_LeftStick_Move;
    k_EInputActionOrigin_XBoxOne_LeftStick_Click             :: XBoxOne_LeftStick_Click;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadNorth         :: XBoxOne_LeftStick_DPadNorth;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadSouth         :: XBoxOne_LeftStick_DPadSouth;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadWest          :: XBoxOne_LeftStick_DPadWest;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadEast          :: XBoxOne_LeftStick_DPadEast;
    k_EInputActionOrigin_XBoxOne_RightStick_Move             :: XBoxOne_RightStick_Move;
    k_EInputActionOrigin_XBoxOne_RightStick_Click            :: XBoxOne_RightStick_Click;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadNorth        :: XBoxOne_RightStick_DPadNorth;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadSouth        :: XBoxOne_RightStick_DPadSouth;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadWest         :: XBoxOne_RightStick_DPadWest;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadEast         :: XBoxOne_RightStick_DPadEast;
    k_EInputActionOrigin_XBoxOne_DPad_North                  :: XBoxOne_DPad_North;
    k_EInputActionOrigin_XBoxOne_DPad_South                  :: XBoxOne_DPad_South;
    k_EInputActionOrigin_XBoxOne_DPad_West                   :: XBoxOne_DPad_West;
    k_EInputActionOrigin_XBoxOne_DPad_East                   :: XBoxOne_DPad_East;
    k_EInputActionOrigin_XBoxOne_DPad_Move                   :: XBoxOne_DPad_Move;
    k_EInputActionOrigin_XBoxOne_LeftGrip_Lower              :: XBoxOne_LeftGrip_Lower;
    k_EInputActionOrigin_XBoxOne_LeftGrip_Upper              :: XBoxOne_LeftGrip_Upper;
    k_EInputActionOrigin_XBoxOne_RightGrip_Lower             :: XBoxOne_RightGrip_Lower;
    k_EInputActionOrigin_XBoxOne_RightGrip_Upper             :: XBoxOne_RightGrip_Upper;
    k_EInputActionOrigin_XBoxOne_Share                       :: XBoxOne_Share;
    k_EInputActionOrigin_XBoxOne_Reserved6                   :: XBoxOne_Reserved6;
    k_EInputActionOrigin_XBoxOne_Reserved7                   :: XBoxOne_Reserved7;
    k_EInputActionOrigin_XBoxOne_Reserved8                   :: XBoxOne_Reserved8;
    k_EInputActionOrigin_XBoxOne_Reserved9                   :: XBoxOne_Reserved9;
    k_EInputActionOrigin_XBoxOne_Reserved10                  :: XBoxOne_Reserved10;

    k_EInputActionOrigin_XBox360_A                           :: XBox360_A;
    k_EInputActionOrigin_XBox360_B                           :: XBox360_B;
    k_EInputActionOrigin_XBox360_X                           :: XBox360_X;
    k_EInputActionOrigin_XBox360_Y                           :: XBox360_Y;
    k_EInputActionOrigin_XBox360_LeftBumper                  :: XBox360_LeftBumper;
    k_EInputActionOrigin_XBox360_RightBumper                 :: XBox360_RightBumper;
    k_EInputActionOrigin_XBox360_Start                       :: XBox360_Start;
    k_EInputActionOrigin_XBox360_Back                        :: XBox360_Back;
    k_EInputActionOrigin_XBox360_LeftTrigger_Pull            :: XBox360_LeftTrigger_Pull;
    k_EInputActionOrigin_XBox360_LeftTrigger_Click           :: XBox360_LeftTrigger_Click;
    k_EInputActionOrigin_XBox360_RightTrigger_Pull           :: XBox360_RightTrigger_Pull;
    k_EInputActionOrigin_XBox360_RightTrigger_Click          :: XBox360_RightTrigger_Click;
    k_EInputActionOrigin_XBox360_LeftStick_Move              :: XBox360_LeftStick_Move;
    k_EInputActionOrigin_XBox360_LeftStick_Click             :: XBox360_LeftStick_Click;
    k_EInputActionOrigin_XBox360_LeftStick_DPadNorth         :: XBox360_LeftStick_DPadNorth;
    k_EInputActionOrigin_XBox360_LeftStick_DPadSouth         :: XBox360_LeftStick_DPadSouth;
    k_EInputActionOrigin_XBox360_LeftStick_DPadWest          :: XBox360_LeftStick_DPadWest;
    k_EInputActionOrigin_XBox360_LeftStick_DPadEast          :: XBox360_LeftStick_DPadEast;
    k_EInputActionOrigin_XBox360_RightStick_Move             :: XBox360_RightStick_Move;
    k_EInputActionOrigin_XBox360_RightStick_Click            :: XBox360_RightStick_Click;
    k_EInputActionOrigin_XBox360_RightStick_DPadNorth        :: XBox360_RightStick_DPadNorth;
    k_EInputActionOrigin_XBox360_RightStick_DPadSouth        :: XBox360_RightStick_DPadSouth;
    k_EInputActionOrigin_XBox360_RightStick_DPadWest         :: XBox360_RightStick_DPadWest;
    k_EInputActionOrigin_XBox360_RightStick_DPadEast         :: XBox360_RightStick_DPadEast;
    k_EInputActionOrigin_XBox360_DPad_North                  :: XBox360_DPad_North;
    k_EInputActionOrigin_XBox360_DPad_South                  :: XBox360_DPad_South;
    k_EInputActionOrigin_XBox360_DPad_West                   :: XBox360_DPad_West;
    k_EInputActionOrigin_XBox360_DPad_East                   :: XBox360_DPad_East;
    k_EInputActionOrigin_XBox360_DPad_Move                   :: XBox360_DPad_Move;
    k_EInputActionOrigin_XBox360_Reserved1                   :: XBox360_Reserved1;
    k_EInputActionOrigin_XBox360_Reserved2                   :: XBox360_Reserved2;
    k_EInputActionOrigin_XBox360_Reserved3                   :: XBox360_Reserved3;
    k_EInputActionOrigin_XBox360_Reserved4                   :: XBox360_Reserved4;
    k_EInputActionOrigin_XBox360_Reserved5                   :: XBox360_Reserved5;
    k_EInputActionOrigin_XBox360_Reserved6                   :: XBox360_Reserved6;
    k_EInputActionOrigin_XBox360_Reserved7                   :: XBox360_Reserved7;
    k_EInputActionOrigin_XBox360_Reserved8                   :: XBox360_Reserved8;
    k_EInputActionOrigin_XBox360_Reserved9                   :: XBox360_Reserved9;
    k_EInputActionOrigin_XBox360_Reserved10                  :: XBox360_Reserved10;

    k_EInputActionOrigin_Switch_A                            :: Switch_A;
    k_EInputActionOrigin_Switch_B                            :: Switch_B;
    k_EInputActionOrigin_Switch_X                            :: Switch_X;
    k_EInputActionOrigin_Switch_Y                            :: Switch_Y;
    k_EInputActionOrigin_Switch_LeftBumper                   :: Switch_LeftBumper;
    k_EInputActionOrigin_Switch_RightBumper                  :: Switch_RightBumper;
    k_EInputActionOrigin_Switch_Plus                         :: Switch_Plus;
    k_EInputActionOrigin_Switch_Minus                        :: Switch_Minus;
    k_EInputActionOrigin_Switch_Capture                      :: Switch_Capture;
    k_EInputActionOrigin_Switch_LeftTrigger_Pull             :: Switch_LeftTrigger_Pull;
    k_EInputActionOrigin_Switch_LeftTrigger_Click            :: Switch_LeftTrigger_Click;
    k_EInputActionOrigin_Switch_RightTrigger_Pull            :: Switch_RightTrigger_Pull;
    k_EInputActionOrigin_Switch_RightTrigger_Click           :: Switch_RightTrigger_Click;
    k_EInputActionOrigin_Switch_LeftStick_Move               :: Switch_LeftStick_Move;
    k_EInputActionOrigin_Switch_LeftStick_Click              :: Switch_LeftStick_Click;
    k_EInputActionOrigin_Switch_LeftStick_DPadNorth          :: Switch_LeftStick_DPadNorth;
    k_EInputActionOrigin_Switch_LeftStick_DPadSouth          :: Switch_LeftStick_DPadSouth;
    k_EInputActionOrigin_Switch_LeftStick_DPadWest           :: Switch_LeftStick_DPadWest;
    k_EInputActionOrigin_Switch_LeftStick_DPadEast           :: Switch_LeftStick_DPadEast;
    k_EInputActionOrigin_Switch_RightStick_Move              :: Switch_RightStick_Move;
    k_EInputActionOrigin_Switch_RightStick_Click             :: Switch_RightStick_Click;
    k_EInputActionOrigin_Switch_RightStick_DPadNorth         :: Switch_RightStick_DPadNorth;
    k_EInputActionOrigin_Switch_RightStick_DPadSouth         :: Switch_RightStick_DPadSouth;
    k_EInputActionOrigin_Switch_RightStick_DPadWest          :: Switch_RightStick_DPadWest;
    k_EInputActionOrigin_Switch_RightStick_DPadEast          :: Switch_RightStick_DPadEast;
    k_EInputActionOrigin_Switch_DPad_North                   :: Switch_DPad_North;
    k_EInputActionOrigin_Switch_DPad_South                   :: Switch_DPad_South;
    k_EInputActionOrigin_Switch_DPad_West                    :: Switch_DPad_West;
    k_EInputActionOrigin_Switch_DPad_East                    :: Switch_DPad_East;
    k_EInputActionOrigin_Switch_ProGyro_Move                 :: Switch_ProGyro_Move;
    k_EInputActionOrigin_Switch_ProGyro_Pitch                :: Switch_ProGyro_Pitch;
    k_EInputActionOrigin_Switch_ProGyro_Yaw                  :: Switch_ProGyro_Yaw;
    k_EInputActionOrigin_Switch_ProGyro_Roll                 :: Switch_ProGyro_Roll;
    k_EInputActionOrigin_Switch_DPad_Move                    :: Switch_DPad_Move;
    k_EInputActionOrigin_Switch_Reserved1                    :: Switch_Reserved1;
    k_EInputActionOrigin_Switch_Reserved2                    :: Switch_Reserved2;
    k_EInputActionOrigin_Switch_Reserved3                    :: Switch_Reserved3;
    k_EInputActionOrigin_Switch_Reserved4                    :: Switch_Reserved4;
    k_EInputActionOrigin_Switch_Reserved5                    :: Switch_Reserved5;
    k_EInputActionOrigin_Switch_Reserved6                    :: Switch_Reserved6;
    k_EInputActionOrigin_Switch_Reserved7                    :: Switch_Reserved7;
    k_EInputActionOrigin_Switch_Reserved8                    :: Switch_Reserved8;
    k_EInputActionOrigin_Switch_Reserved9                    :: Switch_Reserved9;
    k_EInputActionOrigin_Switch_Reserved10                   :: Switch_Reserved10;

    k_EInputActionOrigin_Switch_RightGyro_Move               :: Switch_RightGyro_Move;
    k_EInputActionOrigin_Switch_RightGyro_Pitch              :: Switch_RightGyro_Pitch;
    k_EInputActionOrigin_Switch_RightGyro_Yaw                :: Switch_RightGyro_Yaw;
    k_EInputActionOrigin_Switch_RightGyro_Roll               :: Switch_RightGyro_Roll;
    k_EInputActionOrigin_Switch_LeftGyro_Move                :: Switch_LeftGyro_Move;
    k_EInputActionOrigin_Switch_LeftGyro_Pitch               :: Switch_LeftGyro_Pitch;
    k_EInputActionOrigin_Switch_LeftGyro_Yaw                 :: Switch_LeftGyro_Yaw;
    k_EInputActionOrigin_Switch_LeftGyro_Roll                :: Switch_LeftGyro_Roll;
    k_EInputActionOrigin_Switch_LeftGrip_Lower               :: Switch_LeftGrip_Lower;
    k_EInputActionOrigin_Switch_LeftGrip_Upper               :: Switch_LeftGrip_Upper;
    k_EInputActionOrigin_Switch_RightGrip_Lower              :: Switch_RightGrip_Lower;
    k_EInputActionOrigin_Switch_RightGrip_Upper              :: Switch_RightGrip_Upper;
    k_EInputActionOrigin_Switch_JoyConButton_N               :: Switch_JoyConButton_N;
    k_EInputActionOrigin_Switch_JoyConButton_E               :: Switch_JoyConButton_E;
    k_EInputActionOrigin_Switch_JoyConButton_S               :: Switch_JoyConButton_S;
    k_EInputActionOrigin_Switch_JoyConButton_W               :: Switch_JoyConButton_W;
    k_EInputActionOrigin_Switch_Reserved15                   :: Switch_Reserved15;
    k_EInputActionOrigin_Switch_Reserved16                   :: Switch_Reserved16;
    k_EInputActionOrigin_Switch_Reserved17                   :: Switch_Reserved17;
    k_EInputActionOrigin_Switch_Reserved18                   :: Switch_Reserved18;
    k_EInputActionOrigin_Switch_Reserved19                   :: Switch_Reserved19;
    k_EInputActionOrigin_Switch_Reserved20                   :: Switch_Reserved20;

    k_EInputActionOrigin_PS5_X                               :: PS5_X;
    k_EInputActionOrigin_PS5_Circle                          :: PS5_Circle;
    k_EInputActionOrigin_PS5_Triangle                        :: PS5_Triangle;
    k_EInputActionOrigin_PS5_Square                          :: PS5_Square;
    k_EInputActionOrigin_PS5_LeftBumper                      :: PS5_LeftBumper;
    k_EInputActionOrigin_PS5_RightBumper                     :: PS5_RightBumper;
    k_EInputActionOrigin_PS5_Option                          :: PS5_Option;
    k_EInputActionOrigin_PS5_Create                          :: PS5_Create;
    k_EInputActionOrigin_PS5_Mute                            :: PS5_Mute;
    k_EInputActionOrigin_PS5_LeftPad_Touch                   :: PS5_LeftPad_Touch;
    k_EInputActionOrigin_PS5_LeftPad_Swipe                   :: PS5_LeftPad_Swipe;
    k_EInputActionOrigin_PS5_LeftPad_Click                   :: PS5_LeftPad_Click;
    k_EInputActionOrigin_PS5_LeftPad_DPadNorth               :: PS5_LeftPad_DPadNorth;
    k_EInputActionOrigin_PS5_LeftPad_DPadSouth               :: PS5_LeftPad_DPadSouth;
    k_EInputActionOrigin_PS5_LeftPad_DPadWest                :: PS5_LeftPad_DPadWest;
    k_EInputActionOrigin_PS5_LeftPad_DPadEast                :: PS5_LeftPad_DPadEast;
    k_EInputActionOrigin_PS5_RightPad_Touch                  :: PS5_RightPad_Touch;
    k_EInputActionOrigin_PS5_RightPad_Swipe                  :: PS5_RightPad_Swipe;
    k_EInputActionOrigin_PS5_RightPad_Click                  :: PS5_RightPad_Click;
    k_EInputActionOrigin_PS5_RightPad_DPadNorth              :: PS5_RightPad_DPadNorth;
    k_EInputActionOrigin_PS5_RightPad_DPadSouth              :: PS5_RightPad_DPadSouth;
    k_EInputActionOrigin_PS5_RightPad_DPadWest               :: PS5_RightPad_DPadWest;
    k_EInputActionOrigin_PS5_RightPad_DPadEast               :: PS5_RightPad_DPadEast;
    k_EInputActionOrigin_PS5_CenterPad_Touch                 :: PS5_CenterPad_Touch;
    k_EInputActionOrigin_PS5_CenterPad_Swipe                 :: PS5_CenterPad_Swipe;
    k_EInputActionOrigin_PS5_CenterPad_Click                 :: PS5_CenterPad_Click;
    k_EInputActionOrigin_PS5_CenterPad_DPadNorth             :: PS5_CenterPad_DPadNorth;
    k_EInputActionOrigin_PS5_CenterPad_DPadSouth             :: PS5_CenterPad_DPadSouth;
    k_EInputActionOrigin_PS5_CenterPad_DPadWest              :: PS5_CenterPad_DPadWest;
    k_EInputActionOrigin_PS5_CenterPad_DPadEast              :: PS5_CenterPad_DPadEast;
    k_EInputActionOrigin_PS5_LeftTrigger_Pull                :: PS5_LeftTrigger_Pull;
    k_EInputActionOrigin_PS5_LeftTrigger_Click               :: PS5_LeftTrigger_Click;
    k_EInputActionOrigin_PS5_RightTrigger_Pull               :: PS5_RightTrigger_Pull;
    k_EInputActionOrigin_PS5_RightTrigger_Click              :: PS5_RightTrigger_Click;
    k_EInputActionOrigin_PS5_LeftStick_Move                  :: PS5_LeftStick_Move;
    k_EInputActionOrigin_PS5_LeftStick_Click                 :: PS5_LeftStick_Click;
    k_EInputActionOrigin_PS5_LeftStick_DPadNorth             :: PS5_LeftStick_DPadNorth;
    k_EInputActionOrigin_PS5_LeftStick_DPadSouth             :: PS5_LeftStick_DPadSouth;
    k_EInputActionOrigin_PS5_LeftStick_DPadWest              :: PS5_LeftStick_DPadWest;
    k_EInputActionOrigin_PS5_LeftStick_DPadEast              :: PS5_LeftStick_DPadEast;
    k_EInputActionOrigin_PS5_RightStick_Move                 :: PS5_RightStick_Move;
    k_EInputActionOrigin_PS5_RightStick_Click                :: PS5_RightStick_Click;
    k_EInputActionOrigin_PS5_RightStick_DPadNorth            :: PS5_RightStick_DPadNorth;
    k_EInputActionOrigin_PS5_RightStick_DPadSouth            :: PS5_RightStick_DPadSouth;
    k_EInputActionOrigin_PS5_RightStick_DPadWest             :: PS5_RightStick_DPadWest;
    k_EInputActionOrigin_PS5_RightStick_DPadEast             :: PS5_RightStick_DPadEast;
    k_EInputActionOrigin_PS5_DPad_North                      :: PS5_DPad_North;
    k_EInputActionOrigin_PS5_DPad_South                      :: PS5_DPad_South;
    k_EInputActionOrigin_PS5_DPad_West                       :: PS5_DPad_West;
    k_EInputActionOrigin_PS5_DPad_East                       :: PS5_DPad_East;
    k_EInputActionOrigin_PS5_Gyro_Move                       :: PS5_Gyro_Move;
    k_EInputActionOrigin_PS5_Gyro_Pitch                      :: PS5_Gyro_Pitch;
    k_EInputActionOrigin_PS5_Gyro_Yaw                        :: PS5_Gyro_Yaw;
    k_EInputActionOrigin_PS5_Gyro_Roll                       :: PS5_Gyro_Roll;
    k_EInputActionOrigin_PS5_DPad_Move                       :: PS5_DPad_Move;
    k_EInputActionOrigin_PS5_LeftGrip                        :: PS5_LeftGrip;
    k_EInputActionOrigin_PS5_RightGrip                       :: PS5_RightGrip;
    k_EInputActionOrigin_PS5_LeftFn                          :: PS5_LeftFn;
    k_EInputActionOrigin_PS5_RightFn                         :: PS5_RightFn;
    k_EInputActionOrigin_PS5_Reserved5                       :: PS5_Reserved5;
    k_EInputActionOrigin_PS5_Reserved6                       :: PS5_Reserved6;
    k_EInputActionOrigin_PS5_Reserved7                       :: PS5_Reserved7;
    k_EInputActionOrigin_PS5_Reserved8                       :: PS5_Reserved8;
    k_EInputActionOrigin_PS5_Reserved9                       :: PS5_Reserved9;
    k_EInputActionOrigin_PS5_Reserved10                      :: PS5_Reserved10;
    k_EInputActionOrigin_PS5_Reserved11                      :: PS5_Reserved11;
    k_EInputActionOrigin_PS5_Reserved12                      :: PS5_Reserved12;
    k_EInputActionOrigin_PS5_Reserved13                      :: PS5_Reserved13;
    k_EInputActionOrigin_PS5_Reserved14                      :: PS5_Reserved14;
    k_EInputActionOrigin_PS5_Reserved15                      :: PS5_Reserved15;
    k_EInputActionOrigin_PS5_Reserved16                      :: PS5_Reserved16;
    k_EInputActionOrigin_PS5_Reserved17                      :: PS5_Reserved17;
    k_EInputActionOrigin_PS5_Reserved18                      :: PS5_Reserved18;
    k_EInputActionOrigin_PS5_Reserved19                      :: PS5_Reserved19;
    k_EInputActionOrigin_PS5_Reserved20                      :: PS5_Reserved20;

    k_EInputActionOrigin_SteamDeck_A                         :: SteamDeck_A;
    k_EInputActionOrigin_SteamDeck_B                         :: SteamDeck_B;
    k_EInputActionOrigin_SteamDeck_X                         :: SteamDeck_X;
    k_EInputActionOrigin_SteamDeck_Y                         :: SteamDeck_Y;
    k_EInputActionOrigin_SteamDeck_L1                        :: SteamDeck_L1;
    k_EInputActionOrigin_SteamDeck_R1                        :: SteamDeck_R1;
    k_EInputActionOrigin_SteamDeck_Menu                      :: SteamDeck_Menu;
    k_EInputActionOrigin_SteamDeck_View                      :: SteamDeck_View;
    k_EInputActionOrigin_SteamDeck_LeftPad_Touch             :: SteamDeck_LeftPad_Touch;
    k_EInputActionOrigin_SteamDeck_LeftPad_Swipe             :: SteamDeck_LeftPad_Swipe;
    k_EInputActionOrigin_SteamDeck_LeftPad_Click             :: SteamDeck_LeftPad_Click;
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadNorth         :: SteamDeck_LeftPad_DPadNorth;
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadSouth         :: SteamDeck_LeftPad_DPadSouth;
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadWest          :: SteamDeck_LeftPad_DPadWest;
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadEast          :: SteamDeck_LeftPad_DPadEast;
    k_EInputActionOrigin_SteamDeck_RightPad_Touch            :: SteamDeck_RightPad_Touch;
    k_EInputActionOrigin_SteamDeck_RightPad_Swipe            :: SteamDeck_RightPad_Swipe;
    k_EInputActionOrigin_SteamDeck_RightPad_Click            :: SteamDeck_RightPad_Click;
    k_EInputActionOrigin_SteamDeck_RightPad_DPadNorth        :: SteamDeck_RightPad_DPadNorth;
    k_EInputActionOrigin_SteamDeck_RightPad_DPadSouth        :: SteamDeck_RightPad_DPadSouth;
    k_EInputActionOrigin_SteamDeck_RightPad_DPadWest         :: SteamDeck_RightPad_DPadWest;
    k_EInputActionOrigin_SteamDeck_RightPad_DPadEast         :: SteamDeck_RightPad_DPadEast;
    k_EInputActionOrigin_SteamDeck_L2_SoftPull               :: SteamDeck_L2_SoftPull;
    k_EInputActionOrigin_SteamDeck_L2                        :: SteamDeck_L2;
    k_EInputActionOrigin_SteamDeck_R2_SoftPull               :: SteamDeck_R2_SoftPull;
    k_EInputActionOrigin_SteamDeck_R2                        :: SteamDeck_R2;
    k_EInputActionOrigin_SteamDeck_LeftStick_Move            :: SteamDeck_LeftStick_Move;
    k_EInputActionOrigin_SteamDeck_L3                        :: SteamDeck_L3;
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadNorth       :: SteamDeck_LeftStick_DPadNorth;
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadSouth       :: SteamDeck_LeftStick_DPadSouth;
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadWest        :: SteamDeck_LeftStick_DPadWest;
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadEast        :: SteamDeck_LeftStick_DPadEast;
    k_EInputActionOrigin_SteamDeck_LeftStick_Touch           :: SteamDeck_LeftStick_Touch;
    k_EInputActionOrigin_SteamDeck_RightStick_Move           :: SteamDeck_RightStick_Move;
    k_EInputActionOrigin_SteamDeck_R3                        :: SteamDeck_R3;
    k_EInputActionOrigin_SteamDeck_RightStick_DPadNorth      :: SteamDeck_RightStick_DPadNorth;
    k_EInputActionOrigin_SteamDeck_RightStick_DPadSouth      :: SteamDeck_RightStick_DPadSouth;
    k_EInputActionOrigin_SteamDeck_RightStick_DPadWest       :: SteamDeck_RightStick_DPadWest;
    k_EInputActionOrigin_SteamDeck_RightStick_DPadEast       :: SteamDeck_RightStick_DPadEast;
    k_EInputActionOrigin_SteamDeck_RightStick_Touch          :: SteamDeck_RightStick_Touch;
    k_EInputActionOrigin_SteamDeck_L4                        :: SteamDeck_L4;
    k_EInputActionOrigin_SteamDeck_R4                        :: SteamDeck_R4;
    k_EInputActionOrigin_SteamDeck_L5                        :: SteamDeck_L5;
    k_EInputActionOrigin_SteamDeck_R5                        :: SteamDeck_R5;
    k_EInputActionOrigin_SteamDeck_DPad_Move                 :: SteamDeck_DPad_Move;
    k_EInputActionOrigin_SteamDeck_DPad_North                :: SteamDeck_DPad_North;
    k_EInputActionOrigin_SteamDeck_DPad_South                :: SteamDeck_DPad_South;
    k_EInputActionOrigin_SteamDeck_DPad_West                 :: SteamDeck_DPad_West;
    k_EInputActionOrigin_SteamDeck_DPad_East                 :: SteamDeck_DPad_East;
    k_EInputActionOrigin_SteamDeck_Gyro_Move                 :: SteamDeck_Gyro_Move;
    k_EInputActionOrigin_SteamDeck_Gyro_Pitch                :: SteamDeck_Gyro_Pitch;
    k_EInputActionOrigin_SteamDeck_Gyro_Yaw                  :: SteamDeck_Gyro_Yaw;
    k_EInputActionOrigin_SteamDeck_Gyro_Roll                 :: SteamDeck_Gyro_Roll;
    k_EInputActionOrigin_SteamDeck_Reserved1                 :: SteamDeck_Reserved1;
    k_EInputActionOrigin_SteamDeck_Reserved2                 :: SteamDeck_Reserved2;
    k_EInputActionOrigin_SteamDeck_Reserved3                 :: SteamDeck_Reserved3;
    k_EInputActionOrigin_SteamDeck_Reserved4                 :: SteamDeck_Reserved4;
    k_EInputActionOrigin_SteamDeck_Reserved5                 :: SteamDeck_Reserved5;
    k_EInputActionOrigin_SteamDeck_Reserved6                 :: SteamDeck_Reserved6;
    k_EInputActionOrigin_SteamDeck_Reserved7                 :: SteamDeck_Reserved7;
    k_EInputActionOrigin_SteamDeck_Reserved8                 :: SteamDeck_Reserved8;
    k_EInputActionOrigin_SteamDeck_Reserved9                 :: SteamDeck_Reserved9;
    k_EInputActionOrigin_SteamDeck_Reserved10                :: SteamDeck_Reserved10;
    k_EInputActionOrigin_SteamDeck_Reserved11                :: SteamDeck_Reserved11;
    k_EInputActionOrigin_SteamDeck_Reserved12                :: SteamDeck_Reserved12;
    k_EInputActionOrigin_SteamDeck_Reserved13                :: SteamDeck_Reserved13;
    k_EInputActionOrigin_SteamDeck_Reserved14                :: SteamDeck_Reserved14;
    k_EInputActionOrigin_SteamDeck_Reserved15                :: SteamDeck_Reserved15;
    k_EInputActionOrigin_SteamDeck_Reserved16                :: SteamDeck_Reserved16;
    k_EInputActionOrigin_SteamDeck_Reserved17                :: SteamDeck_Reserved17;
    k_EInputActionOrigin_SteamDeck_Reserved18                :: SteamDeck_Reserved18;
    k_EInputActionOrigin_SteamDeck_Reserved19                :: SteamDeck_Reserved19;
    k_EInputActionOrigin_SteamDeck_Reserved20                :: SteamDeck_Reserved20;

    k_EInputActionOrigin_Count                               :: Count;
    k_EInputActionOrigin_MaximumPossibleValue                :: MaximumPossibleValue;
}

EXboxOrigin :: enum s32 {
    A                    :: 0;
    B                    :: 1;
    X                    :: 2;
    Y                    :: 3;
    LeftBumper           :: 4;
    RightBumper          :: 5;
    Menu                 :: 6;
    View                 :: 7;
    LeftTrigger_Pull     :: 8;
    LeftTrigger_Click    :: 9;
    RightTrigger_Pull    :: 10;
    RightTrigger_Click   :: 11;
    LeftStick_Move       :: 12;
    LeftStick_Click      :: 13;
    LeftStick_DPadNorth  :: 14;
    LeftStick_DPadSouth  :: 15;
    LeftStick_DPadWest   :: 16;
    LeftStick_DPadEast   :: 17;
    RightStick_Move      :: 18;
    RightStick_Click     :: 19;
    RightStick_DPadNorth :: 20;
    RightStick_DPadSouth :: 21;
    RightStick_DPadWest  :: 22;
    RightStick_DPadEast  :: 23;
    DPad_North           :: 24;
    DPad_South           :: 25;
    DPad_West            :: 26;
    DPad_East            :: 27;
    Count                :: 28;

    k_EXboxOrigin_A                    :: A;
    k_EXboxOrigin_B                    :: B;
    k_EXboxOrigin_X                    :: X;
    k_EXboxOrigin_Y                    :: Y;
    k_EXboxOrigin_LeftBumper           :: LeftBumper;
    k_EXboxOrigin_RightBumper          :: RightBumper;
    k_EXboxOrigin_Menu                 :: Menu;
    k_EXboxOrigin_View                 :: View;
    k_EXboxOrigin_LeftTrigger_Pull     :: LeftTrigger_Pull;
    k_EXboxOrigin_LeftTrigger_Click    :: LeftTrigger_Click;
    k_EXboxOrigin_RightTrigger_Pull    :: RightTrigger_Pull;
    k_EXboxOrigin_RightTrigger_Click   :: RightTrigger_Click;
    k_EXboxOrigin_LeftStick_Move       :: LeftStick_Move;
    k_EXboxOrigin_LeftStick_Click      :: LeftStick_Click;
    k_EXboxOrigin_LeftStick_DPadNorth  :: LeftStick_DPadNorth;
    k_EXboxOrigin_LeftStick_DPadSouth  :: LeftStick_DPadSouth;
    k_EXboxOrigin_LeftStick_DPadWest   :: LeftStick_DPadWest;
    k_EXboxOrigin_LeftStick_DPadEast   :: LeftStick_DPadEast;
    k_EXboxOrigin_RightStick_Move      :: RightStick_Move;
    k_EXboxOrigin_RightStick_Click     :: RightStick_Click;
    k_EXboxOrigin_RightStick_DPadNorth :: RightStick_DPadNorth;
    k_EXboxOrigin_RightStick_DPadSouth :: RightStick_DPadSouth;
    k_EXboxOrigin_RightStick_DPadWest  :: RightStick_DPadWest;
    k_EXboxOrigin_RightStick_DPadEast  :: RightStick_DPadEast;
    k_EXboxOrigin_DPad_North           :: DPad_North;
    k_EXboxOrigin_DPad_South           :: DPad_South;
    k_EXboxOrigin_DPad_West            :: DPad_West;
    k_EXboxOrigin_DPad_East            :: DPad_East;
    k_EXboxOrigin_Count                :: Count;
}

ESteamControllerPad :: enum s32 {
    Left  :: 0;
    Right :: 1;

    k_ESteamControllerPad_Left  :: Left;
    k_ESteamControllerPad_Right :: Right;
}

EControllerHapticLocation :: enum s32 {
    Left  :: 1;
    Right :: 2;
    Both  :: 3;

    k_EControllerHapticLocation_Left  :: Left;
    k_EControllerHapticLocation_Right :: Right;
    k_EControllerHapticLocation_Both  :: Both;
}

EControllerHapticType :: enum s32 {
    Off   :: 0;
    Tick  :: 1;
    Click :: 2;

    k_EControllerHapticType_Off   :: Off;
    k_EControllerHapticType_Tick  :: Tick;
    k_EControllerHapticType_Click :: Click;
}

ESteamInputType :: enum s32 {
    Unknown              :: 0;
    SteamController      :: 1;
    XBox360Controller    :: 2;
    XBoxOneController    :: 3;
    GenericGamepad       :: 4;
    PS4Controller        :: 5;
    AppleMFiController   :: 6;
    AndroidController    :: 7;
    SwitchJoyConPair     :: 8;
    SwitchJoyConSingle   :: 9;
    SwitchProController  :: 10;
    MobileTouch          :: 11;
    PS3Controller        :: 12;
    PS5Controller        :: 13;
    SteamDeckController  :: 14;
    Count                :: 15;
    MaximumPossibleValue :: 255;

    k_ESteamInputType_Unknown              :: Unknown;
    k_ESteamInputType_SteamController      :: SteamController;
    k_ESteamInputType_XBox360Controller    :: XBox360Controller;
    k_ESteamInputType_XBoxOneController    :: XBoxOneController;
    k_ESteamInputType_GenericGamepad       :: GenericGamepad;
    k_ESteamInputType_PS4Controller        :: PS4Controller;
    k_ESteamInputType_AppleMFiController   :: AppleMFiController;
    k_ESteamInputType_AndroidController    :: AndroidController;
    k_ESteamInputType_SwitchJoyConPair     :: SwitchJoyConPair;
    k_ESteamInputType_SwitchJoyConSingle   :: SwitchJoyConSingle;
    k_ESteamInputType_SwitchProController  :: SwitchProController;
    k_ESteamInputType_MobileTouch          :: MobileTouch;
    k_ESteamInputType_PS3Controller        :: PS3Controller;
    k_ESteamInputType_PS5Controller        :: PS5Controller;
    k_ESteamInputType_SteamDeckController  :: SteamDeckController;
    k_ESteamInputType_Count                :: Count;
    k_ESteamInputType_MaximumPossibleValue :: MaximumPossibleValue;
}

// Individual values are used by the GetSessionInputConfigurationSettings bitmask
ESteamInputConfigurationEnableType :: enum s32 {
    None        :: 0;
    Playstation :: 1;
    Xbox        :: 2;
    Generic     :: 4;
    Switch      :: 8;

    k_ESteamInputConfigurationEnableType_None        :: None;
    k_ESteamInputConfigurationEnableType_Playstation :: Playstation;
    k_ESteamInputConfigurationEnableType_Xbox        :: Xbox;
    k_ESteamInputConfigurationEnableType_Generic     :: Generic;
    k_ESteamInputConfigurationEnableType_Switch      :: Switch;
}

// These values are passed into SetLEDColor
ESteamInputLEDFlag :: enum s32 {
    SetColor           :: 0;

    RestoreUserDefault :: 1;

    k_ESteamInputLEDFlag_SetColor           :: SetColor;

    k_ESteamInputLEDFlag_RestoreUserDefault :: RestoreUserDefault;
}

// These values are passed into GetGlyphPNGForActionOrigin
ESteamInputGlyphSize :: enum s32 {
    Small  :: 0;
    Medium :: 1;
    Large  :: 2;
    Count  :: 3;

    k_ESteamInputGlyphSize_Small  :: Small;
    k_ESteamInputGlyphSize_Medium :: Medium;
    k_ESteamInputGlyphSize_Large  :: Large;
    k_ESteamInputGlyphSize_Count  :: Count;
}

ESteamInputGlyphStyle :: enum s32 {
    Knockout         :: 0;

    Light            :: 1;
    Dark             :: 2;

    NeutralColorABXY :: 16;
    SolidABXY        :: 32;

    ESteamInputGlyphStyle_Knockout         :: Knockout;

    ESteamInputGlyphStyle_Light            :: Light;
    ESteamInputGlyphStyle_Dark             :: Dark;

    ESteamInputGlyphStyle_NeutralColorABXY :: NeutralColorABXY;
    ESteamInputGlyphStyle_SolidABXY        :: SolidABXY;
}

ESteamInputActionEventType :: enum s32 {
    DigitalAction :: 0;
    AnalogAction  :: 1;

    ESteamInputActionEventType_DigitalAction :: DigitalAction;
    ESteamInputActionEventType_AnalogAction  :: AnalogAction;
}

// InputHandle_t is used to refer to a specific controller.
// This handle will consistently identify a controller, even if it is disconnected and re-connected
InputHandle_t :: uint64;

// These handles are used to refer to a specific in-game action or action set
// All action handles should be queried during initialization for performance reasons
InputActionSetHandle_t :: uint64;
InputDigitalActionHandle_t :: uint64;
InputAnalogActionHandle_t :: uint64;

InputAnalogActionData_t :: struct {
    // Type of data coming from this action, this will match what got specified in the action set
    eMode:   EInputSourceMode;

    // The current state of this action; will be delta updates for mouse actions
    x:       float;
    // The current state of this action; will be delta updates for mouse actions
    y:       float;

    // Whether or not this action is currently available to be bound in the active action set
    bActive: bool;
}

InputDigitalActionData_t :: struct {
    // The current state of this action; will be true if currently pressed
    bState:  bool;

    // Whether or not this action is currently available to be bound in the active action set
    bActive: bool;
}

InputMotionData_t :: struct {
    // Sensor-fused absolute rotation; will drift in heading toward average
    rotQuatX:  float;
    rotQuatY:  float;
    rotQuatZ:  float;
    rotQuatW:  float;

    // Positional acceleration
    posAccelX: float;
    posAccelY: float;
    posAccelZ: float;

    // Angular velocity
    rotVelX:   float;
    rotVelY:   float;
    rotVelZ:   float;
}

//-----------------------------------------------------------------------------
// Purpose: when callbacks are enabled this fires each time a controller action
// state changes
//-----------------------------------------------------------------------------
SteamInputActionEvent_t :: struct {
    controllerHandle: InputHandle_t;
    eEventType:       ESteamInputActionEventType;
    AnalogAction_t :: struct {
        actionHandle:     InputAnalogActionHandle_t;
        analogActionData: InputAnalogActionData_t;
    }

    DigitalAction_t :: struct {
        actionHandle:      InputDigitalActionHandle_t;
        digitalActionData: InputDigitalActionData_t;
    }

    union {
        analogAction:  AnalogAction_t;
        digitalAction: DigitalAction_t;
    }
}

//-----------------------------------------------------------------------------
// Forward declaration for ScePadTriggerEffectParam, defined in isteamdualsense.h
//-----------------------------------------------------------------------------
ScePadTriggerEffectParam :: struct {}

SteamInputActionEventCallbackPointer :: #type (unknown0: *SteamInputActionEvent_t) -> void #c_call;

//-----------------------------------------------------------------------------
// Purpose: Steam Input API
//-----------------------------------------------------------------------------
ISteamInput :: struct {
    vtable: *ISteamInput_VTable;
}
ISteamInput_VTable :: struct #type_info_none {
    Init: (this: *ISteamInput, bExplicitlyCallRunFrame: bool) -> bool #cpp_method;
    Shutdown: (this: *ISteamInput) -> bool #cpp_method;

    SetInputActionManifestFilePath: (this: *ISteamInput, pchInputActionManifestAbsolutePath: *u8) -> bool #cpp_method;

    RunFrame: (this: *ISteamInput, bReservedValue := true) -> void #cpp_method;

    BWaitForData: (this: *ISteamInput, bWaitForever: bool, unTimeout: uint32) -> bool #cpp_method;

    BNewDataAvailable: (this: *ISteamInput) -> bool #cpp_method;

    GetConnectedControllers: (this: *ISteamInput, handlesOut: *InputHandle_t) -> s32 #cpp_method;

    EnableDeviceCallbacks: (this: *ISteamInput) -> void #cpp_method;

    EnableActionEventCallbacks: (this: *ISteamInput, pCallback: SteamInputActionEventCallbackPointer) -> void #cpp_method;

    GetActionSetHandle: (this: *ISteamInput, pszActionSetName: *u8) -> InputActionSetHandle_t #cpp_method;

    ActivateActionSet: (this: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) -> void #cpp_method;
    GetCurrentActionSet: (this: *ISteamInput, inputHandle: InputHandle_t) -> InputActionSetHandle_t #cpp_method;

    ActivateActionSetLayer: (this: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) -> void #cpp_method;
    DeactivateActionSetLayer: (this: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) -> void #cpp_method;
    DeactivateAllActionSetLayers: (this: *ISteamInput, inputHandle: InputHandle_t) -> void #cpp_method;

    GetActiveActionSetLayers: (this: *ISteamInput, inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 #cpp_method;

    GetDigitalActionHandle: (this: *ISteamInput, pszActionName: *u8) -> InputDigitalActionHandle_t #cpp_method;

    GetDigitalActionData: (this: *ISteamInput, inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t #cpp_method;

    GetDigitalActionOrigins: (this: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #cpp_method;

    GetStringForDigitalActionName: (this: *ISteamInput, eActionHandle: InputDigitalActionHandle_t) -> *u8 #cpp_method;

    GetAnalogActionHandle: (this: *ISteamInput, pszActionName: *u8) -> InputAnalogActionHandle_t #cpp_method;

    GetAnalogActionData: (this: *ISteamInput, inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t #cpp_method;

    GetAnalogActionOrigins: (this: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #cpp_method;

    GetGlyphPNGForActionOrigin: (this: *ISteamInput, eOrigin: EInputActionOrigin, eSize: ESteamInputGlyphSize, unFlags: uint32) -> *u8 #cpp_method;

    GetGlyphSVGForActionOrigin: (this: *ISteamInput, eOrigin: EInputActionOrigin, unFlags: uint32) -> *u8 #cpp_method;

    GetGlyphForActionOrigin_Legacy: (this: *ISteamInput, eOrigin: EInputActionOrigin) -> *u8 #cpp_method;

    GetStringForActionOrigin: (this: *ISteamInput, eOrigin: EInputActionOrigin) -> *u8 #cpp_method;

    GetStringForAnalogActionName: (this: *ISteamInput, eActionHandle: InputAnalogActionHandle_t) -> *u8 #cpp_method;

    StopAnalogActionMomentum: (this: *ISteamInput, inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) -> void #cpp_method;

    GetMotionData: (this: *ISteamInput, inputHandle: InputHandle_t) -> InputMotionData_t #cpp_method;

    TriggerVibration: (this: *ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) -> void #cpp_method;

    TriggerVibrationExtended: (this: *ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16, usLeftTriggerSpeed: u16, usRightTriggerSpeed: u16) -> void #cpp_method;

    TriggerSimpleHapticEvent: (this: *ISteamInput, inputHandle: InputHandle_t, eHapticLocation: EControllerHapticLocation, nIntensity: uint8, nGainDB: u8, nOtherIntensity: uint8, nOtherGainDB: u8) -> void #cpp_method;

    SetLEDColor: (this: *ISteamInput, inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) -> void #cpp_method;

    Legacy_TriggerHapticPulse: (this: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) -> void #cpp_method;

    Legacy_TriggerRepeatedHapticPulse: (this: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) -> void #cpp_method;

    ShowBindingPanel: (this: *ISteamInput, inputHandle: InputHandle_t) -> bool #cpp_method;

    GetInputTypeForHandle: (this: *ISteamInput, inputHandle: InputHandle_t) -> ESteamInputType #cpp_method;

    GetControllerForGamepadIndex: (this: *ISteamInput, nIndex: s32) -> InputHandle_t #cpp_method;

    GetGamepadIndexForController: (this: *ISteamInput, ulinputHandle: InputHandle_t) -> s32 #cpp_method;

    GetStringForXboxOrigin: (this: *ISteamInput, eOrigin: EXboxOrigin) -> *u8 #cpp_method;

    GetGlyphForXboxOrigin: (this: *ISteamInput, eOrigin: EXboxOrigin) -> *u8 #cpp_method;

    GetActionOriginFromXboxOrigin: (this: *ISteamInput, inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin #cpp_method;

    TranslateActionOrigin: (this: *ISteamInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin #cpp_method;

    GetDeviceBindingRevision: (this: *ISteamInput, inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool #cpp_method;

    GetRemotePlaySessionID: (this: *ISteamInput, inputHandle: InputHandle_t) -> uint32 #cpp_method;

    GetSessionInputConfigurationSettings: (this: *ISteamInput) -> uint16 #cpp_method;

    SetDualSenseTriggerEffect: (this: *ISteamInput, inputHandle: InputHandle_t, pParam: *ScePadTriggerEffectParam) -> void #cpp_method;
}

ISteamInput_Init :: inline (this: *ISteamInput, bExplicitlyCallRunFrame: bool) -> bool { return this.vtable.Init(this, bExplicitlyCallRunFrame); }
ISteamInput_Shutdown :: inline (this: *ISteamInput) -> bool { return this.vtable.Shutdown(this); }

ISteamInput_SetInputActionManifestFilePath :: inline (this: *ISteamInput, pchInputActionManifestAbsolutePath: *u8) -> bool { return this.vtable.SetInputActionManifestFilePath(this, pchInputActionManifestAbsolutePath); }

ISteamInput_RunFrame :: inline (this: *ISteamInput, bReservedValue := true) { this.vtable.RunFrame(this, bReservedValue); }

ISteamInput_BWaitForData :: inline (this: *ISteamInput, bWaitForever: bool, unTimeout: uint32) -> bool { return this.vtable.BWaitForData(this, bWaitForever, unTimeout); }

ISteamInput_BNewDataAvailable :: inline (this: *ISteamInput) -> bool { return this.vtable.BNewDataAvailable(this); }

ISteamInput_GetConnectedControllers :: inline (this: *ISteamInput, handlesOut: *InputHandle_t) -> s32 { return this.vtable.GetConnectedControllers(this, handlesOut); }

ISteamInput_EnableDeviceCallbacks :: inline (this: *ISteamInput) { this.vtable.EnableDeviceCallbacks(this); }

ISteamInput_EnableActionEventCallbacks :: inline (this: *ISteamInput, pCallback: SteamInputActionEventCallbackPointer) { this.vtable.EnableActionEventCallbacks(this, pCallback); }

ISteamInput_GetActionSetHandle :: inline (this: *ISteamInput, pszActionSetName: *u8) -> InputActionSetHandle_t { return this.vtable.GetActionSetHandle(this, pszActionSetName); }

ISteamInput_ActivateActionSet :: inline (this: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) { this.vtable.ActivateActionSet(this, inputHandle, actionSetHandle); }
ISteamInput_GetCurrentActionSet :: inline (this: *ISteamInput, inputHandle: InputHandle_t) -> InputActionSetHandle_t { return this.vtable.GetCurrentActionSet(this, inputHandle); }

ISteamInput_ActivateActionSetLayer :: inline (this: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) { this.vtable.ActivateActionSetLayer(this, inputHandle, actionSetLayerHandle); }
ISteamInput_DeactivateActionSetLayer :: inline (this: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) { this.vtable.DeactivateActionSetLayer(this, inputHandle, actionSetLayerHandle); }
ISteamInput_DeactivateAllActionSetLayers :: inline (this: *ISteamInput, inputHandle: InputHandle_t) { this.vtable.DeactivateAllActionSetLayers(this, inputHandle); }

ISteamInput_GetActiveActionSetLayers :: inline (this: *ISteamInput, inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 { return this.vtable.GetActiveActionSetLayers(this, inputHandle, handlesOut); }

ISteamInput_GetDigitalActionHandle :: inline (this: *ISteamInput, pszActionName: *u8) -> InputDigitalActionHandle_t { return this.vtable.GetDigitalActionHandle(this, pszActionName); }

ISteamInput_GetDigitalActionData :: inline (this: *ISteamInput, inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t { return this.vtable.GetDigitalActionData(this, inputHandle, digitalActionHandle); }

ISteamInput_GetDigitalActionOrigins :: inline (this: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 { return this.vtable.GetDigitalActionOrigins(this, inputHandle, actionSetHandle, digitalActionHandle, originsOut); }

ISteamInput_GetStringForDigitalActionName :: inline (this: *ISteamInput, eActionHandle: InputDigitalActionHandle_t) -> *u8 { return this.vtable.GetStringForDigitalActionName(this, eActionHandle); }

ISteamInput_GetAnalogActionHandle :: inline (this: *ISteamInput, pszActionName: *u8) -> InputAnalogActionHandle_t { return this.vtable.GetAnalogActionHandle(this, pszActionName); }

ISteamInput_GetAnalogActionData :: inline (this: *ISteamInput, inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t { return this.vtable.GetAnalogActionData(this, inputHandle, analogActionHandle); }

ISteamInput_GetAnalogActionOrigins :: inline (this: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 { return this.vtable.GetAnalogActionOrigins(this, inputHandle, actionSetHandle, analogActionHandle, originsOut); }

ISteamInput_GetGlyphPNGForActionOrigin :: inline (this: *ISteamInput, eOrigin: EInputActionOrigin, eSize: ESteamInputGlyphSize, unFlags: uint32) -> *u8 { return this.vtable.GetGlyphPNGForActionOrigin(this, eOrigin, eSize, unFlags); }

ISteamInput_GetGlyphSVGForActionOrigin :: inline (this: *ISteamInput, eOrigin: EInputActionOrigin, unFlags: uint32) -> *u8 { return this.vtable.GetGlyphSVGForActionOrigin(this, eOrigin, unFlags); }

ISteamInput_GetGlyphForActionOrigin_Legacy :: inline (this: *ISteamInput, eOrigin: EInputActionOrigin) -> *u8 { return this.vtable.GetGlyphForActionOrigin_Legacy(this, eOrigin); }

ISteamInput_GetStringForActionOrigin :: inline (this: *ISteamInput, eOrigin: EInputActionOrigin) -> *u8 { return this.vtable.GetStringForActionOrigin(this, eOrigin); }

ISteamInput_GetStringForAnalogActionName :: inline (this: *ISteamInput, eActionHandle: InputAnalogActionHandle_t) -> *u8 { return this.vtable.GetStringForAnalogActionName(this, eActionHandle); }

ISteamInput_StopAnalogActionMomentum :: inline (this: *ISteamInput, inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) { this.vtable.StopAnalogActionMomentum(this, inputHandle, eAction); }

ISteamInput_GetMotionData :: inline (this: *ISteamInput, inputHandle: InputHandle_t) -> InputMotionData_t { return this.vtable.GetMotionData(this, inputHandle); }

ISteamInput_TriggerVibration :: inline (this: *ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) { this.vtable.TriggerVibration(this, inputHandle, usLeftSpeed, usRightSpeed); }

ISteamInput_TriggerVibrationExtended :: inline (this: *ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16, usLeftTriggerSpeed: u16, usRightTriggerSpeed: u16) { this.vtable.TriggerVibrationExtended(this, inputHandle, usLeftSpeed, usRightSpeed, usLeftTriggerSpeed, usRightTriggerSpeed); }

ISteamInput_TriggerSimpleHapticEvent :: inline (this: *ISteamInput, inputHandle: InputHandle_t, eHapticLocation: EControllerHapticLocation, nIntensity: uint8, nGainDB: u8, nOtherIntensity: uint8, nOtherGainDB: u8) { this.vtable.TriggerSimpleHapticEvent(this, inputHandle, eHapticLocation, nIntensity, nGainDB, nOtherIntensity, nOtherGainDB); }

ISteamInput_SetLEDColor :: inline (this: *ISteamInput, inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) { this.vtable.SetLEDColor(this, inputHandle, nColorR, nColorG, nColorB, nFlags); }

ISteamInput_Legacy_TriggerHapticPulse :: inline (this: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) { this.vtable.Legacy_TriggerHapticPulse(this, inputHandle, eTargetPad, usDurationMicroSec); }

ISteamInput_Legacy_TriggerRepeatedHapticPulse :: inline (this: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) { this.vtable.Legacy_TriggerRepeatedHapticPulse(this, inputHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags); }

ISteamInput_ShowBindingPanel :: inline (this: *ISteamInput, inputHandle: InputHandle_t) -> bool { return this.vtable.ShowBindingPanel(this, inputHandle); }

ISteamInput_GetInputTypeForHandle :: inline (this: *ISteamInput, inputHandle: InputHandle_t) -> ESteamInputType { return this.vtable.GetInputTypeForHandle(this, inputHandle); }

ISteamInput_GetControllerForGamepadIndex :: inline (this: *ISteamInput, nIndex: s32) -> InputHandle_t { return this.vtable.GetControllerForGamepadIndex(this, nIndex); }

ISteamInput_GetGamepadIndexForController :: inline (this: *ISteamInput, ulinputHandle: InputHandle_t) -> s32 { return this.vtable.GetGamepadIndexForController(this, ulinputHandle); }

ISteamInput_GetStringForXboxOrigin :: inline (this: *ISteamInput, eOrigin: EXboxOrigin) -> *u8 { return this.vtable.GetStringForXboxOrigin(this, eOrigin); }

ISteamInput_GetGlyphForXboxOrigin :: inline (this: *ISteamInput, eOrigin: EXboxOrigin) -> *u8 { return this.vtable.GetGlyphForXboxOrigin(this, eOrigin); }

ISteamInput_GetActionOriginFromXboxOrigin :: inline (this: *ISteamInput, inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin { return this.vtable.GetActionOriginFromXboxOrigin(this, inputHandle, eOrigin); }

ISteamInput_TranslateActionOrigin :: inline (this: *ISteamInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin { return this.vtable.TranslateActionOrigin(this, eDestinationInputType, eSourceOrigin); }

ISteamInput_GetDeviceBindingRevision :: inline (this: *ISteamInput, inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool { return this.vtable.GetDeviceBindingRevision(this, inputHandle, pMajor, pMinor); }

ISteamInput_GetRemotePlaySessionID :: inline (this: *ISteamInput, inputHandle: InputHandle_t) -> uint32 { return this.vtable.GetRemotePlaySessionID(this, inputHandle); }

ISteamInput_GetSessionInputConfigurationSettings :: inline (this: *ISteamInput) -> uint16 { return this.vtable.GetSessionInputConfigurationSettings(this); }

ISteamInput_SetDualSenseTriggerEffect :: inline (this: *ISteamInput, inputHandle: InputHandle_t, pParam: *ScePadTriggerEffectParam) { this.vtable.SetDualSenseTriggerEffect(this, inputHandle, pParam); }

vtable :: (obj: *ISteamInput) -> *ISteamInput_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: called when a new controller has been connected, will fire once
// per controller if multiple new controllers connect in the same frame
//-----------------------------------------------------------------------------
SteamInputDeviceConnected_t :: struct {
    anon_enum_183 :: enum s32 {
        k_iCallback :: 2801;
    }
    m_ulConnectedDeviceHandle: InputHandle_t; // Handle for device
}

//-----------------------------------------------------------------------------
// Purpose: called when a new controller has been connected, will fire once
// per controller if multiple new controllers connect in the same frame
//-----------------------------------------------------------------------------
SteamInputDeviceDisconnected_t :: struct {
    anon_enum_184 :: enum s32 {
        k_iCallback :: 2802;
    }
    m_ulDisconnectedDeviceHandle: InputHandle_t; // Handle for device
}

//-----------------------------------------------------------------------------
// Purpose: called when a controller configuration has been loaded, will fire once
// per controller per focus change for Steam Input enabled controllers
//-----------------------------------------------------------------------------
SteamInputConfigurationLoaded_t :: struct {
    anon_enum_185 :: enum s32 {
        k_iCallback :: 2803;
    }
    m_unAppID:            AppId_t;
    m_ulDeviceHandle:     InputHandle_t; // Handle for device
    m_ulMappingCreator:   CSteamID; // May differ from local user when using

    m_unMajorRevision:    uint32; // Binding revision from In-game Action File. 

    // Same value as queried by GetDeviceBindingRevision
    m_unMinorRevision:    uint32;
    m_bUsesSteamInputAPI: bool; // Does the configuration contain any Analog/Digital actions?
    m_bUsesGamepadAPI:    bool; // Does the configuration contain any Xinput bindings?
}

//-----------------------------------------------------------------------------
// Purpose: called when controller gamepad slots change - on Linux/macOS these
// slots are shared for all running apps.
//-----------------------------------------------------------------------------
SteamInputGamepadSlotChange_t :: struct {
    anon_enum_186 :: enum s32 {
        k_iCallback :: 2804;
    }
    m_unAppID:         AppId_t;
    m_ulDeviceHandle:  InputHandle_t; // Handle for device
    m_eDeviceType:     ESteamInputType; // Type of device
    m_nOldGamepadSlot: s32; // Previous GamepadSlot - can be -1 controller doesn't uses gamepad bindings
    m_nNewGamepadSlot: s32; // New Gamepad Slot - can be -1 controller doesn't uses gamepad bindings
}

// Note: Please do not use action origins as a way to identify controller types. There is no
// guarantee that they will be added in a contiguous manner - use GetInputTypeForHandle instead
// Versions of Steam that add new controller types in the future will extend this enum if you're
// using a lookup table please check the bounds of any origins returned by Steam.
EControllerActionOrigin :: enum s32 {
    None                             :: 0;
    A                                :: 1;
    B                                :: 2;
    X                                :: 3;
    Y                                :: 4;
    LeftBumper                       :: 5;
    RightBumper                      :: 6;
    LeftGrip                         :: 7;
    RightGrip                        :: 8;
    Start                            :: 9;
    Back                             :: 10;
    LeftPad_Touch                    :: 11;
    LeftPad_Swipe                    :: 12;
    LeftPad_Click                    :: 13;
    LeftPad_DPadNorth                :: 14;
    LeftPad_DPadSouth                :: 15;
    LeftPad_DPadWest                 :: 16;
    LeftPad_DPadEast                 :: 17;
    RightPad_Touch                   :: 18;
    RightPad_Swipe                   :: 19;
    RightPad_Click                   :: 20;
    RightPad_DPadNorth               :: 21;
    RightPad_DPadSouth               :: 22;
    RightPad_DPadWest                :: 23;
    RightPad_DPadEast                :: 24;
    LeftTrigger_Pull                 :: 25;
    LeftTrigger_Click                :: 26;
    RightTrigger_Pull                :: 27;
    RightTrigger_Click               :: 28;
    LeftStick_Move                   :: 29;
    LeftStick_Click                  :: 30;
    LeftStick_DPadNorth              :: 31;
    LeftStick_DPadSouth              :: 32;
    LeftStick_DPadWest               :: 33;
    LeftStick_DPadEast               :: 34;
    Gyro_Move                        :: 35;
    Gyro_Pitch                       :: 36;
    Gyro_Yaw                         :: 37;
    Gyro_Roll                        :: 38;

    PS4_X                            :: 39;
    PS4_Circle                       :: 40;
    PS4_Triangle                     :: 41;
    PS4_Square                       :: 42;
    PS4_LeftBumper                   :: 43;
    PS4_RightBumper                  :: 44;
    PS4_Options                      :: 45;
    PS4_Share                        :: 46;
    PS4_LeftPad_Touch                :: 47;
    PS4_LeftPad_Swipe                :: 48;
    PS4_LeftPad_Click                :: 49;
    PS4_LeftPad_DPadNorth            :: 50;
    PS4_LeftPad_DPadSouth            :: 51;
    PS4_LeftPad_DPadWest             :: 52;
    PS4_LeftPad_DPadEast             :: 53;
    PS4_RightPad_Touch               :: 54;
    PS4_RightPad_Swipe               :: 55;
    PS4_RightPad_Click               :: 56;
    PS4_RightPad_DPadNorth           :: 57;
    PS4_RightPad_DPadSouth           :: 58;
    PS4_RightPad_DPadWest            :: 59;
    PS4_RightPad_DPadEast            :: 60;
    PS4_CenterPad_Touch              :: 61;
    PS4_CenterPad_Swipe              :: 62;
    PS4_CenterPad_Click              :: 63;
    PS4_CenterPad_DPadNorth          :: 64;
    PS4_CenterPad_DPadSouth          :: 65;
    PS4_CenterPad_DPadWest           :: 66;
    PS4_CenterPad_DPadEast           :: 67;
    PS4_LeftTrigger_Pull             :: 68;
    PS4_LeftTrigger_Click            :: 69;
    PS4_RightTrigger_Pull            :: 70;
    PS4_RightTrigger_Click           :: 71;
    PS4_LeftStick_Move               :: 72;
    PS4_LeftStick_Click              :: 73;
    PS4_LeftStick_DPadNorth          :: 74;
    PS4_LeftStick_DPadSouth          :: 75;
    PS4_LeftStick_DPadWest           :: 76;
    PS4_LeftStick_DPadEast           :: 77;
    PS4_RightStick_Move              :: 78;
    PS4_RightStick_Click             :: 79;
    PS4_RightStick_DPadNorth         :: 80;
    PS4_RightStick_DPadSouth         :: 81;
    PS4_RightStick_DPadWest          :: 82;
    PS4_RightStick_DPadEast          :: 83;
    PS4_DPad_North                   :: 84;
    PS4_DPad_South                   :: 85;
    PS4_DPad_West                    :: 86;
    PS4_DPad_East                    :: 87;
    PS4_Gyro_Move                    :: 88;
    PS4_Gyro_Pitch                   :: 89;
    PS4_Gyro_Yaw                     :: 90;
    PS4_Gyro_Roll                    :: 91;

    XBoxOne_A                        :: 92;
    XBoxOne_B                        :: 93;
    XBoxOne_X                        :: 94;
    XBoxOne_Y                        :: 95;
    XBoxOne_LeftBumper               :: 96;
    XBoxOne_RightBumper              :: 97;
    XBoxOne_Menu                     :: 98;
    XBoxOne_View                     :: 99;
    XBoxOne_LeftTrigger_Pull         :: 100;
    XBoxOne_LeftTrigger_Click        :: 101;
    XBoxOne_RightTrigger_Pull        :: 102;
    XBoxOne_RightTrigger_Click       :: 103;
    XBoxOne_LeftStick_Move           :: 104;
    XBoxOne_LeftStick_Click          :: 105;
    XBoxOne_LeftStick_DPadNorth      :: 106;
    XBoxOne_LeftStick_DPadSouth      :: 107;
    XBoxOne_LeftStick_DPadWest       :: 108;
    XBoxOne_LeftStick_DPadEast       :: 109;
    XBoxOne_RightStick_Move          :: 110;
    XBoxOne_RightStick_Click         :: 111;
    XBoxOne_RightStick_DPadNorth     :: 112;
    XBoxOne_RightStick_DPadSouth     :: 113;
    XBoxOne_RightStick_DPadWest      :: 114;
    XBoxOne_RightStick_DPadEast      :: 115;
    XBoxOne_DPad_North               :: 116;
    XBoxOne_DPad_South               :: 117;
    XBoxOne_DPad_West                :: 118;
    XBoxOne_DPad_East                :: 119;

    XBox360_A                        :: 120;
    XBox360_B                        :: 121;
    XBox360_X                        :: 122;
    XBox360_Y                        :: 123;
    XBox360_LeftBumper               :: 124;
    XBox360_RightBumper              :: 125;
    XBox360_Start                    :: 126;
    XBox360_Back                     :: 127;
    XBox360_LeftTrigger_Pull         :: 128;
    XBox360_LeftTrigger_Click        :: 129;
    XBox360_RightTrigger_Pull        :: 130;
    XBox360_RightTrigger_Click       :: 131;
    XBox360_LeftStick_Move           :: 132;
    XBox360_LeftStick_Click          :: 133;
    XBox360_LeftStick_DPadNorth      :: 134;
    XBox360_LeftStick_DPadSouth      :: 135;
    XBox360_LeftStick_DPadWest       :: 136;
    XBox360_LeftStick_DPadEast       :: 137;
    XBox360_RightStick_Move          :: 138;
    XBox360_RightStick_Click         :: 139;
    XBox360_RightStick_DPadNorth     :: 140;
    XBox360_RightStick_DPadSouth     :: 141;
    XBox360_RightStick_DPadWest      :: 142;
    XBox360_RightStick_DPadEast      :: 143;
    XBox360_DPad_North               :: 144;
    XBox360_DPad_South               :: 145;
    XBox360_DPad_West                :: 146;
    XBox360_DPad_East                :: 147;

    SteamV2_A                        :: 148;
    SteamV2_B                        :: 149;
    SteamV2_X                        :: 150;
    SteamV2_Y                        :: 151;
    SteamV2_LeftBumper               :: 152;
    SteamV2_RightBumper              :: 153;
    SteamV2_LeftGrip_Lower           :: 154;
    SteamV2_LeftGrip_Upper           :: 155;
    SteamV2_RightGrip_Lower          :: 156;
    SteamV2_RightGrip_Upper          :: 157;
    SteamV2_LeftBumper_Pressure      :: 158;
    SteamV2_RightBumper_Pressure     :: 159;
    SteamV2_LeftGrip_Pressure        :: 160;
    SteamV2_RightGrip_Pressure       :: 161;
    SteamV2_LeftGrip_Upper_Pressure  :: 162;
    SteamV2_RightGrip_Upper_Pressure :: 163;
    SteamV2_Start                    :: 164;
    SteamV2_Back                     :: 165;
    SteamV2_LeftPad_Touch            :: 166;
    SteamV2_LeftPad_Swipe            :: 167;
    SteamV2_LeftPad_Click            :: 168;
    SteamV2_LeftPad_Pressure         :: 169;
    SteamV2_LeftPad_DPadNorth        :: 170;
    SteamV2_LeftPad_DPadSouth        :: 171;
    SteamV2_LeftPad_DPadWest         :: 172;
    SteamV2_LeftPad_DPadEast         :: 173;
    SteamV2_RightPad_Touch           :: 174;
    SteamV2_RightPad_Swipe           :: 175;
    SteamV2_RightPad_Click           :: 176;
    SteamV2_RightPad_Pressure        :: 177;
    SteamV2_RightPad_DPadNorth       :: 178;
    SteamV2_RightPad_DPadSouth       :: 179;
    SteamV2_RightPad_DPadWest        :: 180;
    SteamV2_RightPad_DPadEast        :: 181;
    SteamV2_LeftTrigger_Pull         :: 182;
    SteamV2_LeftTrigger_Click        :: 183;
    SteamV2_RightTrigger_Pull        :: 184;
    SteamV2_RightTrigger_Click       :: 185;
    SteamV2_LeftStick_Move           :: 186;
    SteamV2_LeftStick_Click          :: 187;
    SteamV2_LeftStick_DPadNorth      :: 188;
    SteamV2_LeftStick_DPadSouth      :: 189;
    SteamV2_LeftStick_DPadWest       :: 190;
    SteamV2_LeftStick_DPadEast       :: 191;
    SteamV2_Gyro_Move                :: 192;
    SteamV2_Gyro_Pitch               :: 193;
    SteamV2_Gyro_Yaw                 :: 194;
    SteamV2_Gyro_Roll                :: 195;

    Switch_A                         :: 196;
    Switch_B                         :: 197;
    Switch_X                         :: 198;
    Switch_Y                         :: 199;
    Switch_LeftBumper                :: 200;
    Switch_RightBumper               :: 201;
    Switch_Plus                      :: 202;
    Switch_Minus                     :: 203;
    Switch_Capture                   :: 204;
    Switch_LeftTrigger_Pull          :: 205;
    Switch_LeftTrigger_Click         :: 206;
    Switch_RightTrigger_Pull         :: 207;
    Switch_RightTrigger_Click        :: 208;
    Switch_LeftStick_Move            :: 209;
    Switch_LeftStick_Click           :: 210;
    Switch_LeftStick_DPadNorth       :: 211;
    Switch_LeftStick_DPadSouth       :: 212;
    Switch_LeftStick_DPadWest        :: 213;
    Switch_LeftStick_DPadEast        :: 214;
    Switch_RightStick_Move           :: 215;
    Switch_RightStick_Click          :: 216;
    Switch_RightStick_DPadNorth      :: 217;
    Switch_RightStick_DPadSouth      :: 218;
    Switch_RightStick_DPadWest       :: 219;
    Switch_RightStick_DPadEast       :: 220;
    Switch_DPad_North                :: 221;
    Switch_DPad_South                :: 222;
    Switch_DPad_West                 :: 223;
    Switch_DPad_East                 :: 224;
    Switch_ProGyro_Move              :: 225;
    Switch_ProGyro_Pitch             :: 226;
    Switch_ProGyro_Yaw               :: 227;
    Switch_ProGyro_Roll              :: 228;

    Switch_RightGyro_Move            :: 229;
    Switch_RightGyro_Pitch           :: 230;
    Switch_RightGyro_Yaw             :: 231;
    Switch_RightGyro_Roll            :: 232;
    Switch_LeftGyro_Move             :: 233;
    Switch_LeftGyro_Pitch            :: 234;
    Switch_LeftGyro_Yaw              :: 235;
    Switch_LeftGyro_Roll             :: 236;
    Switch_LeftGrip_Lower            :: 237;
    Switch_LeftGrip_Upper            :: 238;
    Switch_RightGrip_Lower           :: 239;
    Switch_RightGrip_Upper           :: 240;

    PS4_DPad_Move                    :: 241;
    XBoxOne_DPad_Move                :: 242;
    XBox360_DPad_Move                :: 243;
    Switch_DPad_Move                 :: 244;

    PS5_X                            :: 245;
    PS5_Circle                       :: 246;
    PS5_Triangle                     :: 247;
    PS5_Square                       :: 248;
    PS5_LeftBumper                   :: 249;
    PS5_RightBumper                  :: 250;
    PS5_Option                       :: 251;
    PS5_Create                       :: 252;
    PS5_Mute                         :: 253;
    PS5_LeftPad_Touch                :: 254;
    PS5_LeftPad_Swipe                :: 255;
    PS5_LeftPad_Click                :: 256;
    PS5_LeftPad_DPadNorth            :: 257;
    PS5_LeftPad_DPadSouth            :: 258;
    PS5_LeftPad_DPadWest             :: 259;
    PS5_LeftPad_DPadEast             :: 260;
    PS5_RightPad_Touch               :: 261;
    PS5_RightPad_Swipe               :: 262;
    PS5_RightPad_Click               :: 263;
    PS5_RightPad_DPadNorth           :: 264;
    PS5_RightPad_DPadSouth           :: 265;
    PS5_RightPad_DPadWest            :: 266;
    PS5_RightPad_DPadEast            :: 267;
    PS5_CenterPad_Touch              :: 268;
    PS5_CenterPad_Swipe              :: 269;
    PS5_CenterPad_Click              :: 270;
    PS5_CenterPad_DPadNorth          :: 271;
    PS5_CenterPad_DPadSouth          :: 272;
    PS5_CenterPad_DPadWest           :: 273;
    PS5_CenterPad_DPadEast           :: 274;
    PS5_LeftTrigger_Pull             :: 275;
    PS5_LeftTrigger_Click            :: 276;
    PS5_RightTrigger_Pull            :: 277;
    PS5_RightTrigger_Click           :: 278;
    PS5_LeftStick_Move               :: 279;
    PS5_LeftStick_Click              :: 280;
    PS5_LeftStick_DPadNorth          :: 281;
    PS5_LeftStick_DPadSouth          :: 282;
    PS5_LeftStick_DPadWest           :: 283;
    PS5_LeftStick_DPadEast           :: 284;
    PS5_RightStick_Move              :: 285;
    PS5_RightStick_Click             :: 286;
    PS5_RightStick_DPadNorth         :: 287;
    PS5_RightStick_DPadSouth         :: 288;
    PS5_RightStick_DPadWest          :: 289;
    PS5_RightStick_DPadEast          :: 290;
    PS5_DPad_Move                    :: 291;
    PS5_DPad_North                   :: 292;
    PS5_DPad_South                   :: 293;
    PS5_DPad_West                    :: 294;
    PS5_DPad_East                    :: 295;
    PS5_Gyro_Move                    :: 296;
    PS5_Gyro_Pitch                   :: 297;
    PS5_Gyro_Yaw                     :: 298;
    PS5_Gyro_Roll                    :: 299;

    XBoxOne_LeftGrip_Lower           :: 300;
    XBoxOne_LeftGrip_Upper           :: 301;
    XBoxOne_RightGrip_Lower          :: 302;
    XBoxOne_RightGrip_Upper          :: 303;
    XBoxOne_Share                    :: 304;

    SteamDeck_A                      :: 305;
    SteamDeck_B                      :: 306;
    SteamDeck_X                      :: 307;
    SteamDeck_Y                      :: 308;
    SteamDeck_L1                     :: 309;
    SteamDeck_R1                     :: 310;
    SteamDeck_Menu                   :: 311;
    SteamDeck_View                   :: 312;
    SteamDeck_LeftPad_Touch          :: 313;
    SteamDeck_LeftPad_Swipe          :: 314;
    SteamDeck_LeftPad_Click          :: 315;
    SteamDeck_LeftPad_DPadNorth      :: 316;
    SteamDeck_LeftPad_DPadSouth      :: 317;
    SteamDeck_LeftPad_DPadWest       :: 318;
    SteamDeck_LeftPad_DPadEast       :: 319;
    SteamDeck_RightPad_Touch         :: 320;
    SteamDeck_RightPad_Swipe         :: 321;
    SteamDeck_RightPad_Click         :: 322;
    SteamDeck_RightPad_DPadNorth     :: 323;
    SteamDeck_RightPad_DPadSouth     :: 324;
    SteamDeck_RightPad_DPadWest      :: 325;
    SteamDeck_RightPad_DPadEast      :: 326;
    SteamDeck_L2_SoftPull            :: 327;
    SteamDeck_L2                     :: 328;
    SteamDeck_R2_SoftPull            :: 329;
    SteamDeck_R2                     :: 330;
    SteamDeck_LeftStick_Move         :: 331;
    SteamDeck_L3                     :: 332;
    SteamDeck_LeftStick_DPadNorth    :: 333;
    SteamDeck_LeftStick_DPadSouth    :: 334;
    SteamDeck_LeftStick_DPadWest     :: 335;
    SteamDeck_LeftStick_DPadEast     :: 336;
    SteamDeck_LeftStick_Touch        :: 337;
    SteamDeck_RightStick_Move        :: 338;
    SteamDeck_R3                     :: 339;
    SteamDeck_RightStick_DPadNorth   :: 340;
    SteamDeck_RightStick_DPadSouth   :: 341;
    SteamDeck_RightStick_DPadWest    :: 342;
    SteamDeck_RightStick_DPadEast    :: 343;
    SteamDeck_RightStick_Touch       :: 344;
    SteamDeck_L4                     :: 345;
    SteamDeck_R4                     :: 346;
    SteamDeck_L5                     :: 347;
    SteamDeck_R5                     :: 348;
    SteamDeck_DPad_Move              :: 349;
    SteamDeck_DPad_North             :: 350;
    SteamDeck_DPad_South             :: 351;
    SteamDeck_DPad_West              :: 352;
    SteamDeck_DPad_East              :: 353;
    SteamDeck_Gyro_Move              :: 354;
    SteamDeck_Gyro_Pitch             :: 355;
    SteamDeck_Gyro_Yaw               :: 356;
    SteamDeck_Gyro_Roll              :: 357;
    SteamDeck_Reserved1              :: 358;
    SteamDeck_Reserved2              :: 359;
    SteamDeck_Reserved3              :: 360;
    SteamDeck_Reserved4              :: 361;
    SteamDeck_Reserved5              :: 362;
    SteamDeck_Reserved6              :: 363;
    SteamDeck_Reserved7              :: 364;
    SteamDeck_Reserved8              :: 365;
    SteamDeck_Reserved9              :: 366;
    SteamDeck_Reserved10             :: 367;
    SteamDeck_Reserved11             :: 368;
    SteamDeck_Reserved12             :: 369;
    SteamDeck_Reserved13             :: 370;
    SteamDeck_Reserved14             :: 371;
    SteamDeck_Reserved15             :: 372;
    SteamDeck_Reserved16             :: 373;
    SteamDeck_Reserved17             :: 374;
    SteamDeck_Reserved18             :: 375;
    SteamDeck_Reserved19             :: 376;
    SteamDeck_Reserved20             :: 377;

    Switch_JoyConButton_N            :: 378;
    Switch_JoyConButton_E            :: 379;
    Switch_JoyConButton_S            :: 380;
    Switch_JoyConButton_W            :: 381;

    PS5_LeftGrip                     :: 382;
    PS5_RightGrip                    :: 383;
    PS5_LeftFn                       :: 384;
    PS5_RightFn                      :: 385;

    Count                            :: 386;
    MaximumPossibleValue             :: 32767;

    k_EControllerActionOrigin_None                             :: None;
    k_EControllerActionOrigin_A                                :: A;
    k_EControllerActionOrigin_B                                :: B;
    k_EControllerActionOrigin_X                                :: X;
    k_EControllerActionOrigin_Y                                :: Y;
    k_EControllerActionOrigin_LeftBumper                       :: LeftBumper;
    k_EControllerActionOrigin_RightBumper                      :: RightBumper;
    k_EControllerActionOrigin_LeftGrip                         :: LeftGrip;
    k_EControllerActionOrigin_RightGrip                        :: RightGrip;
    k_EControllerActionOrigin_Start                            :: Start;
    k_EControllerActionOrigin_Back                             :: Back;
    k_EControllerActionOrigin_LeftPad_Touch                    :: LeftPad_Touch;
    k_EControllerActionOrigin_LeftPad_Swipe                    :: LeftPad_Swipe;
    k_EControllerActionOrigin_LeftPad_Click                    :: LeftPad_Click;
    k_EControllerActionOrigin_LeftPad_DPadNorth                :: LeftPad_DPadNorth;
    k_EControllerActionOrigin_LeftPad_DPadSouth                :: LeftPad_DPadSouth;
    k_EControllerActionOrigin_LeftPad_DPadWest                 :: LeftPad_DPadWest;
    k_EControllerActionOrigin_LeftPad_DPadEast                 :: LeftPad_DPadEast;
    k_EControllerActionOrigin_RightPad_Touch                   :: RightPad_Touch;
    k_EControllerActionOrigin_RightPad_Swipe                   :: RightPad_Swipe;
    k_EControllerActionOrigin_RightPad_Click                   :: RightPad_Click;
    k_EControllerActionOrigin_RightPad_DPadNorth               :: RightPad_DPadNorth;
    k_EControllerActionOrigin_RightPad_DPadSouth               :: RightPad_DPadSouth;
    k_EControllerActionOrigin_RightPad_DPadWest                :: RightPad_DPadWest;
    k_EControllerActionOrigin_RightPad_DPadEast                :: RightPad_DPadEast;
    k_EControllerActionOrigin_LeftTrigger_Pull                 :: LeftTrigger_Pull;
    k_EControllerActionOrigin_LeftTrigger_Click                :: LeftTrigger_Click;
    k_EControllerActionOrigin_RightTrigger_Pull                :: RightTrigger_Pull;
    k_EControllerActionOrigin_RightTrigger_Click               :: RightTrigger_Click;
    k_EControllerActionOrigin_LeftStick_Move                   :: LeftStick_Move;
    k_EControllerActionOrigin_LeftStick_Click                  :: LeftStick_Click;
    k_EControllerActionOrigin_LeftStick_DPadNorth              :: LeftStick_DPadNorth;
    k_EControllerActionOrigin_LeftStick_DPadSouth              :: LeftStick_DPadSouth;
    k_EControllerActionOrigin_LeftStick_DPadWest               :: LeftStick_DPadWest;
    k_EControllerActionOrigin_LeftStick_DPadEast               :: LeftStick_DPadEast;
    k_EControllerActionOrigin_Gyro_Move                        :: Gyro_Move;
    k_EControllerActionOrigin_Gyro_Pitch                       :: Gyro_Pitch;
    k_EControllerActionOrigin_Gyro_Yaw                         :: Gyro_Yaw;
    k_EControllerActionOrigin_Gyro_Roll                        :: Gyro_Roll;

    k_EControllerActionOrigin_PS4_X                            :: PS4_X;
    k_EControllerActionOrigin_PS4_Circle                       :: PS4_Circle;
    k_EControllerActionOrigin_PS4_Triangle                     :: PS4_Triangle;
    k_EControllerActionOrigin_PS4_Square                       :: PS4_Square;
    k_EControllerActionOrigin_PS4_LeftBumper                   :: PS4_LeftBumper;
    k_EControllerActionOrigin_PS4_RightBumper                  :: PS4_RightBumper;
    k_EControllerActionOrigin_PS4_Options                      :: PS4_Options;
    k_EControllerActionOrigin_PS4_Share                        :: PS4_Share;
    k_EControllerActionOrigin_PS4_LeftPad_Touch                :: PS4_LeftPad_Touch;
    k_EControllerActionOrigin_PS4_LeftPad_Swipe                :: PS4_LeftPad_Swipe;
    k_EControllerActionOrigin_PS4_LeftPad_Click                :: PS4_LeftPad_Click;
    k_EControllerActionOrigin_PS4_LeftPad_DPadNorth            :: PS4_LeftPad_DPadNorth;
    k_EControllerActionOrigin_PS4_LeftPad_DPadSouth            :: PS4_LeftPad_DPadSouth;
    k_EControllerActionOrigin_PS4_LeftPad_DPadWest             :: PS4_LeftPad_DPadWest;
    k_EControllerActionOrigin_PS4_LeftPad_DPadEast             :: PS4_LeftPad_DPadEast;
    k_EControllerActionOrigin_PS4_RightPad_Touch               :: PS4_RightPad_Touch;
    k_EControllerActionOrigin_PS4_RightPad_Swipe               :: PS4_RightPad_Swipe;
    k_EControllerActionOrigin_PS4_RightPad_Click               :: PS4_RightPad_Click;
    k_EControllerActionOrigin_PS4_RightPad_DPadNorth           :: PS4_RightPad_DPadNorth;
    k_EControllerActionOrigin_PS4_RightPad_DPadSouth           :: PS4_RightPad_DPadSouth;
    k_EControllerActionOrigin_PS4_RightPad_DPadWest            :: PS4_RightPad_DPadWest;
    k_EControllerActionOrigin_PS4_RightPad_DPadEast            :: PS4_RightPad_DPadEast;
    k_EControllerActionOrigin_PS4_CenterPad_Touch              :: PS4_CenterPad_Touch;
    k_EControllerActionOrigin_PS4_CenterPad_Swipe              :: PS4_CenterPad_Swipe;
    k_EControllerActionOrigin_PS4_CenterPad_Click              :: PS4_CenterPad_Click;
    k_EControllerActionOrigin_PS4_CenterPad_DPadNorth          :: PS4_CenterPad_DPadNorth;
    k_EControllerActionOrigin_PS4_CenterPad_DPadSouth          :: PS4_CenterPad_DPadSouth;
    k_EControllerActionOrigin_PS4_CenterPad_DPadWest           :: PS4_CenterPad_DPadWest;
    k_EControllerActionOrigin_PS4_CenterPad_DPadEast           :: PS4_CenterPad_DPadEast;
    k_EControllerActionOrigin_PS4_LeftTrigger_Pull             :: PS4_LeftTrigger_Pull;
    k_EControllerActionOrigin_PS4_LeftTrigger_Click            :: PS4_LeftTrigger_Click;
    k_EControllerActionOrigin_PS4_RightTrigger_Pull            :: PS4_RightTrigger_Pull;
    k_EControllerActionOrigin_PS4_RightTrigger_Click           :: PS4_RightTrigger_Click;
    k_EControllerActionOrigin_PS4_LeftStick_Move               :: PS4_LeftStick_Move;
    k_EControllerActionOrigin_PS4_LeftStick_Click              :: PS4_LeftStick_Click;
    k_EControllerActionOrigin_PS4_LeftStick_DPadNorth          :: PS4_LeftStick_DPadNorth;
    k_EControllerActionOrigin_PS4_LeftStick_DPadSouth          :: PS4_LeftStick_DPadSouth;
    k_EControllerActionOrigin_PS4_LeftStick_DPadWest           :: PS4_LeftStick_DPadWest;
    k_EControllerActionOrigin_PS4_LeftStick_DPadEast           :: PS4_LeftStick_DPadEast;
    k_EControllerActionOrigin_PS4_RightStick_Move              :: PS4_RightStick_Move;
    k_EControllerActionOrigin_PS4_RightStick_Click             :: PS4_RightStick_Click;
    k_EControllerActionOrigin_PS4_RightStick_DPadNorth         :: PS4_RightStick_DPadNorth;
    k_EControllerActionOrigin_PS4_RightStick_DPadSouth         :: PS4_RightStick_DPadSouth;
    k_EControllerActionOrigin_PS4_RightStick_DPadWest          :: PS4_RightStick_DPadWest;
    k_EControllerActionOrigin_PS4_RightStick_DPadEast          :: PS4_RightStick_DPadEast;
    k_EControllerActionOrigin_PS4_DPad_North                   :: PS4_DPad_North;
    k_EControllerActionOrigin_PS4_DPad_South                   :: PS4_DPad_South;
    k_EControllerActionOrigin_PS4_DPad_West                    :: PS4_DPad_West;
    k_EControllerActionOrigin_PS4_DPad_East                    :: PS4_DPad_East;
    k_EControllerActionOrigin_PS4_Gyro_Move                    :: PS4_Gyro_Move;
    k_EControllerActionOrigin_PS4_Gyro_Pitch                   :: PS4_Gyro_Pitch;
    k_EControllerActionOrigin_PS4_Gyro_Yaw                     :: PS4_Gyro_Yaw;
    k_EControllerActionOrigin_PS4_Gyro_Roll                    :: PS4_Gyro_Roll;

    k_EControllerActionOrigin_XBoxOne_A                        :: XBoxOne_A;
    k_EControllerActionOrigin_XBoxOne_B                        :: XBoxOne_B;
    k_EControllerActionOrigin_XBoxOne_X                        :: XBoxOne_X;
    k_EControllerActionOrigin_XBoxOne_Y                        :: XBoxOne_Y;
    k_EControllerActionOrigin_XBoxOne_LeftBumper               :: XBoxOne_LeftBumper;
    k_EControllerActionOrigin_XBoxOne_RightBumper              :: XBoxOne_RightBumper;
    k_EControllerActionOrigin_XBoxOne_Menu                     :: XBoxOne_Menu;
    k_EControllerActionOrigin_XBoxOne_View                     :: XBoxOne_View;
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull         :: XBoxOne_LeftTrigger_Pull;
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click        :: XBoxOne_LeftTrigger_Click;
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull        :: XBoxOne_RightTrigger_Pull;
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Click       :: XBoxOne_RightTrigger_Click;
    k_EControllerActionOrigin_XBoxOne_LeftStick_Move           :: XBoxOne_LeftStick_Move;
    k_EControllerActionOrigin_XBoxOne_LeftStick_Click          :: XBoxOne_LeftStick_Click;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth      :: XBoxOne_LeftStick_DPadNorth;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth      :: XBoxOne_LeftStick_DPadSouth;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest       :: XBoxOne_LeftStick_DPadWest;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast       :: XBoxOne_LeftStick_DPadEast;
    k_EControllerActionOrigin_XBoxOne_RightStick_Move          :: XBoxOne_RightStick_Move;
    k_EControllerActionOrigin_XBoxOne_RightStick_Click         :: XBoxOne_RightStick_Click;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth     :: XBoxOne_RightStick_DPadNorth;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth     :: XBoxOne_RightStick_DPadSouth;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest      :: XBoxOne_RightStick_DPadWest;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast      :: XBoxOne_RightStick_DPadEast;
    k_EControllerActionOrigin_XBoxOne_DPad_North               :: XBoxOne_DPad_North;
    k_EControllerActionOrigin_XBoxOne_DPad_South               :: XBoxOne_DPad_South;
    k_EControllerActionOrigin_XBoxOne_DPad_West                :: XBoxOne_DPad_West;
    k_EControllerActionOrigin_XBoxOne_DPad_East                :: XBoxOne_DPad_East;

    k_EControllerActionOrigin_XBox360_A                        :: XBox360_A;
    k_EControllerActionOrigin_XBox360_B                        :: XBox360_B;
    k_EControllerActionOrigin_XBox360_X                        :: XBox360_X;
    k_EControllerActionOrigin_XBox360_Y                        :: XBox360_Y;
    k_EControllerActionOrigin_XBox360_LeftBumper               :: XBox360_LeftBumper;
    k_EControllerActionOrigin_XBox360_RightBumper              :: XBox360_RightBumper;
    k_EControllerActionOrigin_XBox360_Start                    :: XBox360_Start;
    k_EControllerActionOrigin_XBox360_Back                     :: XBox360_Back;
    k_EControllerActionOrigin_XBox360_LeftTrigger_Pull         :: XBox360_LeftTrigger_Pull;
    k_EControllerActionOrigin_XBox360_LeftTrigger_Click        :: XBox360_LeftTrigger_Click;
    k_EControllerActionOrigin_XBox360_RightTrigger_Pull        :: XBox360_RightTrigger_Pull;
    k_EControllerActionOrigin_XBox360_RightTrigger_Click       :: XBox360_RightTrigger_Click;
    k_EControllerActionOrigin_XBox360_LeftStick_Move           :: XBox360_LeftStick_Move;
    k_EControllerActionOrigin_XBox360_LeftStick_Click          :: XBox360_LeftStick_Click;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth      :: XBox360_LeftStick_DPadNorth;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth      :: XBox360_LeftStick_DPadSouth;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadWest       :: XBox360_LeftStick_DPadWest;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadEast       :: XBox360_LeftStick_DPadEast;
    k_EControllerActionOrigin_XBox360_RightStick_Move          :: XBox360_RightStick_Move;
    k_EControllerActionOrigin_XBox360_RightStick_Click         :: XBox360_RightStick_Click;
    k_EControllerActionOrigin_XBox360_RightStick_DPadNorth     :: XBox360_RightStick_DPadNorth;
    k_EControllerActionOrigin_XBox360_RightStick_DPadSouth     :: XBox360_RightStick_DPadSouth;
    k_EControllerActionOrigin_XBox360_RightStick_DPadWest      :: XBox360_RightStick_DPadWest;
    k_EControllerActionOrigin_XBox360_RightStick_DPadEast      :: XBox360_RightStick_DPadEast;
    k_EControllerActionOrigin_XBox360_DPad_North               :: XBox360_DPad_North;
    k_EControllerActionOrigin_XBox360_DPad_South               :: XBox360_DPad_South;
    k_EControllerActionOrigin_XBox360_DPad_West                :: XBox360_DPad_West;
    k_EControllerActionOrigin_XBox360_DPad_East                :: XBox360_DPad_East;

    k_EControllerActionOrigin_SteamV2_A                        :: SteamV2_A;
    k_EControllerActionOrigin_SteamV2_B                        :: SteamV2_B;
    k_EControllerActionOrigin_SteamV2_X                        :: SteamV2_X;
    k_EControllerActionOrigin_SteamV2_Y                        :: SteamV2_Y;
    k_EControllerActionOrigin_SteamV2_LeftBumper               :: SteamV2_LeftBumper;
    k_EControllerActionOrigin_SteamV2_RightBumper              :: SteamV2_RightBumper;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Lower           :: SteamV2_LeftGrip_Lower;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper           :: SteamV2_LeftGrip_Upper;
    k_EControllerActionOrigin_SteamV2_RightGrip_Lower          :: SteamV2_RightGrip_Lower;
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper          :: SteamV2_RightGrip_Upper;
    k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure      :: SteamV2_LeftBumper_Pressure;
    k_EControllerActionOrigin_SteamV2_RightBumper_Pressure     :: SteamV2_RightBumper_Pressure;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure        :: SteamV2_LeftGrip_Pressure;
    k_EControllerActionOrigin_SteamV2_RightGrip_Pressure       :: SteamV2_RightGrip_Pressure;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure  :: SteamV2_LeftGrip_Upper_Pressure;
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure :: SteamV2_RightGrip_Upper_Pressure;
    k_EControllerActionOrigin_SteamV2_Start                    :: SteamV2_Start;
    k_EControllerActionOrigin_SteamV2_Back                     :: SteamV2_Back;
    k_EControllerActionOrigin_SteamV2_LeftPad_Touch            :: SteamV2_LeftPad_Touch;
    k_EControllerActionOrigin_SteamV2_LeftPad_Swipe            :: SteamV2_LeftPad_Swipe;
    k_EControllerActionOrigin_SteamV2_LeftPad_Click            :: SteamV2_LeftPad_Click;
    k_EControllerActionOrigin_SteamV2_LeftPad_Pressure         :: SteamV2_LeftPad_Pressure;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth        :: SteamV2_LeftPad_DPadNorth;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth        :: SteamV2_LeftPad_DPadSouth;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest         :: SteamV2_LeftPad_DPadWest;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast         :: SteamV2_LeftPad_DPadEast;
    k_EControllerActionOrigin_SteamV2_RightPad_Touch           :: SteamV2_RightPad_Touch;
    k_EControllerActionOrigin_SteamV2_RightPad_Swipe           :: SteamV2_RightPad_Swipe;
    k_EControllerActionOrigin_SteamV2_RightPad_Click           :: SteamV2_RightPad_Click;
    k_EControllerActionOrigin_SteamV2_RightPad_Pressure        :: SteamV2_RightPad_Pressure;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth       :: SteamV2_RightPad_DPadNorth;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth       :: SteamV2_RightPad_DPadSouth;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadWest        :: SteamV2_RightPad_DPadWest;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadEast        :: SteamV2_RightPad_DPadEast;
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull         :: SteamV2_LeftTrigger_Pull;
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Click        :: SteamV2_LeftTrigger_Click;
    k_EControllerActionOrigin_SteamV2_RightTrigger_Pull        :: SteamV2_RightTrigger_Pull;
    k_EControllerActionOrigin_SteamV2_RightTrigger_Click       :: SteamV2_RightTrigger_Click;
    k_EControllerActionOrigin_SteamV2_LeftStick_Move           :: SteamV2_LeftStick_Move;
    k_EControllerActionOrigin_SteamV2_LeftStick_Click          :: SteamV2_LeftStick_Click;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth      :: SteamV2_LeftStick_DPadNorth;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth      :: SteamV2_LeftStick_DPadSouth;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest       :: SteamV2_LeftStick_DPadWest;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast       :: SteamV2_LeftStick_DPadEast;
    k_EControllerActionOrigin_SteamV2_Gyro_Move                :: SteamV2_Gyro_Move;
    k_EControllerActionOrigin_SteamV2_Gyro_Pitch               :: SteamV2_Gyro_Pitch;
    k_EControllerActionOrigin_SteamV2_Gyro_Yaw                 :: SteamV2_Gyro_Yaw;
    k_EControllerActionOrigin_SteamV2_Gyro_Roll                :: SteamV2_Gyro_Roll;

    k_EControllerActionOrigin_Switch_A                         :: Switch_A;
    k_EControllerActionOrigin_Switch_B                         :: Switch_B;
    k_EControllerActionOrigin_Switch_X                         :: Switch_X;
    k_EControllerActionOrigin_Switch_Y                         :: Switch_Y;
    k_EControllerActionOrigin_Switch_LeftBumper                :: Switch_LeftBumper;
    k_EControllerActionOrigin_Switch_RightBumper               :: Switch_RightBumper;
    k_EControllerActionOrigin_Switch_Plus                      :: Switch_Plus;
    k_EControllerActionOrigin_Switch_Minus                     :: Switch_Minus;
    k_EControllerActionOrigin_Switch_Capture                   :: Switch_Capture;
    k_EControllerActionOrigin_Switch_LeftTrigger_Pull          :: Switch_LeftTrigger_Pull;
    k_EControllerActionOrigin_Switch_LeftTrigger_Click         :: Switch_LeftTrigger_Click;
    k_EControllerActionOrigin_Switch_RightTrigger_Pull         :: Switch_RightTrigger_Pull;
    k_EControllerActionOrigin_Switch_RightTrigger_Click        :: Switch_RightTrigger_Click;
    k_EControllerActionOrigin_Switch_LeftStick_Move            :: Switch_LeftStick_Move;
    k_EControllerActionOrigin_Switch_LeftStick_Click           :: Switch_LeftStick_Click;
    k_EControllerActionOrigin_Switch_LeftStick_DPadNorth       :: Switch_LeftStick_DPadNorth;
    k_EControllerActionOrigin_Switch_LeftStick_DPadSouth       :: Switch_LeftStick_DPadSouth;
    k_EControllerActionOrigin_Switch_LeftStick_DPadWest        :: Switch_LeftStick_DPadWest;
    k_EControllerActionOrigin_Switch_LeftStick_DPadEast        :: Switch_LeftStick_DPadEast;
    k_EControllerActionOrigin_Switch_RightStick_Move           :: Switch_RightStick_Move;
    k_EControllerActionOrigin_Switch_RightStick_Click          :: Switch_RightStick_Click;
    k_EControllerActionOrigin_Switch_RightStick_DPadNorth      :: Switch_RightStick_DPadNorth;
    k_EControllerActionOrigin_Switch_RightStick_DPadSouth      :: Switch_RightStick_DPadSouth;
    k_EControllerActionOrigin_Switch_RightStick_DPadWest       :: Switch_RightStick_DPadWest;
    k_EControllerActionOrigin_Switch_RightStick_DPadEast       :: Switch_RightStick_DPadEast;
    k_EControllerActionOrigin_Switch_DPad_North                :: Switch_DPad_North;
    k_EControllerActionOrigin_Switch_DPad_South                :: Switch_DPad_South;
    k_EControllerActionOrigin_Switch_DPad_West                 :: Switch_DPad_West;
    k_EControllerActionOrigin_Switch_DPad_East                 :: Switch_DPad_East;
    k_EControllerActionOrigin_Switch_ProGyro_Move              :: Switch_ProGyro_Move;
    k_EControllerActionOrigin_Switch_ProGyro_Pitch             :: Switch_ProGyro_Pitch;
    k_EControllerActionOrigin_Switch_ProGyro_Yaw               :: Switch_ProGyro_Yaw;
    k_EControllerActionOrigin_Switch_ProGyro_Roll              :: Switch_ProGyro_Roll;

    k_EControllerActionOrigin_Switch_RightGyro_Move            :: Switch_RightGyro_Move;
    k_EControllerActionOrigin_Switch_RightGyro_Pitch           :: Switch_RightGyro_Pitch;
    k_EControllerActionOrigin_Switch_RightGyro_Yaw             :: Switch_RightGyro_Yaw;
    k_EControllerActionOrigin_Switch_RightGyro_Roll            :: Switch_RightGyro_Roll;
    k_EControllerActionOrigin_Switch_LeftGyro_Move             :: Switch_LeftGyro_Move;
    k_EControllerActionOrigin_Switch_LeftGyro_Pitch            :: Switch_LeftGyro_Pitch;
    k_EControllerActionOrigin_Switch_LeftGyro_Yaw              :: Switch_LeftGyro_Yaw;
    k_EControllerActionOrigin_Switch_LeftGyro_Roll             :: Switch_LeftGyro_Roll;
    k_EControllerActionOrigin_Switch_LeftGrip_Lower            :: Switch_LeftGrip_Lower;
    k_EControllerActionOrigin_Switch_LeftGrip_Upper            :: Switch_LeftGrip_Upper;
    k_EControllerActionOrigin_Switch_RightGrip_Lower           :: Switch_RightGrip_Lower;
    k_EControllerActionOrigin_Switch_RightGrip_Upper           :: Switch_RightGrip_Upper;

    k_EControllerActionOrigin_PS4_DPad_Move                    :: PS4_DPad_Move;
    k_EControllerActionOrigin_XBoxOne_DPad_Move                :: XBoxOne_DPad_Move;
    k_EControllerActionOrigin_XBox360_DPad_Move                :: XBox360_DPad_Move;
    k_EControllerActionOrigin_Switch_DPad_Move                 :: Switch_DPad_Move;

    k_EControllerActionOrigin_PS5_X                            :: PS5_X;
    k_EControllerActionOrigin_PS5_Circle                       :: PS5_Circle;
    k_EControllerActionOrigin_PS5_Triangle                     :: PS5_Triangle;
    k_EControllerActionOrigin_PS5_Square                       :: PS5_Square;
    k_EControllerActionOrigin_PS5_LeftBumper                   :: PS5_LeftBumper;
    k_EControllerActionOrigin_PS5_RightBumper                  :: PS5_RightBumper;
    k_EControllerActionOrigin_PS5_Option                       :: PS5_Option;
    k_EControllerActionOrigin_PS5_Create                       :: PS5_Create;
    k_EControllerActionOrigin_PS5_Mute                         :: PS5_Mute;
    k_EControllerActionOrigin_PS5_LeftPad_Touch                :: PS5_LeftPad_Touch;
    k_EControllerActionOrigin_PS5_LeftPad_Swipe                :: PS5_LeftPad_Swipe;
    k_EControllerActionOrigin_PS5_LeftPad_Click                :: PS5_LeftPad_Click;
    k_EControllerActionOrigin_PS5_LeftPad_DPadNorth            :: PS5_LeftPad_DPadNorth;
    k_EControllerActionOrigin_PS5_LeftPad_DPadSouth            :: PS5_LeftPad_DPadSouth;
    k_EControllerActionOrigin_PS5_LeftPad_DPadWest             :: PS5_LeftPad_DPadWest;
    k_EControllerActionOrigin_PS5_LeftPad_DPadEast             :: PS5_LeftPad_DPadEast;
    k_EControllerActionOrigin_PS5_RightPad_Touch               :: PS5_RightPad_Touch;
    k_EControllerActionOrigin_PS5_RightPad_Swipe               :: PS5_RightPad_Swipe;
    k_EControllerActionOrigin_PS5_RightPad_Click               :: PS5_RightPad_Click;
    k_EControllerActionOrigin_PS5_RightPad_DPadNorth           :: PS5_RightPad_DPadNorth;
    k_EControllerActionOrigin_PS5_RightPad_DPadSouth           :: PS5_RightPad_DPadSouth;
    k_EControllerActionOrigin_PS5_RightPad_DPadWest            :: PS5_RightPad_DPadWest;
    k_EControllerActionOrigin_PS5_RightPad_DPadEast            :: PS5_RightPad_DPadEast;
    k_EControllerActionOrigin_PS5_CenterPad_Touch              :: PS5_CenterPad_Touch;
    k_EControllerActionOrigin_PS5_CenterPad_Swipe              :: PS5_CenterPad_Swipe;
    k_EControllerActionOrigin_PS5_CenterPad_Click              :: PS5_CenterPad_Click;
    k_EControllerActionOrigin_PS5_CenterPad_DPadNorth          :: PS5_CenterPad_DPadNorth;
    k_EControllerActionOrigin_PS5_CenterPad_DPadSouth          :: PS5_CenterPad_DPadSouth;
    k_EControllerActionOrigin_PS5_CenterPad_DPadWest           :: PS5_CenterPad_DPadWest;
    k_EControllerActionOrigin_PS5_CenterPad_DPadEast           :: PS5_CenterPad_DPadEast;
    k_EControllerActionOrigin_PS5_LeftTrigger_Pull             :: PS5_LeftTrigger_Pull;
    k_EControllerActionOrigin_PS5_LeftTrigger_Click            :: PS5_LeftTrigger_Click;
    k_EControllerActionOrigin_PS5_RightTrigger_Pull            :: PS5_RightTrigger_Pull;
    k_EControllerActionOrigin_PS5_RightTrigger_Click           :: PS5_RightTrigger_Click;
    k_EControllerActionOrigin_PS5_LeftStick_Move               :: PS5_LeftStick_Move;
    k_EControllerActionOrigin_PS5_LeftStick_Click              :: PS5_LeftStick_Click;
    k_EControllerActionOrigin_PS5_LeftStick_DPadNorth          :: PS5_LeftStick_DPadNorth;
    k_EControllerActionOrigin_PS5_LeftStick_DPadSouth          :: PS5_LeftStick_DPadSouth;
    k_EControllerActionOrigin_PS5_LeftStick_DPadWest           :: PS5_LeftStick_DPadWest;
    k_EControllerActionOrigin_PS5_LeftStick_DPadEast           :: PS5_LeftStick_DPadEast;
    k_EControllerActionOrigin_PS5_RightStick_Move              :: PS5_RightStick_Move;
    k_EControllerActionOrigin_PS5_RightStick_Click             :: PS5_RightStick_Click;
    k_EControllerActionOrigin_PS5_RightStick_DPadNorth         :: PS5_RightStick_DPadNorth;
    k_EControllerActionOrigin_PS5_RightStick_DPadSouth         :: PS5_RightStick_DPadSouth;
    k_EControllerActionOrigin_PS5_RightStick_DPadWest          :: PS5_RightStick_DPadWest;
    k_EControllerActionOrigin_PS5_RightStick_DPadEast          :: PS5_RightStick_DPadEast;
    k_EControllerActionOrigin_PS5_DPad_Move                    :: PS5_DPad_Move;
    k_EControllerActionOrigin_PS5_DPad_North                   :: PS5_DPad_North;
    k_EControllerActionOrigin_PS5_DPad_South                   :: PS5_DPad_South;
    k_EControllerActionOrigin_PS5_DPad_West                    :: PS5_DPad_West;
    k_EControllerActionOrigin_PS5_DPad_East                    :: PS5_DPad_East;
    k_EControllerActionOrigin_PS5_Gyro_Move                    :: PS5_Gyro_Move;
    k_EControllerActionOrigin_PS5_Gyro_Pitch                   :: PS5_Gyro_Pitch;
    k_EControllerActionOrigin_PS5_Gyro_Yaw                     :: PS5_Gyro_Yaw;
    k_EControllerActionOrigin_PS5_Gyro_Roll                    :: PS5_Gyro_Roll;

    k_EControllerActionOrigin_XBoxOne_LeftGrip_Lower           :: XBoxOne_LeftGrip_Lower;
    k_EControllerActionOrigin_XBoxOne_LeftGrip_Upper           :: XBoxOne_LeftGrip_Upper;
    k_EControllerActionOrigin_XBoxOne_RightGrip_Lower          :: XBoxOne_RightGrip_Lower;
    k_EControllerActionOrigin_XBoxOne_RightGrip_Upper          :: XBoxOne_RightGrip_Upper;
    k_EControllerActionOrigin_XBoxOne_Share                    :: XBoxOne_Share;

    k_EControllerActionOrigin_SteamDeck_A                      :: SteamDeck_A;
    k_EControllerActionOrigin_SteamDeck_B                      :: SteamDeck_B;
    k_EControllerActionOrigin_SteamDeck_X                      :: SteamDeck_X;
    k_EControllerActionOrigin_SteamDeck_Y                      :: SteamDeck_Y;
    k_EControllerActionOrigin_SteamDeck_L1                     :: SteamDeck_L1;
    k_EControllerActionOrigin_SteamDeck_R1                     :: SteamDeck_R1;
    k_EControllerActionOrigin_SteamDeck_Menu                   :: SteamDeck_Menu;
    k_EControllerActionOrigin_SteamDeck_View                   :: SteamDeck_View;
    k_EControllerActionOrigin_SteamDeck_LeftPad_Touch          :: SteamDeck_LeftPad_Touch;
    k_EControllerActionOrigin_SteamDeck_LeftPad_Swipe          :: SteamDeck_LeftPad_Swipe;
    k_EControllerActionOrigin_SteamDeck_LeftPad_Click          :: SteamDeck_LeftPad_Click;
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadNorth      :: SteamDeck_LeftPad_DPadNorth;
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadSouth      :: SteamDeck_LeftPad_DPadSouth;
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadWest       :: SteamDeck_LeftPad_DPadWest;
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadEast       :: SteamDeck_LeftPad_DPadEast;
    k_EControllerActionOrigin_SteamDeck_RightPad_Touch         :: SteamDeck_RightPad_Touch;
    k_EControllerActionOrigin_SteamDeck_RightPad_Swipe         :: SteamDeck_RightPad_Swipe;
    k_EControllerActionOrigin_SteamDeck_RightPad_Click         :: SteamDeck_RightPad_Click;
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadNorth     :: SteamDeck_RightPad_DPadNorth;
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadSouth     :: SteamDeck_RightPad_DPadSouth;
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadWest      :: SteamDeck_RightPad_DPadWest;
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadEast      :: SteamDeck_RightPad_DPadEast;
    k_EControllerActionOrigin_SteamDeck_L2_SoftPull            :: SteamDeck_L2_SoftPull;
    k_EControllerActionOrigin_SteamDeck_L2                     :: SteamDeck_L2;
    k_EControllerActionOrigin_SteamDeck_R2_SoftPull            :: SteamDeck_R2_SoftPull;
    k_EControllerActionOrigin_SteamDeck_R2                     :: SteamDeck_R2;
    k_EControllerActionOrigin_SteamDeck_LeftStick_Move         :: SteamDeck_LeftStick_Move;
    k_EControllerActionOrigin_SteamDeck_L3                     :: SteamDeck_L3;
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadNorth    :: SteamDeck_LeftStick_DPadNorth;
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadSouth    :: SteamDeck_LeftStick_DPadSouth;
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadWest     :: SteamDeck_LeftStick_DPadWest;
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadEast     :: SteamDeck_LeftStick_DPadEast;
    k_EControllerActionOrigin_SteamDeck_LeftStick_Touch        :: SteamDeck_LeftStick_Touch;
    k_EControllerActionOrigin_SteamDeck_RightStick_Move        :: SteamDeck_RightStick_Move;
    k_EControllerActionOrigin_SteamDeck_R3                     :: SteamDeck_R3;
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadNorth   :: SteamDeck_RightStick_DPadNorth;
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadSouth   :: SteamDeck_RightStick_DPadSouth;
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadWest    :: SteamDeck_RightStick_DPadWest;
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadEast    :: SteamDeck_RightStick_DPadEast;
    k_EControllerActionOrigin_SteamDeck_RightStick_Touch       :: SteamDeck_RightStick_Touch;
    k_EControllerActionOrigin_SteamDeck_L4                     :: SteamDeck_L4;
    k_EControllerActionOrigin_SteamDeck_R4                     :: SteamDeck_R4;
    k_EControllerActionOrigin_SteamDeck_L5                     :: SteamDeck_L5;
    k_EControllerActionOrigin_SteamDeck_R5                     :: SteamDeck_R5;
    k_EControllerActionOrigin_SteamDeck_DPad_Move              :: SteamDeck_DPad_Move;
    k_EControllerActionOrigin_SteamDeck_DPad_North             :: SteamDeck_DPad_North;
    k_EControllerActionOrigin_SteamDeck_DPad_South             :: SteamDeck_DPad_South;
    k_EControllerActionOrigin_SteamDeck_DPad_West              :: SteamDeck_DPad_West;
    k_EControllerActionOrigin_SteamDeck_DPad_East              :: SteamDeck_DPad_East;
    k_EControllerActionOrigin_SteamDeck_Gyro_Move              :: SteamDeck_Gyro_Move;
    k_EControllerActionOrigin_SteamDeck_Gyro_Pitch             :: SteamDeck_Gyro_Pitch;
    k_EControllerActionOrigin_SteamDeck_Gyro_Yaw               :: SteamDeck_Gyro_Yaw;
    k_EControllerActionOrigin_SteamDeck_Gyro_Roll              :: SteamDeck_Gyro_Roll;
    k_EControllerActionOrigin_SteamDeck_Reserved1              :: SteamDeck_Reserved1;
    k_EControllerActionOrigin_SteamDeck_Reserved2              :: SteamDeck_Reserved2;
    k_EControllerActionOrigin_SteamDeck_Reserved3              :: SteamDeck_Reserved3;
    k_EControllerActionOrigin_SteamDeck_Reserved4              :: SteamDeck_Reserved4;
    k_EControllerActionOrigin_SteamDeck_Reserved5              :: SteamDeck_Reserved5;
    k_EControllerActionOrigin_SteamDeck_Reserved6              :: SteamDeck_Reserved6;
    k_EControllerActionOrigin_SteamDeck_Reserved7              :: SteamDeck_Reserved7;
    k_EControllerActionOrigin_SteamDeck_Reserved8              :: SteamDeck_Reserved8;
    k_EControllerActionOrigin_SteamDeck_Reserved9              :: SteamDeck_Reserved9;
    k_EControllerActionOrigin_SteamDeck_Reserved10             :: SteamDeck_Reserved10;
    k_EControllerActionOrigin_SteamDeck_Reserved11             :: SteamDeck_Reserved11;
    k_EControllerActionOrigin_SteamDeck_Reserved12             :: SteamDeck_Reserved12;
    k_EControllerActionOrigin_SteamDeck_Reserved13             :: SteamDeck_Reserved13;
    k_EControllerActionOrigin_SteamDeck_Reserved14             :: SteamDeck_Reserved14;
    k_EControllerActionOrigin_SteamDeck_Reserved15             :: SteamDeck_Reserved15;
    k_EControllerActionOrigin_SteamDeck_Reserved16             :: SteamDeck_Reserved16;
    k_EControllerActionOrigin_SteamDeck_Reserved17             :: SteamDeck_Reserved17;
    k_EControllerActionOrigin_SteamDeck_Reserved18             :: SteamDeck_Reserved18;
    k_EControllerActionOrigin_SteamDeck_Reserved19             :: SteamDeck_Reserved19;
    k_EControllerActionOrigin_SteamDeck_Reserved20             :: SteamDeck_Reserved20;

    k_EControllerActionOrigin_Switch_JoyConButton_N            :: Switch_JoyConButton_N;
    k_EControllerActionOrigin_Switch_JoyConButton_E            :: Switch_JoyConButton_E;
    k_EControllerActionOrigin_Switch_JoyConButton_S            :: Switch_JoyConButton_S;
    k_EControllerActionOrigin_Switch_JoyConButton_W            :: Switch_JoyConButton_W;

    k_EControllerActionOrigin_PS5_LeftGrip                     :: PS5_LeftGrip;
    k_EControllerActionOrigin_PS5_RightGrip                    :: PS5_RightGrip;
    k_EControllerActionOrigin_PS5_LeftFn                       :: PS5_LeftFn;
    k_EControllerActionOrigin_PS5_RightFn                      :: PS5_RightFn;

    k_EControllerActionOrigin_Count                            :: Count;
    k_EControllerActionOrigin_MaximumPossibleValue             :: MaximumPossibleValue;
}

ESteamControllerLEDFlag :: enum s32 {
    SetColor           :: 0;
    RestoreUserDefault :: 1;

    k_ESteamControllerLEDFlag_SetColor           :: SetColor;
    k_ESteamControllerLEDFlag_RestoreUserDefault :: RestoreUserDefault;
}

// ControllerHandle_t is used to refer to a specific controller.
// This handle will consistently identify a controller, even if it is disconnected and re-connected
ControllerHandle_t :: uint64;

// These handles are used to refer to a specific in-game action or action set
// All action handles should be queried during initialization for performance reasons
ControllerActionSetHandle_t :: uint64;
ControllerDigitalActionHandle_t :: uint64;
ControllerAnalogActionHandle_t :: uint64;

//-----------------------------------------------------------------------------
// Purpose: Steam Input API
//-----------------------------------------------------------------------------
ISteamController :: struct {
    vtable: *ISteamController_VTable;
}
ISteamController_VTable :: struct #type_info_none {
    Init: (this: *ISteamController) -> bool #cpp_method;
    Shutdown: (this: *ISteamController) -> bool #cpp_method;

    RunFrame: (this: *ISteamController) -> void #cpp_method;

    GetConnectedControllers: (this: *ISteamController, handlesOut: *ControllerHandle_t) -> s32 #cpp_method;

    GetActionSetHandle: (this: *ISteamController, pszActionSetName: *u8) -> ControllerActionSetHandle_t #cpp_method;

    ActivateActionSet: (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) -> void #cpp_method;
    GetCurrentActionSet: (this: *ISteamController, controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t #cpp_method;

    ActivateActionSetLayer: (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) -> void #cpp_method;
    DeactivateActionSetLayer: (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) -> void #cpp_method;
    DeactivateAllActionSetLayers: (this: *ISteamController, controllerHandle: ControllerHandle_t) -> void #cpp_method;

    GetActiveActionSetLayers: (this: *ISteamController, controllerHandle: ControllerHandle_t, handlesOut: *ControllerActionSetHandle_t) -> s32 #cpp_method;

    GetDigitalActionHandle: (this: *ISteamController, pszActionName: *u8) -> ControllerDigitalActionHandle_t #cpp_method;

    GetDigitalActionData: (this: *ISteamController, controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t #cpp_method;

    GetDigitalActionOrigins: (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 #cpp_method;

    GetAnalogActionHandle: (this: *ISteamController, pszActionName: *u8) -> ControllerAnalogActionHandle_t #cpp_method;

    GetAnalogActionData: (this: *ISteamController, controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t #cpp_method;

    GetAnalogActionOrigins: (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 #cpp_method;

    GetGlyphForActionOrigin: (this: *ISteamController, eOrigin: EControllerActionOrigin) -> *u8 #cpp_method;

    GetStringForActionOrigin: (this: *ISteamController, eOrigin: EControllerActionOrigin) -> *u8 #cpp_method;

    StopAnalogActionMomentum: (this: *ISteamController, controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) -> void #cpp_method;

    GetMotionData: (this: *ISteamController, controllerHandle: ControllerHandle_t) -> InputMotionData_t #cpp_method;

    TriggerHapticPulse: (this: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) -> void #cpp_method;

    TriggerRepeatedHapticPulse: (this: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) -> void #cpp_method;

    TriggerVibration: (this: *ISteamController, controllerHandle: ControllerHandle_t, usLeftSpeed: u16, usRightSpeed: u16) -> void #cpp_method;

    SetLEDColor: (this: *ISteamController, controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) -> void #cpp_method;

    ShowBindingPanel: (this: *ISteamController, controllerHandle: ControllerHandle_t) -> bool #cpp_method;

    GetInputTypeForHandle: (this: *ISteamController, controllerHandle: ControllerHandle_t) -> ESteamInputType #cpp_method;

    GetControllerForGamepadIndex: (this: *ISteamController, nIndex: s32) -> ControllerHandle_t #cpp_method;

    GetGamepadIndexForController: (this: *ISteamController, ulControllerHandle: ControllerHandle_t) -> s32 #cpp_method;

    GetStringForXboxOrigin: (this: *ISteamController, eOrigin: EXboxOrigin) -> *u8 #cpp_method;

    GetGlyphForXboxOrigin: (this: *ISteamController, eOrigin: EXboxOrigin) -> *u8 #cpp_method;

    GetActionOriginFromXboxOrigin: (this: *ISteamController, controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin #cpp_method;

    TranslateActionOrigin: (this: *ISteamController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin #cpp_method;

    GetControllerBindingRevision: (this: *ISteamController, controllerHandle: ControllerHandle_t, pMajor: *s32, pMinor: *s32) -> bool #cpp_method;
}

ISteamController_Init :: inline (this: *ISteamController) -> bool { return this.vtable.Init(this); }
ISteamController_Shutdown :: inline (this: *ISteamController) -> bool { return this.vtable.Shutdown(this); }

ISteamController_RunFrame :: inline (this: *ISteamController) { this.vtable.RunFrame(this); }

ISteamController_GetConnectedControllers :: inline (this: *ISteamController, handlesOut: *ControllerHandle_t) -> s32 { return this.vtable.GetConnectedControllers(this, handlesOut); }

ISteamController_GetActionSetHandle :: inline (this: *ISteamController, pszActionSetName: *u8) -> ControllerActionSetHandle_t { return this.vtable.GetActionSetHandle(this, pszActionSetName); }

ISteamController_ActivateActionSet :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) { this.vtable.ActivateActionSet(this, controllerHandle, actionSetHandle); }
ISteamController_GetCurrentActionSet :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t { return this.vtable.GetCurrentActionSet(this, controllerHandle); }

ISteamController_ActivateActionSetLayer :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) { this.vtable.ActivateActionSetLayer(this, controllerHandle, actionSetLayerHandle); }
ISteamController_DeactivateActionSetLayer :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) { this.vtable.DeactivateActionSetLayer(this, controllerHandle, actionSetLayerHandle); }
ISteamController_DeactivateAllActionSetLayers :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t) { this.vtable.DeactivateAllActionSetLayers(this, controllerHandle); }

ISteamController_GetActiveActionSetLayers :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, handlesOut: *ControllerActionSetHandle_t) -> s32 { return this.vtable.GetActiveActionSetLayers(this, controllerHandle, handlesOut); }

ISteamController_GetDigitalActionHandle :: inline (this: *ISteamController, pszActionName: *u8) -> ControllerDigitalActionHandle_t { return this.vtable.GetDigitalActionHandle(this, pszActionName); }

ISteamController_GetDigitalActionData :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t { return this.vtable.GetDigitalActionData(this, controllerHandle, digitalActionHandle); }

ISteamController_GetDigitalActionOrigins :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 { return this.vtable.GetDigitalActionOrigins(this, controllerHandle, actionSetHandle, digitalActionHandle, originsOut); }

ISteamController_GetAnalogActionHandle :: inline (this: *ISteamController, pszActionName: *u8) -> ControllerAnalogActionHandle_t { return this.vtable.GetAnalogActionHandle(this, pszActionName); }

ISteamController_GetAnalogActionData :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t { return this.vtable.GetAnalogActionData(this, controllerHandle, analogActionHandle); }

ISteamController_GetAnalogActionOrigins :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 { return this.vtable.GetAnalogActionOrigins(this, controllerHandle, actionSetHandle, analogActionHandle, originsOut); }

ISteamController_GetGlyphForActionOrigin :: inline (this: *ISteamController, eOrigin: EControllerActionOrigin) -> *u8 { return this.vtable.GetGlyphForActionOrigin(this, eOrigin); }

ISteamController_GetStringForActionOrigin :: inline (this: *ISteamController, eOrigin: EControllerActionOrigin) -> *u8 { return this.vtable.GetStringForActionOrigin(this, eOrigin); }

ISteamController_StopAnalogActionMomentum :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) { this.vtable.StopAnalogActionMomentum(this, controllerHandle, eAction); }

ISteamController_GetMotionData :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t) -> InputMotionData_t { return this.vtable.GetMotionData(this, controllerHandle); }

ISteamController_TriggerHapticPulse :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) { this.vtable.TriggerHapticPulse(this, controllerHandle, eTargetPad, usDurationMicroSec); }

ISteamController_TriggerRepeatedHapticPulse :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) { this.vtable.TriggerRepeatedHapticPulse(this, controllerHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags); }

ISteamController_TriggerVibration :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, usLeftSpeed: u16, usRightSpeed: u16) { this.vtable.TriggerVibration(this, controllerHandle, usLeftSpeed, usRightSpeed); }

ISteamController_SetLEDColor :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) { this.vtable.SetLEDColor(this, controllerHandle, nColorR, nColorG, nColorB, nFlags); }

ISteamController_ShowBindingPanel :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t) -> bool { return this.vtable.ShowBindingPanel(this, controllerHandle); }

ISteamController_GetInputTypeForHandle :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t) -> ESteamInputType { return this.vtable.GetInputTypeForHandle(this, controllerHandle); }

ISteamController_GetControllerForGamepadIndex :: inline (this: *ISteamController, nIndex: s32) -> ControllerHandle_t { return this.vtable.GetControllerForGamepadIndex(this, nIndex); }

ISteamController_GetGamepadIndexForController :: inline (this: *ISteamController, ulControllerHandle: ControllerHandle_t) -> s32 { return this.vtable.GetGamepadIndexForController(this, ulControllerHandle); }

ISteamController_GetStringForXboxOrigin :: inline (this: *ISteamController, eOrigin: EXboxOrigin) -> *u8 { return this.vtable.GetStringForXboxOrigin(this, eOrigin); }

ISteamController_GetGlyphForXboxOrigin :: inline (this: *ISteamController, eOrigin: EXboxOrigin) -> *u8 { return this.vtable.GetGlyphForXboxOrigin(this, eOrigin); }

ISteamController_GetActionOriginFromXboxOrigin :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin { return this.vtable.GetActionOriginFromXboxOrigin(this, controllerHandle, eOrigin); }

ISteamController_TranslateActionOrigin :: inline (this: *ISteamController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin { return this.vtable.TranslateActionOrigin(this, eDestinationInputType, eSourceOrigin); }

ISteamController_GetControllerBindingRevision :: inline (this: *ISteamController, controllerHandle: ControllerHandle_t, pMajor: *s32, pMinor: *s32) -> bool { return this.vtable.GetControllerBindingRevision(this, controllerHandle, pMajor, pMinor); }

vtable :: (obj: *ISteamController) -> *ISteamController_VTable { return obj.vtable; }


UGCQueryHandle_t :: uint64;
UGCUpdateHandle_t :: uint64;

k_UGCQueryHandleInvalid: UGCQueryHandle_t : 0xffff_ffff_ffff_ffff;
k_UGCUpdateHandleInvalid: UGCUpdateHandle_t : 0xffff_ffff_ffff_ffff;

// Matching UGC types for queries
EUGCMatchingUGCType :: enum s32 {
    Items              :: 0;
    Items_Mtx          :: 1;
    Items_ReadyToUse   :: 2;
    Collections        :: 3;
    Artwork            :: 4;
    Videos             :: 5;
    Screenshots        :: 6;
    AllGuides          :: 7;
    WebGuides          :: 8;
    IntegratedGuides   :: 9;
    UsableInGame       :: 10;
    ControllerBindings :: 11;
    GameManagedItems   :: 12;
    All                :: -1;

    k_EUGCMatchingUGCType_Items              :: Items;
    k_EUGCMatchingUGCType_Items_Mtx          :: Items_Mtx;
    k_EUGCMatchingUGCType_Items_ReadyToUse   :: Items_ReadyToUse;
    k_EUGCMatchingUGCType_Collections        :: Collections;
    k_EUGCMatchingUGCType_Artwork            :: Artwork;
    k_EUGCMatchingUGCType_Videos             :: Videos;
    k_EUGCMatchingUGCType_Screenshots        :: Screenshots;
    k_EUGCMatchingUGCType_AllGuides          :: AllGuides;
    k_EUGCMatchingUGCType_WebGuides          :: WebGuides;
    k_EUGCMatchingUGCType_IntegratedGuides   :: IntegratedGuides;
    k_EUGCMatchingUGCType_UsableInGame       :: UsableInGame;
    k_EUGCMatchingUGCType_ControllerBindings :: ControllerBindings;
    k_EUGCMatchingUGCType_GameManagedItems   :: GameManagedItems;
    k_EUGCMatchingUGCType_All                :: All;
}

// Different lists of published UGC for a user.
// If the current logged in user is different than the specified user, then some options may not be allowed.
EUserUGCList :: enum s32 {
    Published     :: 0;
    VotedOn       :: 1;
    VotedUp       :: 2;
    VotedDown     :: 3;
    WillVoteLater :: 4;
    Favorited     :: 5;
    Subscribed    :: 6;
    UsedOrPlayed  :: 7;
    Followed      :: 8;

    k_EUserUGCList_Published     :: Published;
    k_EUserUGCList_VotedOn       :: VotedOn;
    k_EUserUGCList_VotedUp       :: VotedUp;
    k_EUserUGCList_VotedDown     :: VotedDown;
    k_EUserUGCList_WillVoteLater :: WillVoteLater;
    k_EUserUGCList_Favorited     :: Favorited;
    k_EUserUGCList_Subscribed    :: Subscribed;
    k_EUserUGCList_UsedOrPlayed  :: UsedOrPlayed;
    k_EUserUGCList_Followed      :: Followed;
}

// Sort order for user published UGC lists (defaults to creation order descending)
EUserUGCListSortOrder :: enum s32 {
    CreationOrderDesc    :: 0;
    CreationOrderAsc     :: 1;
    TitleAsc             :: 2;
    LastUpdatedDesc      :: 3;
    SubscriptionDateDesc :: 4;
    VoteScoreDesc        :: 5;
    ForModeration        :: 6;

    k_EUserUGCListSortOrder_CreationOrderDesc    :: CreationOrderDesc;
    k_EUserUGCListSortOrder_CreationOrderAsc     :: CreationOrderAsc;
    k_EUserUGCListSortOrder_TitleAsc             :: TitleAsc;
    k_EUserUGCListSortOrder_LastUpdatedDesc      :: LastUpdatedDesc;
    k_EUserUGCListSortOrder_SubscriptionDateDesc :: SubscriptionDateDesc;
    k_EUserUGCListSortOrder_VoteScoreDesc        :: VoteScoreDesc;
    k_EUserUGCListSortOrder_ForModeration        :: ForModeration;
}

// Combination of sorting and filtering for queries across all UGC
EUGCQuery :: enum s32 {
    RankedByVote                                  :: 0;
    RankedByPublicationDate                       :: 1;
    AcceptedForGameRankedByAcceptanceDate         :: 2;
    RankedByTrend                                 :: 3;
    FavoritedByFriendsRankedByPublicationDate     :: 4;
    CreatedByFriendsRankedByPublicationDate       :: 5;
    RankedByNumTimesReported                      :: 6;
    CreatedByFollowedUsersRankedByPublicationDate :: 7;
    NotYetRated                                   :: 8;
    RankedByTotalVotesAsc                         :: 9;
    RankedByVotesUp                               :: 10;
    RankedByTextSearch                            :: 11;
    RankedByTotalUniqueSubscriptions              :: 12;
    RankedByPlaytimeTrend                         :: 13;
    RankedByTotalPlaytime                         :: 14;
    RankedByAveragePlaytimeTrend                  :: 15;
    RankedByLifetimeAveragePlaytime               :: 16;
    RankedByPlaytimeSessionsTrend                 :: 17;
    RankedByLifetimePlaytimeSessions              :: 18;
    RankedByLastUpdatedDate                       :: 19;

    k_EUGCQuery_RankedByVote                                  :: RankedByVote;
    k_EUGCQuery_RankedByPublicationDate                       :: RankedByPublicationDate;
    k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate         :: AcceptedForGameRankedByAcceptanceDate;
    k_EUGCQuery_RankedByTrend                                 :: RankedByTrend;
    k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate     :: FavoritedByFriendsRankedByPublicationDate;
    k_EUGCQuery_CreatedByFriendsRankedByPublicationDate       :: CreatedByFriendsRankedByPublicationDate;
    k_EUGCQuery_RankedByNumTimesReported                      :: RankedByNumTimesReported;
    k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate :: CreatedByFollowedUsersRankedByPublicationDate;
    k_EUGCQuery_NotYetRated                                   :: NotYetRated;
    k_EUGCQuery_RankedByTotalVotesAsc                         :: RankedByTotalVotesAsc;
    k_EUGCQuery_RankedByVotesUp                               :: RankedByVotesUp;
    k_EUGCQuery_RankedByTextSearch                            :: RankedByTextSearch;
    k_EUGCQuery_RankedByTotalUniqueSubscriptions              :: RankedByTotalUniqueSubscriptions;
    k_EUGCQuery_RankedByPlaytimeTrend                         :: RankedByPlaytimeTrend;
    k_EUGCQuery_RankedByTotalPlaytime                         :: RankedByTotalPlaytime;
    k_EUGCQuery_RankedByAveragePlaytimeTrend                  :: RankedByAveragePlaytimeTrend;
    k_EUGCQuery_RankedByLifetimeAveragePlaytime               :: RankedByLifetimeAveragePlaytime;
    k_EUGCQuery_RankedByPlaytimeSessionsTrend                 :: RankedByPlaytimeSessionsTrend;
    k_EUGCQuery_RankedByLifetimePlaytimeSessions              :: RankedByLifetimePlaytimeSessions;
    k_EUGCQuery_RankedByLastUpdatedDate                       :: RankedByLastUpdatedDate;
}

EItemUpdateStatus :: enum s32 {
    EItemUpdateStatusInvalid              :: 0;
    EItemUpdateStatusPreparingConfig      :: 1;
    EItemUpdateStatusPreparingContent     :: 2;
    EItemUpdateStatusUploadingContent     :: 3;
    EItemUpdateStatusUploadingPreviewFile :: 4;
    EItemUpdateStatusCommittingChanges    :: 5;

    k_EItemUpdateStatusInvalid              :: EItemUpdateStatusInvalid;
    k_EItemUpdateStatusPreparingConfig      :: EItemUpdateStatusPreparingConfig;
    k_EItemUpdateStatusPreparingContent     :: EItemUpdateStatusPreparingContent;
    k_EItemUpdateStatusUploadingContent     :: EItemUpdateStatusUploadingContent;
    k_EItemUpdateStatusUploadingPreviewFile :: EItemUpdateStatusUploadingPreviewFile;
    k_EItemUpdateStatusCommittingChanges    :: EItemUpdateStatusCommittingChanges;
}

EItemState :: enum s32 {
    EItemStateNone            :: 0;
    EItemStateSubscribed      :: 1;
    EItemStateLegacyItem      :: 2;
    EItemStateInstalled       :: 4;
    EItemStateNeedsUpdate     :: 8;
    EItemStateDownloading     :: 16;
    EItemStateDownloadPending :: 32;
    EItemStateDisabledLocally :: 64;

    k_EItemStateNone            :: EItemStateNone;
    k_EItemStateSubscribed      :: EItemStateSubscribed;
    k_EItemStateLegacyItem      :: EItemStateLegacyItem;
    k_EItemStateInstalled       :: EItemStateInstalled;
    k_EItemStateNeedsUpdate     :: EItemStateNeedsUpdate;
    k_EItemStateDownloading     :: EItemStateDownloading;
    k_EItemStateDownloadPending :: EItemStateDownloadPending;
    k_EItemStateDisabledLocally :: EItemStateDisabledLocally;
}

EItemStatistic :: enum s32 {
    NumSubscriptions                    :: 0;
    NumFavorites                        :: 1;
    NumFollowers                        :: 2;
    NumUniqueSubscriptions              :: 3;
    NumUniqueFavorites                  :: 4;
    NumUniqueFollowers                  :: 5;
    NumUniqueWebsiteViews               :: 6;
    ReportScore                         :: 7;
    NumSecondsPlayed                    :: 8;
    NumPlaytimeSessions                 :: 9;
    NumComments                         :: 10;
    NumSecondsPlayedDuringTimePeriod    :: 11;
    NumPlaytimeSessionsDuringTimePeriod :: 12;

    k_EItemStatistic_NumSubscriptions                    :: NumSubscriptions;
    k_EItemStatistic_NumFavorites                        :: NumFavorites;
    k_EItemStatistic_NumFollowers                        :: NumFollowers;
    k_EItemStatistic_NumUniqueSubscriptions              :: NumUniqueSubscriptions;
    k_EItemStatistic_NumUniqueFavorites                  :: NumUniqueFavorites;
    k_EItemStatistic_NumUniqueFollowers                  :: NumUniqueFollowers;
    k_EItemStatistic_NumUniqueWebsiteViews               :: NumUniqueWebsiteViews;
    k_EItemStatistic_ReportScore                         :: ReportScore;
    k_EItemStatistic_NumSecondsPlayed                    :: NumSecondsPlayed;
    k_EItemStatistic_NumPlaytimeSessions                 :: NumPlaytimeSessions;
    k_EItemStatistic_NumComments                         :: NumComments;
    k_EItemStatistic_NumSecondsPlayedDuringTimePeriod    :: NumSecondsPlayedDuringTimePeriod;
    k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod :: NumPlaytimeSessionsDuringTimePeriod;
}

EItemPreviewType :: enum s32 {
    Image                          :: 0;
    YouTubeVideo                   :: 1;
    Sketchfab                      :: 2;
    EnvironmentMap_HorizontalCross :: 3;

    EnvironmentMap_LatLong         :: 4;
    Clip                           :: 5;
    ReservedMax                    :: 255;

    k_EItemPreviewType_Image                          :: Image;
    k_EItemPreviewType_YouTubeVideo                   :: YouTubeVideo;
    k_EItemPreviewType_Sketchfab                      :: Sketchfab;
    k_EItemPreviewType_EnvironmentMap_HorizontalCross :: EnvironmentMap_HorizontalCross;

    k_EItemPreviewType_EnvironmentMap_LatLong         :: EnvironmentMap_LatLong;
    k_EItemPreviewType_Clip                           :: Clip;
    k_EItemPreviewType_ReservedMax                    :: ReservedMax;
}

EUGCContentDescriptorID :: enum s32 {
    NudityOrSexualContent   :: 1;
    FrequentViolenceOrGore  :: 2;
    AdultOnlySexualContent  :: 3;
    GratuitousSexualContent :: 4;
    AnyMatureContent        :: 5;

    k_EUGCContentDescriptor_NudityOrSexualContent   :: NudityOrSexualContent;
    k_EUGCContentDescriptor_FrequentViolenceOrGore  :: FrequentViolenceOrGore;
    k_EUGCContentDescriptor_AdultOnlySexualContent  :: AdultOnlySexualContent;
    k_EUGCContentDescriptor_GratuitousSexualContent :: GratuitousSexualContent;
    k_EUGCContentDescriptor_AnyMatureContent        :: AnyMatureContent;
}

kNumUGCResultsPerPage: uint32 : 50;
k_cchDeveloperMetadataMax: uint32 : 5000;

// Details for a single published file/UGC
SteamUGCDetails_t :: struct {
    m_nPublishedFileId:     PublishedFileId_t;
    m_eResult:              EResult; // The result of the operation.	
    m_eFileType:            EWorkshopFileType; // Type of the file
    m_nCreatorAppID:        AppId_t; // ID of the app that created this file.
    m_nConsumerAppID:       AppId_t; // ID of the app that will consume this file.
    m_rgchTitle:            [129] u8; // title of document
    m_rgchDescription:      [8000] u8; // description of document
    m_ulSteamIDOwner:       uint64; // Steam ID of the user who created this content.
    m_rtimeCreated:         uint32; // time when the published file was created
    m_rtimeUpdated:         uint32; // time when the published file was last updated
    m_rtimeAddedToUserList: uint32; // time when the user added the published file to their list (not always applicable)
    m_eVisibility:          ERemoteStoragePublishedFileVisibility; // visibility
    m_bBanned:              bool; // whether the file was banned
    m_bAcceptedForUse:      bool; // developer has specifically flagged this item as accepted in the Workshop
    m_bTagsTruncated:       bool; // whether the list of tags was too long to be returned in the provided buffer
    m_rgchTags:             [1025] u8; // comma separated list of all tags associated with this file	

    m_hFile:                UGCHandle_t; // The handle of the primary file
    m_hPreviewFile:         UGCHandle_t; // The handle of the preview file
    m_pchFileName:          [260] u8; // The cloud filename of the primary file
    m_nFileSize:            int32; // Size of the primary file (for legacy items which only support one file). This may not be accurate for non-legacy items which can be greater than 4gb in size.
    m_nPreviewFileSize:     int32; // Size of the preview file
    m_rgchURL:              [256] u8; // URL (for a video or a website)

    m_unVotesUp:            uint32; // number of votes up
    m_unVotesDown:          uint32; // number of votes down
    m_flScore:              float; // calculated score

    // collection details
    m_unNumChildren:        uint32;
    m_ulTotalFilesSize:     uint64; // Total size of all files (non-legacy), excluding the preview file
}

//-----------------------------------------------------------------------------
// Purpose: Steam UGC support API
//-----------------------------------------------------------------------------
ISteamUGC :: struct {
    vtable: *ISteamUGC_VTable;
}
ISteamUGC_VTable :: struct #type_info_none {
    CreateQueryUserUGCRequest: (this: *ISteamUGC, unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #cpp_method;

    CreateQueryAllUGCRequest: (this: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *u8 = null) -> UGCQueryHandle_t #cpp_method;

    CreateQueryAllUGCRequest_1: (this: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #cpp_method;

    CreateQueryUGCDetailsRequest: (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t #cpp_method;

    SendQueryUGCRequest: (this: *ISteamUGC, handle: UGCQueryHandle_t) -> SteamAPICall_t #cpp_method;

    GetQueryUGCResult: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool #cpp_method;
    GetQueryUGCNumTags: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #cpp_method;
    GetQueryUGCTag: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *u8, cchValueSize: uint32) -> bool #cpp_method;
    GetQueryUGCTagDisplayName: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *u8, cchValueSize: uint32) -> bool #cpp_method;
    GetQueryUGCPreviewURL: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchURL: *u8, cchURLSize: uint32) -> bool #cpp_method;
    GetQueryUGCMetadata: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchMetadata: *u8, cchMetadatasize: uint32) -> bool #cpp_method;
    GetQueryUGCChildren: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool #cpp_method;
    GetQueryUGCStatistic: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool #cpp_method;
    GetQueryUGCNumAdditionalPreviews: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #cpp_method;
    GetQueryUGCAdditionalPreview: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *u8, cchURLSize: uint32, pchOriginalFileName: *u8, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool #cpp_method;
    GetQueryUGCNumKeyValueTags: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #cpp_method;

    GetQueryUGCKeyValueTag: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchKey: *u8, pchValue: *u8, cchValueSize: uint32) -> bool #cpp_method;

    GetQueryUGCKeyValueTag_1: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *u8, cchKeySize: uint32, pchValue: *u8, cchValueSize: uint32) -> bool #cpp_method;

    GetNumSupportedGameVersions: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #cpp_method;
    GetSupportedGameVersionData: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, versionIndex: uint32, pchGameBranchMin: *u8, pchGameBranchMax: *u8, cchGameBranchSize: uint32) -> bool #cpp_method;

    GetQueryUGCContentDescriptors: (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecDescriptors: *EUGCContentDescriptorID, cMaxEntries: uint32) -> uint32 #cpp_method;

    ReleaseQueryUGCRequest: (this: *ISteamUGC, handle: UGCQueryHandle_t) -> bool #cpp_method;

    AddRequiredTag: (this: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *u8) -> bool #cpp_method;
    AddRequiredTagGroup: (this: *ISteamUGC, handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool #cpp_method;
    AddExcludedTag: (this: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *u8) -> bool #cpp_method;
    SetReturnOnlyIDs: (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool #cpp_method;
    SetReturnKeyValueTags: (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool #cpp_method;
    SetReturnLongDescription: (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool #cpp_method;
    SetReturnMetadata: (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool #cpp_method;
    SetReturnChildren: (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool #cpp_method;
    SetReturnAdditionalPreviews: (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool #cpp_method;
    SetReturnTotalOnly: (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool #cpp_method;
    SetReturnPlaytimeStats: (this: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool #cpp_method;
    SetLanguage: (this: *ISteamUGC, handle: UGCQueryHandle_t, pchLanguage: *u8) -> bool #cpp_method;
    SetAllowCachedResponse: (this: *ISteamUGC, handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool #cpp_method;
    SetAdminQuery: (this: *ISteamUGC, handle: UGCUpdateHandle_t, bAdminQuery: bool) -> bool #cpp_method;

    SetCloudFileNameFilter: (this: *ISteamUGC, handle: UGCQueryHandle_t, pMatchCloudFileName: *u8) -> bool #cpp_method;

    SetMatchAnyTag: (this: *ISteamUGC, handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool #cpp_method;
    SetSearchText: (this: *ISteamUGC, handle: UGCQueryHandle_t, pSearchText: *u8) -> bool #cpp_method;
    SetRankedByTrendDays: (this: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool #cpp_method;
    SetTimeCreatedDateRange: (this: *ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool #cpp_method;
    SetTimeUpdatedDateRange: (this: *ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool #cpp_method;
    AddRequiredKeyValueTag: (this: *ISteamUGC, handle: UGCQueryHandle_t, pKey: *u8, pValue: *u8) -> bool #cpp_method;

    RequestUGCDetails: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t #cpp_method;

    CreateItem: (this: *ISteamUGC, nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t #cpp_method;

    StartItemUpdate: (this: *ISteamUGC, nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t #cpp_method;

    SetItemTitle: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchTitle: *u8) -> bool #cpp_method;
    SetItemDescription: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchDescription: *u8) -> bool #cpp_method;
    SetItemUpdateLanguage: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchLanguage: *u8) -> bool #cpp_method;
    SetItemMetadata: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchMetaData: *u8) -> bool #cpp_method;
    SetItemVisibility: (this: *ISteamUGC, handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #cpp_method;
    SetItemTags: (this: *ISteamUGC, updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t, bAllowAdminTags := false) -> bool #cpp_method;
    SetItemContent: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszContentFolder: *u8) -> bool #cpp_method;
    SetItemPreview: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *u8) -> bool #cpp_method;
    SetAllowLegacyUpload: (this: *ISteamUGC, handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool #cpp_method;
    RemoveAllItemKeyValueTags: (this: *ISteamUGC, handle: UGCUpdateHandle_t) -> bool #cpp_method;
    RemoveItemKeyValueTags: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *u8) -> bool #cpp_method;
    AddItemKeyValueTag: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *u8, pchValue: *u8) -> bool #cpp_method;
    AddItemPreviewFile: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *u8, type: EItemPreviewType) -> bool #cpp_method;
    AddItemPreviewVideo: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszVideoID: *u8) -> bool #cpp_method;
    UpdateItemPreviewFile: (this: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *u8) -> bool #cpp_method;
    UpdateItemPreviewVideo: (this: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *u8) -> bool #cpp_method;
    RemoveItemPreview: (this: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32) -> bool #cpp_method;
    AddContentDescriptor: (this: *ISteamUGC, handle: UGCUpdateHandle_t, descid: EUGCContentDescriptorID) -> bool #cpp_method;
    RemoveContentDescriptor: (this: *ISteamUGC, handle: UGCUpdateHandle_t, descid: EUGCContentDescriptorID) -> bool #cpp_method;
    SetRequiredGameVersions: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszGameBranchMin: *u8, pszGameBranchMax: *u8) -> bool #cpp_method;

    SubmitItemUpdate: (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchChangeNote: *u8) -> SteamAPICall_t #cpp_method;
    GetItemUpdateProgress: (this: *ISteamUGC, handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus #cpp_method;

    SetUserItemVote: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #cpp_method;

    GetUserItemVote: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    AddItemToFavorites: (this: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    RemoveItemFromFavorites: (this: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    SubscribeItem: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    UnsubscribeItem: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;
    GetNumSubscribedItems: (this: *ISteamUGC) -> uint32 #cpp_method;
    GetSubscribedItems: (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 #cpp_method;

    GetItemState: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> uint32 #cpp_method;

    GetItemInstallInfo: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *u8, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool #cpp_method;

    GetItemDownloadInfo: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #cpp_method;

    DownloadItem: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool #cpp_method;

    BInitWorkshopForGameServer: (this: *ISteamUGC, unWorkshopDepotID: DepotId_t, pszFolder: *u8) -> bool #cpp_method;

    SuspendDownloads: (this: *ISteamUGC, bSuspend: bool) -> void #cpp_method;

    StartPlaytimeTracking: (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #cpp_method;

    StopPlaytimeTracking: (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #cpp_method;

    StopPlaytimeTrackingForAllItems: (this: *ISteamUGC) -> SteamAPICall_t #cpp_method;

    AddDependency: (this: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    RemoveDependency: (this: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    AddAppDependency: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #cpp_method;

    RemoveAppDependency: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #cpp_method;

    GetAppDependencies: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    DeleteItem: (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #cpp_method;

    ShowWorkshopEULA: (this: *ISteamUGC) -> bool #cpp_method;

    GetWorkshopEULAStatus: (this: *ISteamUGC) -> SteamAPICall_t #cpp_method;

    GetUserContentDescriptorPreferences: (this: *ISteamUGC, pvecDescriptors: *EUGCContentDescriptorID, cMaxEntries: uint32) -> uint32 #cpp_method;
}

ISteamUGC_CreateQueryUserUGCRequest :: inline (this: *ISteamUGC, unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t { return this.vtable.CreateQueryUserUGCRequest(this, unAccountID, eListType, eMatchingUGCType, eSortOrder, nCreatorAppID, nConsumerAppID, unPage); }

ISteamUGC_CreateQueryAllUGCRequest :: inline (this: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: /*const*/ *u8 = null) -> UGCQueryHandle_t { return this.vtable.CreateQueryAllUGCRequest(this, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, pchCursor); }

ISteamUGC_CreateQueryAllUGCRequest_1 :: inline (this: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t { return this.vtable.CreateQueryAllUGCRequest_1(this, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, unPage); }

ISteamUGC_CreateQueryUGCDetailsRequest :: inline (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t { return this.vtable.CreateQueryUGCDetailsRequest(this, pvecPublishedFileID, unNumPublishedFileIDs); }

ISteamUGC_SendQueryUGCRequest :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t) -> SteamAPICall_t { return this.vtable.SendQueryUGCRequest(this, handle); }

ISteamUGC_GetQueryUGCResult :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool { return this.vtable.GetQueryUGCResult(this, handle, index, pDetails); }
ISteamUGC_GetQueryUGCNumTags :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 { return this.vtable.GetQueryUGCNumTags(this, handle, index); }
ISteamUGC_GetQueryUGCTag :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *u8, cchValueSize: uint32) -> bool { return this.vtable.GetQueryUGCTag(this, handle, index, indexTag, pchValue, cchValueSize); }
ISteamUGC_GetQueryUGCTagDisplayName :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *u8, cchValueSize: uint32) -> bool { return this.vtable.GetQueryUGCTagDisplayName(this, handle, index, indexTag, pchValue, cchValueSize); }
ISteamUGC_GetQueryUGCPreviewURL :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchURL: *u8, cchURLSize: uint32) -> bool { return this.vtable.GetQueryUGCPreviewURL(this, handle, index, pchURL, cchURLSize); }
ISteamUGC_GetQueryUGCMetadata :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchMetadata: *u8, cchMetadatasize: uint32) -> bool { return this.vtable.GetQueryUGCMetadata(this, handle, index, pchMetadata, cchMetadatasize); }
ISteamUGC_GetQueryUGCChildren :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool { return this.vtable.GetQueryUGCChildren(this, handle, index, pvecPublishedFileID, cMaxEntries); }
ISteamUGC_GetQueryUGCStatistic :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool { return this.vtable.GetQueryUGCStatistic(this, handle, index, eStatType, pStatValue); }
ISteamUGC_GetQueryUGCNumAdditionalPreviews :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 { return this.vtable.GetQueryUGCNumAdditionalPreviews(this, handle, index); }
ISteamUGC_GetQueryUGCAdditionalPreview :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *u8, cchURLSize: uint32, pchOriginalFileName: *u8, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool { return this.vtable.GetQueryUGCAdditionalPreview(this, handle, index, previewIndex, pchURLOrVideoID, cchURLSize, pchOriginalFileName, cchOriginalFileNameSize, pPreviewType); }
ISteamUGC_GetQueryUGCNumKeyValueTags :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 { return this.vtable.GetQueryUGCNumKeyValueTags(this, handle, index); }

ISteamUGC_GetQueryUGCKeyValueTag :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchKey: /*const*/ *u8, pchValue: *u8, cchValueSize: uint32) -> bool { return this.vtable.GetQueryUGCKeyValueTag(this, handle, index, pchKey, pchValue, cchValueSize); }

ISteamUGC_GetQueryUGCKeyValueTag_1 :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *u8, cchKeySize: uint32, pchValue: *u8, cchValueSize: uint32) -> bool { return this.vtable.GetQueryUGCKeyValueTag_1(this, handle, index, keyValueTagIndex, pchKey, cchKeySize, pchValue, cchValueSize); }

ISteamUGC_GetNumSupportedGameVersions :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 { return this.vtable.GetNumSupportedGameVersions(this, handle, index); }
ISteamUGC_GetSupportedGameVersionData :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, versionIndex: uint32, pchGameBranchMin: *u8, pchGameBranchMax: *u8, cchGameBranchSize: uint32) -> bool { return this.vtable.GetSupportedGameVersionData(this, handle, index, versionIndex, pchGameBranchMin, pchGameBranchMax, cchGameBranchSize); }

ISteamUGC_GetQueryUGCContentDescriptors :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecDescriptors: *EUGCContentDescriptorID, cMaxEntries: uint32) -> uint32 { return this.vtable.GetQueryUGCContentDescriptors(this, handle, index, pvecDescriptors, cMaxEntries); }

ISteamUGC_ReleaseQueryUGCRequest :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t) -> bool { return this.vtable.ReleaseQueryUGCRequest(this, handle); }

ISteamUGC_AddRequiredTag :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *u8) -> bool { return this.vtable.AddRequiredTag(this, handle, pTagName); }
ISteamUGC_AddRequiredTagGroup :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool { return this.vtable.AddRequiredTagGroup(this, handle, pTagGroups); }
ISteamUGC_AddExcludedTag :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *u8) -> bool { return this.vtable.AddExcludedTag(this, handle, pTagName); }
ISteamUGC_SetReturnOnlyIDs :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool { return this.vtable.SetReturnOnlyIDs(this, handle, bReturnOnlyIDs); }
ISteamUGC_SetReturnKeyValueTags :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool { return this.vtable.SetReturnKeyValueTags(this, handle, bReturnKeyValueTags); }
ISteamUGC_SetReturnLongDescription :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool { return this.vtable.SetReturnLongDescription(this, handle, bReturnLongDescription); }
ISteamUGC_SetReturnMetadata :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool { return this.vtable.SetReturnMetadata(this, handle, bReturnMetadata); }
ISteamUGC_SetReturnChildren :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool { return this.vtable.SetReturnChildren(this, handle, bReturnChildren); }
ISteamUGC_SetReturnAdditionalPreviews :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool { return this.vtable.SetReturnAdditionalPreviews(this, handle, bReturnAdditionalPreviews); }
ISteamUGC_SetReturnTotalOnly :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool { return this.vtable.SetReturnTotalOnly(this, handle, bReturnTotalOnly); }
ISteamUGC_SetReturnPlaytimeStats :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool { return this.vtable.SetReturnPlaytimeStats(this, handle, unDays); }
ISteamUGC_SetLanguage :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, pchLanguage: *u8) -> bool { return this.vtable.SetLanguage(this, handle, pchLanguage); }
ISteamUGC_SetAllowCachedResponse :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool { return this.vtable.SetAllowCachedResponse(this, handle, unMaxAgeSeconds); }
ISteamUGC_SetAdminQuery :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, bAdminQuery: bool) -> bool { return this.vtable.SetAdminQuery(this, handle, bAdminQuery); }

ISteamUGC_SetCloudFileNameFilter :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, pMatchCloudFileName: *u8) -> bool { return this.vtable.SetCloudFileNameFilter(this, handle, pMatchCloudFileName); }

ISteamUGC_SetMatchAnyTag :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool { return this.vtable.SetMatchAnyTag(this, handle, bMatchAnyTag); }
ISteamUGC_SetSearchText :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, pSearchText: *u8) -> bool { return this.vtable.SetSearchText(this, handle, pSearchText); }
ISteamUGC_SetRankedByTrendDays :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool { return this.vtable.SetRankedByTrendDays(this, handle, unDays); }
ISteamUGC_SetTimeCreatedDateRange :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool { return this.vtable.SetTimeCreatedDateRange(this, handle, rtStart, rtEnd); }
ISteamUGC_SetTimeUpdatedDateRange :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool { return this.vtable.SetTimeUpdatedDateRange(this, handle, rtStart, rtEnd); }
ISteamUGC_AddRequiredKeyValueTag :: inline (this: *ISteamUGC, handle: UGCQueryHandle_t, pKey: *u8, pValue: *u8) -> bool { return this.vtable.AddRequiredKeyValueTag(this, handle, pKey, pValue); }

ISteamUGC_RequestUGCDetails :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t { return this.vtable.RequestUGCDetails(this, nPublishedFileID, unMaxAgeSeconds); }

ISteamUGC_CreateItem :: inline (this: *ISteamUGC, nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t { return this.vtable.CreateItem(this, nConsumerAppId, eFileType); }

ISteamUGC_StartItemUpdate :: inline (this: *ISteamUGC, nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t { return this.vtable.StartItemUpdate(this, nConsumerAppId, nPublishedFileID); }

ISteamUGC_SetItemTitle :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchTitle: *u8) -> bool { return this.vtable.SetItemTitle(this, handle, pchTitle); }
ISteamUGC_SetItemDescription :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchDescription: *u8) -> bool { return this.vtable.SetItemDescription(this, handle, pchDescription); }
ISteamUGC_SetItemUpdateLanguage :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchLanguage: *u8) -> bool { return this.vtable.SetItemUpdateLanguage(this, handle, pchLanguage); }
ISteamUGC_SetItemMetadata :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchMetaData: *u8) -> bool { return this.vtable.SetItemMetadata(this, handle, pchMetaData); }
ISteamUGC_SetItemVisibility :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool { return this.vtable.SetItemVisibility(this, handle, eVisibility); }
ISteamUGC_SetItemTags :: inline (this: *ISteamUGC, updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t, bAllowAdminTags := false) -> bool { return this.vtable.SetItemTags(this, updateHandle, pTags, bAllowAdminTags); }
ISteamUGC_SetItemContent :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszContentFolder: *u8) -> bool { return this.vtable.SetItemContent(this, handle, pszContentFolder); }
ISteamUGC_SetItemPreview :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *u8) -> bool { return this.vtable.SetItemPreview(this, handle, pszPreviewFile); }
ISteamUGC_SetAllowLegacyUpload :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool { return this.vtable.SetAllowLegacyUpload(this, handle, bAllowLegacyUpload); }
ISteamUGC_RemoveAllItemKeyValueTags :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t) -> bool { return this.vtable.RemoveAllItemKeyValueTags(this, handle); }
ISteamUGC_RemoveItemKeyValueTags :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *u8) -> bool { return this.vtable.RemoveItemKeyValueTags(this, handle, pchKey); }
ISteamUGC_AddItemKeyValueTag :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *u8, pchValue: *u8) -> bool { return this.vtable.AddItemKeyValueTag(this, handle, pchKey, pchValue); }
ISteamUGC_AddItemPreviewFile :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *u8, type: EItemPreviewType) -> bool { return this.vtable.AddItemPreviewFile(this, handle, pszPreviewFile, type); }
ISteamUGC_AddItemPreviewVideo :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszVideoID: *u8) -> bool { return this.vtable.AddItemPreviewVideo(this, handle, pszVideoID); }
ISteamUGC_UpdateItemPreviewFile :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *u8) -> bool { return this.vtable.UpdateItemPreviewFile(this, handle, index, pszPreviewFile); }
ISteamUGC_UpdateItemPreviewVideo :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *u8) -> bool { return this.vtable.UpdateItemPreviewVideo(this, handle, index, pszVideoID); }
ISteamUGC_RemoveItemPreview :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32) -> bool { return this.vtable.RemoveItemPreview(this, handle, index); }
ISteamUGC_AddContentDescriptor :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, descid: EUGCContentDescriptorID) -> bool { return this.vtable.AddContentDescriptor(this, handle, descid); }
ISteamUGC_RemoveContentDescriptor :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, descid: EUGCContentDescriptorID) -> bool { return this.vtable.RemoveContentDescriptor(this, handle, descid); }
ISteamUGC_SetRequiredGameVersions :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pszGameBranchMin: *u8, pszGameBranchMax: *u8) -> bool { return this.vtable.SetRequiredGameVersions(this, handle, pszGameBranchMin, pszGameBranchMax); }

ISteamUGC_SubmitItemUpdate :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, pchChangeNote: *u8) -> SteamAPICall_t { return this.vtable.SubmitItemUpdate(this, handle, pchChangeNote); }
ISteamUGC_GetItemUpdateProgress :: inline (this: *ISteamUGC, handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus { return this.vtable.GetItemUpdateProgress(this, handle, punBytesProcessed, punBytesTotal); }

ISteamUGC_SetUserItemVote :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t { return this.vtable.SetUserItemVote(this, nPublishedFileID, bVoteUp); }

ISteamUGC_GetUserItemVote :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.GetUserItemVote(this, nPublishedFileID); }

ISteamUGC_AddItemToFavorites :: inline (this: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.AddItemToFavorites(this, nAppId, nPublishedFileID); }

ISteamUGC_RemoveItemFromFavorites :: inline (this: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.RemoveItemFromFavorites(this, nAppId, nPublishedFileID); }

ISteamUGC_SubscribeItem :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.SubscribeItem(this, nPublishedFileID); }

ISteamUGC_UnsubscribeItem :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.UnsubscribeItem(this, nPublishedFileID); }
ISteamUGC_GetNumSubscribedItems :: inline (this: *ISteamUGC) -> uint32 { return this.vtable.GetNumSubscribedItems(this); }
ISteamUGC_GetSubscribedItems :: inline (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 { return this.vtable.GetSubscribedItems(this, pvecPublishedFileID, cMaxEntries); }

ISteamUGC_GetItemState :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> uint32 { return this.vtable.GetItemState(this, nPublishedFileID); }

ISteamUGC_GetItemInstallInfo :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *u8, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool { return this.vtable.GetItemInstallInfo(this, nPublishedFileID, punSizeOnDisk, pchFolder, cchFolderSize, punTimeStamp); }

ISteamUGC_GetItemDownloadInfo :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool { return this.vtable.GetItemDownloadInfo(this, nPublishedFileID, punBytesDownloaded, punBytesTotal); }

ISteamUGC_DownloadItem :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool { return this.vtable.DownloadItem(this, nPublishedFileID, bHighPriority); }

ISteamUGC_BInitWorkshopForGameServer :: inline (this: *ISteamUGC, unWorkshopDepotID: DepotId_t, pszFolder: *u8) -> bool { return this.vtable.BInitWorkshopForGameServer(this, unWorkshopDepotID, pszFolder); }

ISteamUGC_SuspendDownloads :: inline (this: *ISteamUGC, bSuspend: bool) { this.vtable.SuspendDownloads(this, bSuspend); }

ISteamUGC_StartPlaytimeTracking :: inline (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t { return this.vtable.StartPlaytimeTracking(this, pvecPublishedFileID, unNumPublishedFileIDs); }

ISteamUGC_StopPlaytimeTracking :: inline (this: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t { return this.vtable.StopPlaytimeTracking(this, pvecPublishedFileID, unNumPublishedFileIDs); }

ISteamUGC_StopPlaytimeTrackingForAllItems :: inline (this: *ISteamUGC) -> SteamAPICall_t { return this.vtable.StopPlaytimeTrackingForAllItems(this); }

ISteamUGC_AddDependency :: inline (this: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.AddDependency(this, nParentPublishedFileID, nChildPublishedFileID); }

ISteamUGC_RemoveDependency :: inline (this: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.RemoveDependency(this, nParentPublishedFileID, nChildPublishedFileID); }

ISteamUGC_AddAppDependency :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t { return this.vtable.AddAppDependency(this, nPublishedFileID, nAppID); }

ISteamUGC_RemoveAppDependency :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t { return this.vtable.RemoveAppDependency(this, nPublishedFileID, nAppID); }

ISteamUGC_GetAppDependencies :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.GetAppDependencies(this, nPublishedFileID); }

ISteamUGC_DeleteItem :: inline (this: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t { return this.vtable.DeleteItem(this, nPublishedFileID); }

ISteamUGC_ShowWorkshopEULA :: inline (this: *ISteamUGC) -> bool { return this.vtable.ShowWorkshopEULA(this); }

ISteamUGC_GetWorkshopEULAStatus :: inline (this: *ISteamUGC) -> SteamAPICall_t { return this.vtable.GetWorkshopEULAStatus(this); }

ISteamUGC_GetUserContentDescriptorPreferences :: inline (this: *ISteamUGC, pvecDescriptors: *EUGCContentDescriptorID, cMaxEntries: uint32) -> uint32 { return this.vtable.GetUserContentDescriptorPreferences(this, pvecDescriptors, cMaxEntries); }

vtable :: (obj: *ISteamUGC) -> *ISteamUGC_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Callback for querying UGC
//-----------------------------------------------------------------------------
SteamUGCQueryCompleted_t :: struct {
    anon_enum_187 :: enum s32 {
        k_iCallback :: 3401;
    }
    m_handle:                 UGCQueryHandle_t;
    m_eResult:                EResult;
    m_unNumResultsReturned:   uint32;
    m_unTotalMatchingResults: uint32;
    m_bCachedData:            bool; // indicates whether this data was retrieved from the local on-disk cache
    m_rgchNextCursor:         [256] u8; // If a paging cursor was used, then this will be the next cursor to get the next result set.
}

//-----------------------------------------------------------------------------
// Purpose: Callback for requesting details on one piece of UGC
//-----------------------------------------------------------------------------
SteamUGCRequestUGCDetailsResult_t :: struct {
    anon_enum_188 :: enum s32 {
        k_iCallback :: 3402;
    }
    m_details:     SteamUGCDetails_t;
    m_bCachedData: bool; // indicates whether this data was retrieved from the local on-disk cache
}

//-----------------------------------------------------------------------------
// Purpose: result for ISteamUGC::CreateItem()
//-----------------------------------------------------------------------------
CreateItemResult_t :: struct {
    anon_enum_189 :: enum s32 {
        k_iCallback :: 3403;
    }
    m_eResult:                                  EResult;
    m_nPublishedFileId:                         PublishedFileId_t; // new item got this UGC PublishFileID
    m_bUserNeedsToAcceptWorkshopLegalAgreement: bool;
}

//-----------------------------------------------------------------------------
// Purpose: result for ISteamUGC::SubmitItemUpdate()
//-----------------------------------------------------------------------------
SubmitItemUpdateResult_t :: struct {
    anon_enum_190 :: enum s32 {
        k_iCallback :: 3404;
    }
    m_eResult:                                  EResult;
    m_bUserNeedsToAcceptWorkshopLegalAgreement: bool;
    m_nPublishedFileId:                         PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: a Workshop item has been installed or updated
//-----------------------------------------------------------------------------
ItemInstalled_t :: struct {
    anon_enum_191 :: enum s32 {
        k_iCallback :: 3405;
    }
    m_unAppID:          AppId_t;
    m_nPublishedFileId: PublishedFileId_t;
    m_hLegacyContent:   UGCHandle_t;
    m_unManifestID:     uint64;
}

//-----------------------------------------------------------------------------
// Purpose: result of DownloadItem(), existing item files can be accessed again
//-----------------------------------------------------------------------------
DownloadItemResult_t :: struct {
    anon_enum_192 :: enum s32 {
        k_iCallback :: 3406;
    }
    m_unAppID:          AppId_t;
    m_nPublishedFileId: PublishedFileId_t;
    m_eResult:          EResult;
}

//-----------------------------------------------------------------------------
// Purpose: result of AddItemToFavorites() or RemoveItemFromFavorites()
//-----------------------------------------------------------------------------
UserFavoriteItemsListChanged_t :: struct {
    anon_enum_193 :: enum s32 {
        k_iCallback :: 3407;
    }
    m_nPublishedFileId: PublishedFileId_t;
    m_eResult:          EResult;
    m_bWasAddRequest:   bool;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to SetUserItemVote()
//-----------------------------------------------------------------------------
SetUserItemVoteResult_t :: struct {
    anon_enum_194 :: enum s32 {
        k_iCallback :: 3408;
    }
    m_nPublishedFileId: PublishedFileId_t;
    m_eResult:          EResult;
    m_bVoteUp:          bool;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to GetUserItemVote()
//-----------------------------------------------------------------------------
GetUserItemVoteResult_t :: struct {
    anon_enum_195 :: enum s32 {
        k_iCallback :: 3409;
    }
    m_nPublishedFileId: PublishedFileId_t;
    m_eResult:          EResult;
    m_bVotedUp:         bool;
    m_bVotedDown:       bool;
    m_bVoteSkipped:     bool;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to StartPlaytimeTracking()
//-----------------------------------------------------------------------------
StartPlaytimeTrackingResult_t :: struct {
    anon_enum_196 :: enum s32 {
        k_iCallback :: 3410;
    }
    m_eResult: EResult;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to StopPlaytimeTracking()
//-----------------------------------------------------------------------------
StopPlaytimeTrackingResult_t :: struct {
    anon_enum_197 :: enum s32 {
        k_iCallback :: 3411;
    }
    m_eResult: EResult;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to AddDependency
//-----------------------------------------------------------------------------
AddUGCDependencyResult_t :: struct {
    anon_enum_198 :: enum s32 {
        k_iCallback :: 3412;
    }
    m_eResult:               EResult;
    m_nPublishedFileId:      PublishedFileId_t;
    m_nChildPublishedFileId: PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to RemoveDependency
//-----------------------------------------------------------------------------
RemoveUGCDependencyResult_t :: struct {
    anon_enum_199 :: enum s32 {
        k_iCallback :: 3413;
    }
    m_eResult:               EResult;
    m_nPublishedFileId:      PublishedFileId_t;
    m_nChildPublishedFileId: PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to AddAppDependency
//-----------------------------------------------------------------------------
AddAppDependencyResult_t :: struct {
    anon_enum_200 :: enum s32 {
        k_iCallback :: 3414;
    }
    m_eResult:          EResult;
    m_nPublishedFileId: PublishedFileId_t;
    m_nAppID:           AppId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to RemoveAppDependency
//-----------------------------------------------------------------------------
RemoveAppDependencyResult_t :: struct {
    anon_enum_201 :: enum s32 {
        k_iCallback :: 3415;
    }
    m_eResult:          EResult;
    m_nPublishedFileId: PublishedFileId_t;
    m_nAppID:           AppId_t;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to GetAppDependencies.  Callback may be called
//			multiple times until all app dependencies have been returned.
//-----------------------------------------------------------------------------
GetAppDependenciesResult_t :: struct {
    anon_enum_202 :: enum s32 {
        k_iCallback :: 3416;
    }
    m_eResult:                  EResult;
    m_nPublishedFileId:         PublishedFileId_t;
    m_rgAppIDs:                 [32] AppId_t;
    m_nNumAppDependencies:      uint32; // number returned in this struct
    m_nTotalNumAppDependencies: uint32; // total found
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to DeleteItem
//-----------------------------------------------------------------------------
DeleteItemResult_t :: struct {
    anon_enum_203 :: enum s32 {
        k_iCallback :: 3417;
    }
    m_eResult:          EResult;
    m_nPublishedFileId: PublishedFileId_t;
}

//-----------------------------------------------------------------------------
// Purpose: signal that the list of subscribed items changed
//-----------------------------------------------------------------------------
UserSubscribedItemsListChanged_t :: struct {
    anon_enum_204 :: enum s32 {
        k_iCallback :: 3418;
    }
    m_nAppID: AppId_t;
}

//-----------------------------------------------------------------------------
// Purpose: Status of the user's acceptable/rejection of the app's specific Workshop EULA
//-----------------------------------------------------------------------------
WorkshopEULAStatus_t :: struct {
    anon_enum_205 :: enum s32 {
        k_iCallback :: 3420;
    }
    m_eResult:      EResult;
    m_nAppID:       AppId_t;
    m_unVersion:    uint32;
    m_rtAction:     RTime32;
    m_bAccepted:    bool;
    m_bNeedsAction: bool;
}

HHTMLBrowser :: uint32;
INVALID_HTMLBROWSER: uint32 : 0;

//-----------------------------------------------------------------------------
// Purpose: Functions for displaying HTML pages and interacting with them
//-----------------------------------------------------------------------------
ISteamHTMLSurface :: struct {
    vtable: *ISteamHTMLSurface_VTable;
    EHTMLMouseButton :: enum s32 {
        Left   :: 0;
        Right  :: 1;
        Middle :: 2;

        eHTMLMouseButton_Left   :: Left;
        eHTMLMouseButton_Right  :: Right;
        eHTMLMouseButton_Middle :: Middle;
    }

    EMouseCursor :: enum s32 {
        user           :: 0;
        none           :: 1;
        arrow          :: 2;
        ibeam          :: 3;
        hourglass      :: 4;
        waitarrow      :: 5;
        crosshair      :: 6;
        up             :: 7;
        sizenw         :: 8;
        sizese         :: 9;
        sizene         :: 10;
        sizesw         :: 11;
        sizew          :: 12;
        sizee          :: 13;
        sizen          :: 14;
        sizes          :: 15;
        sizewe         :: 16;
        sizens         :: 17;
        sizeall        :: 18;
        no             :: 19;
        hand           :: 20;
        blank          :: 21;
        middle_pan     :: 22;
        north_pan      :: 23;
        north_east_pan :: 24;
        east_pan       :: 25;
        south_east_pan :: 26;
        south_pan      :: 27;
        south_west_pan :: 28;
        west_pan       :: 29;
        north_west_pan :: 30;
        alias          :: 31;
        cell           :: 32;
        colresize      :: 33;
        copycur        :: 34;
        verticaltext   :: 35;
        rowresize      :: 36;
        zoomin         :: 37;
        zoomout        :: 38;
        help           :: 39;
        custom         :: 40;

        last           :: 41;

        dc_user           :: user;
        dc_none           :: none;
        dc_arrow          :: arrow;
        dc_ibeam          :: ibeam;
        dc_hourglass      :: hourglass;
        dc_waitarrow      :: waitarrow;
        dc_crosshair      :: crosshair;
        dc_up             :: up;
        dc_sizenw         :: sizenw;
        dc_sizese         :: sizese;
        dc_sizene         :: sizene;
        dc_sizesw         :: sizesw;
        dc_sizew          :: sizew;
        dc_sizee          :: sizee;
        dc_sizen          :: sizen;
        dc_sizes          :: sizes;
        dc_sizewe         :: sizewe;
        dc_sizens         :: sizens;
        dc_sizeall        :: sizeall;
        dc_no             :: no;
        dc_hand           :: hand;
        dc_blank          :: blank;
        dc_middle_pan     :: middle_pan;
        dc_north_pan      :: north_pan;
        dc_north_east_pan :: north_east_pan;
        dc_east_pan       :: east_pan;
        dc_south_east_pan :: south_east_pan;
        dc_south_pan      :: south_pan;
        dc_south_west_pan :: south_west_pan;
        dc_west_pan       :: west_pan;
        dc_north_west_pan :: north_west_pan;
        dc_alias          :: alias;
        dc_cell           :: cell;
        dc_colresize      :: colresize;
        dc_copycur        :: copycur;
        dc_verticaltext   :: verticaltext;
        dc_rowresize      :: rowresize;
        dc_zoomin         :: zoomin;
        dc_zoomout        :: zoomout;
        dc_help           :: help;
        dc_custom         :: custom;

        dc_last           :: last;
    }

    EHTMLKeyModifiers :: enum s32 {
        None      :: 0;
        AltDown   :: 1;
        CtrlDown  :: 2;
        ShiftDown :: 4;

        k_eHTMLKeyModifier_None      :: None;
        k_eHTMLKeyModifier_AltDown   :: AltDown;
        k_eHTMLKeyModifier_CtrlDown  :: CtrlDown;
        k_eHTMLKeyModifier_ShiftDown :: ShiftDown;
    }
}
ISteamHTMLSurface_VTable :: struct #type_info_none {
    Destructor: (this: *ISteamHTMLSurface, flags: s32) -> void #cpp_method;

    Init: (this: *ISteamHTMLSurface) -> bool #cpp_method;
    Shutdown: (this: *ISteamHTMLSurface) -> bool #cpp_method;

    CreateBrowser: (this: *ISteamHTMLSurface, pchUserAgent: *u8, pchUserCSS: *u8) -> SteamAPICall_t #cpp_method;

    RemoveBrowser: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    LoadURL: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchURL: *u8, pchPostData: *u8) -> void #cpp_method;

    SetSize: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) -> void #cpp_method;

    StopLoad: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    Reload: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    GoBack: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    GoForward: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    AddHeader: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchKey: *u8, pchValue: *u8) -> void #cpp_method;

    ExecuteJavascript: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchScript: *u8) -> void #cpp_method;

    MouseUp: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) -> void #cpp_method;
    MouseDown: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) -> void #cpp_method;
    MouseDoubleClick: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) -> void #cpp_method;

    MouseMove: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) -> void #cpp_method;

    MouseWheel: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nDelta: int32) -> void #cpp_method;

    KeyDown: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers, bIsSystemKey := false) -> void #cpp_method;
    KeyUp: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers) -> void #cpp_method;

    KeyChar: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers) -> void #cpp_method;

    SetHorizontalScroll: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) -> void #cpp_method;
    SetVerticalScroll: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) -> void #cpp_method;

    SetKeyFocus: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) -> void #cpp_method;

    ViewSource: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    CopyToClipboard: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    PasteFromClipboard: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    Find: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: *u8, bCurrentlyInFind: bool, bReverse: bool) -> void #cpp_method;

    StopFind: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    GetLinkAtPosition: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) -> void #cpp_method;

    SetCookie: (this: *ISteamHTMLSurface, pchHostname: *u8, pchKey: *u8, pchValue: *u8, pchPath: *u8 = "/", nExpires: RTime32 = 0, bSecure := false, bHTTPOnly := false) -> void #cpp_method;

    SetPageScaleFactor: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32) -> void #cpp_method;

    SetBackgroundMode: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) -> void #cpp_method;

    SetDPIScalingFactor: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: float) -> void #cpp_method;

    OpenDeveloperTools: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #cpp_method;

    AllowStartRequest: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool) -> void #cpp_method;

    JSDialogResponse: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bResult: bool) -> void #cpp_method;

    FileLoadDialogResponse: (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **u8) -> void #cpp_method;
}

ISteamHTMLSurface_Destructor :: inline (this: *ISteamHTMLSurface, flags: s32) { this.vtable.Destructor(this, flags); }

ISteamHTMLSurface_Init :: inline (this: *ISteamHTMLSurface) -> bool { return this.vtable.Init(this); }
ISteamHTMLSurface_Shutdown :: inline (this: *ISteamHTMLSurface) -> bool { return this.vtable.Shutdown(this); }

ISteamHTMLSurface_CreateBrowser :: inline (this: *ISteamHTMLSurface, pchUserAgent: *u8, pchUserCSS: *u8) -> SteamAPICall_t { return this.vtable.CreateBrowser(this, pchUserAgent, pchUserCSS); }

ISteamHTMLSurface_RemoveBrowser :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.RemoveBrowser(this, unBrowserHandle); }

ISteamHTMLSurface_LoadURL :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchURL: *u8, pchPostData: *u8) { this.vtable.LoadURL(this, unBrowserHandle, pchURL, pchPostData); }

ISteamHTMLSurface_SetSize :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) { this.vtable.SetSize(this, unBrowserHandle, unWidth, unHeight); }

ISteamHTMLSurface_StopLoad :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.StopLoad(this, unBrowserHandle); }

ISteamHTMLSurface_Reload :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.Reload(this, unBrowserHandle); }

ISteamHTMLSurface_GoBack :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.GoBack(this, unBrowserHandle); }

ISteamHTMLSurface_GoForward :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.GoForward(this, unBrowserHandle); }

ISteamHTMLSurface_AddHeader :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchKey: *u8, pchValue: *u8) { this.vtable.AddHeader(this, unBrowserHandle, pchKey, pchValue); }

ISteamHTMLSurface_ExecuteJavascript :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchScript: *u8) { this.vtable.ExecuteJavascript(this, unBrowserHandle, pchScript); }

ISteamHTMLSurface_MouseUp :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) { this.vtable.MouseUp(this, unBrowserHandle, eMouseButton); }
ISteamHTMLSurface_MouseDown :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) { this.vtable.MouseDown(this, unBrowserHandle, eMouseButton); }
ISteamHTMLSurface_MouseDoubleClick :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) { this.vtable.MouseDoubleClick(this, unBrowserHandle, eMouseButton); }

ISteamHTMLSurface_MouseMove :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) { this.vtable.MouseMove(this, unBrowserHandle, x, y); }

ISteamHTMLSurface_MouseWheel :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nDelta: int32) { this.vtable.MouseWheel(this, unBrowserHandle, nDelta); }

ISteamHTMLSurface_KeyDown :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers, bIsSystemKey := false) { this.vtable.KeyDown(this, unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers, bIsSystemKey); }
ISteamHTMLSurface_KeyUp :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers) { this.vtable.KeyUp(this, unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers); }

ISteamHTMLSurface_KeyChar :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers) { this.vtable.KeyChar(this, unBrowserHandle, cUnicodeChar, eHTMLKeyModifiers); }

ISteamHTMLSurface_SetHorizontalScroll :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) { this.vtable.SetHorizontalScroll(this, unBrowserHandle, nAbsolutePixelScroll); }
ISteamHTMLSurface_SetVerticalScroll :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) { this.vtable.SetVerticalScroll(this, unBrowserHandle, nAbsolutePixelScroll); }

ISteamHTMLSurface_SetKeyFocus :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) { this.vtable.SetKeyFocus(this, unBrowserHandle, bHasKeyFocus); }

ISteamHTMLSurface_ViewSource :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.ViewSource(this, unBrowserHandle); }

ISteamHTMLSurface_CopyToClipboard :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.CopyToClipboard(this, unBrowserHandle); }

ISteamHTMLSurface_PasteFromClipboard :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.PasteFromClipboard(this, unBrowserHandle); }

ISteamHTMLSurface_Find :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: *u8, bCurrentlyInFind: bool, bReverse: bool) { this.vtable.Find(this, unBrowserHandle, pchSearchStr, bCurrentlyInFind, bReverse); }

ISteamHTMLSurface_StopFind :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.StopFind(this, unBrowserHandle); }

ISteamHTMLSurface_GetLinkAtPosition :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) { this.vtable.GetLinkAtPosition(this, unBrowserHandle, x, y); }

ISteamHTMLSurface_SetCookie :: inline (this: *ISteamHTMLSurface, pchHostname: *u8, pchKey: *u8, pchValue: *u8, pchPath: *u8 = "/", nExpires: RTime32 = 0, bSecure := false, bHTTPOnly := false) { this.vtable.SetCookie(this, pchHostname, pchKey, pchValue, pchPath, nExpires, bSecure, bHTTPOnly); }

ISteamHTMLSurface_SetPageScaleFactor :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32) { this.vtable.SetPageScaleFactor(this, unBrowserHandle, flZoom, nPointX, nPointY); }

ISteamHTMLSurface_SetBackgroundMode :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) { this.vtable.SetBackgroundMode(this, unBrowserHandle, bBackgroundMode); }

ISteamHTMLSurface_SetDPIScalingFactor :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: float) { this.vtable.SetDPIScalingFactor(this, unBrowserHandle, flDPIScaling); }

ISteamHTMLSurface_OpenDeveloperTools :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) { this.vtable.OpenDeveloperTools(this, unBrowserHandle); }

ISteamHTMLSurface_AllowStartRequest :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool) { this.vtable.AllowStartRequest(this, unBrowserHandle, bAllowed); }

ISteamHTMLSurface_JSDialogResponse :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bResult: bool) { this.vtable.JSDialogResponse(this, unBrowserHandle, bResult); }

ISteamHTMLSurface_FileLoadDialogResponse :: inline (this: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **u8) { this.vtable.FileLoadDialogResponse(this, unBrowserHandle, pchSelectedFiles); }

vtable :: (obj: *ISteamHTMLSurface) -> *ISteamHTMLSurface_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: The browser is ready for use
//-----------------------------------------------------------------------------
HTML_BrowserReady_t :: struct {
    anon_enum_206 :: enum s32 {
        k_iCallback :: 4501;
    }
    unBrowserHandle: HHTMLBrowser;
}

//-----------------------------------------------------------------------------
// Purpose: the browser has a pending paint
//-----------------------------------------------------------------------------
HTML_NeedsPaint_t :: struct {
    anon_enum_207 :: enum s32 {
        k_iCallback :: 4502;
    }
    unBrowserHandle: HHTMLBrowser;
    pBGRA:           *u8;
    unWide:          uint32;
    unTall:          uint32;
    unUpdateX:       uint32;
    unUpdateY:       uint32;
    unUpdateWide:    uint32;
    unUpdateTall:    uint32;
    unScrollX:       uint32;
    unScrollY:       uint32;
    flPageScale:     float;
    unPageSerial:    uint32;
}

//-----------------------------------------------------------------------------
// Purpose: The browser wanted to navigate to a new page
//   NOTE - you MUST call AllowStartRequest in response to this callback
//-----------------------------------------------------------------------------
HTML_StartRequest_t :: struct {
    anon_enum_208 :: enum s32 {
        k_iCallback :: 4503;
    }
    unBrowserHandle: HHTMLBrowser;
    pchURL:          *u8;
    pchTarget:       *u8;
    pchPostData:     *u8;
    bIsRedirect:     bool;
}

//-----------------------------------------------------------------------------
// Purpose: The browser has been requested to close due to user interaction (usually from a javascript window.close() call)
//-----------------------------------------------------------------------------
HTML_CloseBrowser_t :: struct {
    anon_enum_209 :: enum s32 {
        k_iCallback :: 4504;
    }
    unBrowserHandle: HHTMLBrowser;
}

//-----------------------------------------------------------------------------
// Purpose: the browser is navigating to a new url
//-----------------------------------------------------------------------------
HTML_URLChanged_t :: struct {
    anon_enum_210 :: enum s32 {
        k_iCallback :: 4505;
    }
    unBrowserHandle: HHTMLBrowser;
    pchURL:          *u8;
    pchPostData:     *u8;
    bIsRedirect:     bool;
    pchPageTitle:    *u8;
    bNewNavigation:  bool;
}

//-----------------------------------------------------------------------------
// Purpose: A page is finished loading
//-----------------------------------------------------------------------------
HTML_FinishedRequest_t :: struct {
    anon_enum_211 :: enum s32 {
        k_iCallback :: 4506;
    }
    unBrowserHandle: HHTMLBrowser;
    pchURL:          *u8;
    pchPageTitle:    *u8;
}

//-----------------------------------------------------------------------------
// Purpose: a request to load this url in a new tab
//-----------------------------------------------------------------------------
HTML_OpenLinkInNewTab_t :: struct {
    anon_enum_212 :: enum s32 {
        k_iCallback :: 4507;
    }
    unBrowserHandle: HHTMLBrowser;
    pchURL:          *u8;
}

//-----------------------------------------------------------------------------
// Purpose: the page has a new title now
//-----------------------------------------------------------------------------
HTML_ChangedTitle_t :: struct {
    anon_enum_213 :: enum s32 {
        k_iCallback :: 4508;
    }
    unBrowserHandle: HHTMLBrowser;
    pchTitle:        *u8;
}

//-----------------------------------------------------------------------------
// Purpose: results from a search
//-----------------------------------------------------------------------------
HTML_SearchResults_t :: struct {
    anon_enum_214 :: enum s32 {
        k_iCallback :: 4509;
    }
    unBrowserHandle: HHTMLBrowser;
    unResults:       uint32;
    unCurrentMatch:  uint32;
}

//-----------------------------------------------------------------------------
// Purpose: page history status changed on the ability to go backwards and forward
//-----------------------------------------------------------------------------
HTML_CanGoBackAndForward_t :: struct {
    anon_enum_215 :: enum s32 {
        k_iCallback :: 4510;
    }
    unBrowserHandle: HHTMLBrowser;
    bCanGoBack:      bool;
    bCanGoForward:   bool;
}

//-----------------------------------------------------------------------------
// Purpose: details on the visibility and size of the horizontal scrollbar
//-----------------------------------------------------------------------------
HTML_HorizontalScroll_t :: struct {
    anon_enum_216 :: enum s32 {
        k_iCallback :: 4511;
    }
    unBrowserHandle: HHTMLBrowser;
    unScrollMax:     uint32;
    unScrollCurrent: uint32;
    flPageScale:     float;
    bVisible:        bool;
    unPageSize:      uint32;
}

//-----------------------------------------------------------------------------
// Purpose: details on the visibility and size of the vertical scrollbar
//-----------------------------------------------------------------------------
HTML_VerticalScroll_t :: struct {
    anon_enum_217 :: enum s32 {
        k_iCallback :: 4512;
    }
    unBrowserHandle: HHTMLBrowser;
    unScrollMax:     uint32;
    unScrollCurrent: uint32;
    flPageScale:     float;
    bVisible:        bool;
    unPageSize:      uint32;
}

//-----------------------------------------------------------------------------
// Purpose: response to GetLinkAtPosition call
//-----------------------------------------------------------------------------
HTML_LinkAtPosition_t :: struct {
    anon_enum_218 :: enum s32 {
        k_iCallback :: 4513;
    }
    unBrowserHandle: HHTMLBrowser;
    x:               uint32;
    y:               uint32;
    pchURL:          *u8;
    bInput:          bool;
    bLiveLink:       bool;
}

//-----------------------------------------------------------------------------
// Purpose: show a Javascript alert dialog, call JSDialogResponse
//   when the user dismisses this dialog (or right away to ignore it)
//-----------------------------------------------------------------------------
HTML_JSAlert_t :: struct {
    anon_enum_219 :: enum s32 {
        k_iCallback :: 4514;
    }
    unBrowserHandle: HHTMLBrowser;
    pchMessage:      *u8;
}

//-----------------------------------------------------------------------------
// Purpose: show a Javascript confirmation dialog, call JSDialogResponse
//   when the user dismisses this dialog (or right away to ignore it)
//-----------------------------------------------------------------------------
HTML_JSConfirm_t :: struct {
    anon_enum_220 :: enum s32 {
        k_iCallback :: 4515;
    }
    unBrowserHandle: HHTMLBrowser;
    pchMessage:      *u8;
}

//-----------------------------------------------------------------------------
// Purpose: when received show a file open dialog
//   then call FileLoadDialogResponse with the file(s) the user selected.
//-----------------------------------------------------------------------------
HTML_FileOpenDialog_t :: struct {
    anon_enum_221 :: enum s32 {
        k_iCallback :: 4516;
    }
    unBrowserHandle: HHTMLBrowser;
    pchTitle:        *u8;
    pchInitialFile:  *u8;
}

//-----------------------------------------------------------------------------
// Purpose: a new html window is being created.
//
// IMPORTANT NOTE: at this time, the API does not allow you to acknowledge or
// render the contents of this new window, so the new window is always destroyed
// immediately. The URL and other parameters of the new window are passed here
// to give your application the opportunity to call CreateBrowser and set up
// a new browser in response to the attempted popup, if you wish to do so.
//-----------------------------------------------------------------------------
HTML_NewWindow_t :: struct {
    anon_enum_222 :: enum s32 {
        k_iCallback :: 4521;
    }
    unBrowserHandle:                  HHTMLBrowser;
    pchURL:                           *u8;
    unX:                              uint32;
    unY:                              uint32;
    unWide:                           uint32;
    unTall:                           uint32;
    unNewWindow_BrowserHandle_IGNORE: HHTMLBrowser;
}

//-----------------------------------------------------------------------------
// Purpose: change the cursor to display
//-----------------------------------------------------------------------------
HTML_SetCursor_t :: struct {
    anon_enum_223 :: enum s32 {
        k_iCallback :: 4522;
    }
    unBrowserHandle: HHTMLBrowser;
    eMouseCursor:    uint32;
}

//-----------------------------------------------------------------------------
// Purpose: informational message from the browser
//-----------------------------------------------------------------------------
HTML_StatusText_t :: struct {
    anon_enum_224 :: enum s32 {
        k_iCallback :: 4523;
    }
    unBrowserHandle: HHTMLBrowser;
    pchMsg:          *u8;
}

//-----------------------------------------------------------------------------
// Purpose: show a tooltip
//-----------------------------------------------------------------------------
HTML_ShowToolTip_t :: struct {
    anon_enum_225 :: enum s32 {
        k_iCallback :: 4524;
    }
    unBrowserHandle: HHTMLBrowser;
    pchMsg:          *u8;
}

//-----------------------------------------------------------------------------
// Purpose: update the text of an existing tooltip
//-----------------------------------------------------------------------------
HTML_UpdateToolTip_t :: struct {
    anon_enum_226 :: enum s32 {
        k_iCallback :: 4525;
    }
    unBrowserHandle: HHTMLBrowser;
    pchMsg:          *u8;
}

//-----------------------------------------------------------------------------
// Purpose: hide the tooltip you are showing
//-----------------------------------------------------------------------------
HTML_HideToolTip_t :: struct {
    anon_enum_227 :: enum s32 {
        k_iCallback :: 4526;
    }
    unBrowserHandle: HHTMLBrowser;
}

//-----------------------------------------------------------------------------
// Purpose: The browser has restarted due to an internal failure, use this new handle value
//-----------------------------------------------------------------------------
HTML_BrowserRestarted_t :: struct {
    anon_enum_228 :: enum s32 {
        k_iCallback :: 4527;
    }
    unBrowserHandle:    HHTMLBrowser;
    unOldBrowserHandle: HHTMLBrowser;
}

// Every individual instance of an item has a globally-unique ItemInstanceID.
// This ID is unique to the combination of (player, specific item instance)
// and will not be transferred to another player or re-used for another item.
SteamItemInstanceID_t :: uint64;

k_SteamItemInstanceIDInvalid: SteamItemInstanceID_t : ~0;

// Types of items in your game are identified by a 32-bit "item definition number".
// Valid definition numbers are between 1 and 999999999; numbers less than or equal to
// zero are invalid, and numbers greater than or equal to one billion (1x10^9) are
// reserved for internal Steam use.
SteamItemDef_t :: int32;

ESteamItemFlags :: enum s32 {
    ESteamItemNoTrade  :: 1;

    ESteamItemRemoved  :: 256;
    ESteamItemConsumed :: 512;

    k_ESteamItemNoTrade  :: ESteamItemNoTrade;

    k_ESteamItemRemoved  :: ESteamItemRemoved;
    k_ESteamItemConsumed :: ESteamItemConsumed;
}

SteamItemDetails_t :: struct {
    m_itemId:      SteamItemInstanceID_t;
    m_iDefinition: SteamItemDef_t;
    m_unQuantity:  uint16;
    m_unFlags:     uint16; // see ESteamItemFlags
}

SteamInventoryResult_t :: int32;

k_SteamInventoryResultInvalid: SteamInventoryResult_t : -1;

SteamInventoryUpdateHandle_t :: uint64;
k_SteamInventoryUpdateHandleInvalid: SteamInventoryUpdateHandle_t : 0xffff_ffff_ffff_ffff;

//-----------------------------------------------------------------------------
// Purpose: Steam Inventory query and manipulation API
//-----------------------------------------------------------------------------
ISteamInventory :: struct {
    vtable: *ISteamInventory_VTable;
}
ISteamInventory_VTable :: struct #type_info_none {
    GetResultStatus: (this: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> EResult #cpp_method;

    GetResultItems: (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool #cpp_method;

    GetResultItemProperty: (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *u8, pchValueBuffer: *u8, punValueBufferSizeOut: *uint32) -> bool #cpp_method;

    GetResultTimestamp: (this: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> uint32 #cpp_method;

    CheckResultSteamID: (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, steamIDExpected: CSteamID) -> bool #cpp_method;

    DestroyResult: (this: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> void #cpp_method;

    GetAllItems: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool #cpp_method;

    GetItemsByID: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool #cpp_method;

    SerializeResult: (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool #cpp_method;

    DeserializeResult: (this: *ISteamInventory, pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE := false) -> bool #cpp_method;

    GenerateItems: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool #cpp_method;

    GrantPromoItems: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool #cpp_method;

    AddPromoItem: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool #cpp_method;
    AddPromoItems: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool #cpp_method;

    ConsumeItem: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool #cpp_method;

    ExchangeItems: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool #cpp_method;

    TransferItemQuantity: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool #cpp_method;

    SendItemDropHeartbeat: (this: *ISteamInventory) -> void #cpp_method;

    TriggerItemDrop: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool #cpp_method;

    TradeItems: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: CSteamID, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool #cpp_method;

    LoadItemDefinitions: (this: *ISteamInventory) -> bool #cpp_method;

    GetItemDefinitionIDs: (this: *ISteamInventory, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #cpp_method;

    GetItemDefinitionProperty: (this: *ISteamInventory, iDefinition: SteamItemDef_t, pchPropertyName: *u8, pchValueBuffer: *u8, punValueBufferSizeOut: *uint32) -> bool #cpp_method;

    RequestEligiblePromoItemDefinitionsIDs: (this: *ISteamInventory, steamID: CSteamID) -> SteamAPICall_t #cpp_method;

    GetEligiblePromoItemDefinitionIDs: (this: *ISteamInventory, steamID: CSteamID, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #cpp_method;

    StartPurchase: (this: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t #cpp_method;

    RequestPrices: (this: *ISteamInventory) -> SteamAPICall_t #cpp_method;

    GetNumItemsWithPrices: (this: *ISteamInventory) -> uint32 #cpp_method;

    GetItemsWithPrices: (this: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool #cpp_method;

    GetItemPrice: (this: *ISteamInventory, iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool #cpp_method;

    StartUpdateProperties: (this: *ISteamInventory) -> SteamInventoryUpdateHandle_t #cpp_method;

    RemoveProperty: (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8) -> bool #cpp_method;

    SetProperty: (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8, flValue: float) -> bool #cpp_method;

    SetProperty_1: (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: /*const*/ *u8, nValue: int64) -> bool #cpp_method;

    SetProperty_2: (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: /*const*/ *u8, bValue: bool) -> bool #cpp_method;

    SetProperty_3: (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: /*const*/ *u8, pchPropertyValue: /*const*/ *u8) -> bool #cpp_method;

    SubmitUpdateProperties: (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool #cpp_method;

    InspectItem: (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pchItemToken: *u8) -> bool #cpp_method;
}

ISteamInventory_GetResultStatus :: inline (this: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> EResult { return this.vtable.GetResultStatus(this, resultHandle); }

ISteamInventory_GetResultItems :: inline (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool { return this.vtable.GetResultItems(this, resultHandle, pOutItemsArray, punOutItemsArraySize); }

ISteamInventory_GetResultItemProperty :: inline (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *u8, pchValueBuffer: *u8, punValueBufferSizeOut: *uint32) -> bool { return this.vtable.GetResultItemProperty(this, resultHandle, unItemIndex, pchPropertyName, pchValueBuffer, punValueBufferSizeOut); }

ISteamInventory_GetResultTimestamp :: inline (this: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> uint32 { return this.vtable.GetResultTimestamp(this, resultHandle); }

ISteamInventory_CheckResultSteamID :: inline (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, steamIDExpected: CSteamID) -> bool { return this.vtable.CheckResultSteamID(this, resultHandle, steamIDExpected); }

ISteamInventory_DestroyResult :: inline (this: *ISteamInventory, resultHandle: SteamInventoryResult_t) { this.vtable.DestroyResult(this, resultHandle); }

ISteamInventory_GetAllItems :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool { return this.vtable.GetAllItems(this, pResultHandle); }

ISteamInventory_GetItemsByID :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool { return this.vtable.GetItemsByID(this, pResultHandle, pInstanceIDs, unCountInstanceIDs); }

ISteamInventory_SerializeResult :: inline (this: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool { return this.vtable.SerializeResult(this, resultHandle, pOutBuffer, punOutBufferSize); }

ISteamInventory_DeserializeResult :: inline (this: *ISteamInventory, pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE := false) -> bool { return this.vtable.DeserializeResult(this, pOutResultHandle, pBuffer, unBufferSize, bRESERVED_MUST_BE_FALSE); }

ISteamInventory_GenerateItems :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool { return this.vtable.GenerateItems(this, pResultHandle, pArrayItemDefs, punArrayQuantity, unArrayLength); }

ISteamInventory_GrantPromoItems :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool { return this.vtable.GrantPromoItems(this, pResultHandle); }

ISteamInventory_AddPromoItem :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool { return this.vtable.AddPromoItem(this, pResultHandle, itemDef); }
ISteamInventory_AddPromoItems :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool { return this.vtable.AddPromoItems(this, pResultHandle, pArrayItemDefs, unArrayLength); }

ISteamInventory_ConsumeItem :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool { return this.vtable.ConsumeItem(this, pResultHandle, itemConsume, unQuantity); }

ISteamInventory_ExchangeItems :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool { return this.vtable.ExchangeItems(this, pResultHandle, pArrayGenerate, punArrayGenerateQuantity, unArrayGenerateLength, pArrayDestroy, punArrayDestroyQuantity, unArrayDestroyLength); }

ISteamInventory_TransferItemQuantity :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool { return this.vtable.TransferItemQuantity(this, pResultHandle, itemIdSource, unQuantity, itemIdDest); }

ISteamInventory_SendItemDropHeartbeat :: inline (this: *ISteamInventory) { this.vtable.SendItemDropHeartbeat(this); }

ISteamInventory_TriggerItemDrop :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool { return this.vtable.TriggerItemDrop(this, pResultHandle, dropListDefinition); }

ISteamInventory_TradeItems :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: CSteamID, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool { return this.vtable.TradeItems(this, pResultHandle, steamIDTradePartner, pArrayGive, pArrayGiveQuantity, nArrayGiveLength, pArrayGet, pArrayGetQuantity, nArrayGetLength); }

ISteamInventory_LoadItemDefinitions :: inline (this: *ISteamInventory) -> bool { return this.vtable.LoadItemDefinitions(this); }

ISteamInventory_GetItemDefinitionIDs :: inline (this: *ISteamInventory, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool { return this.vtable.GetItemDefinitionIDs(this, pItemDefIDs, punItemDefIDsArraySize); }

ISteamInventory_GetItemDefinitionProperty :: inline (this: *ISteamInventory, iDefinition: SteamItemDef_t, pchPropertyName: *u8, pchValueBuffer: *u8, punValueBufferSizeOut: *uint32) -> bool { return this.vtable.GetItemDefinitionProperty(this, iDefinition, pchPropertyName, pchValueBuffer, punValueBufferSizeOut); }

ISteamInventory_RequestEligiblePromoItemDefinitionsIDs :: inline (this: *ISteamInventory, steamID: CSteamID) -> SteamAPICall_t { return this.vtable.RequestEligiblePromoItemDefinitionsIDs(this, steamID); }

ISteamInventory_GetEligiblePromoItemDefinitionIDs :: inline (this: *ISteamInventory, steamID: CSteamID, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool { return this.vtable.GetEligiblePromoItemDefinitionIDs(this, steamID, pItemDefIDs, punItemDefIDsArraySize); }

ISteamInventory_StartPurchase :: inline (this: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t { return this.vtable.StartPurchase(this, pArrayItemDefs, punArrayQuantity, unArrayLength); }

ISteamInventory_RequestPrices :: inline (this: *ISteamInventory) -> SteamAPICall_t { return this.vtable.RequestPrices(this); }

ISteamInventory_GetNumItemsWithPrices :: inline (this: *ISteamInventory) -> uint32 { return this.vtable.GetNumItemsWithPrices(this); }

ISteamInventory_GetItemsWithPrices :: inline (this: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool { return this.vtable.GetItemsWithPrices(this, pArrayItemDefs, pCurrentPrices, pBasePrices, unArrayLength); }

ISteamInventory_GetItemPrice :: inline (this: *ISteamInventory, iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool { return this.vtable.GetItemPrice(this, iDefinition, pCurrentPrice, pBasePrice); }

ISteamInventory_StartUpdateProperties :: inline (this: *ISteamInventory) -> SteamInventoryUpdateHandle_t { return this.vtable.StartUpdateProperties(this); }

ISteamInventory_RemoveProperty :: inline (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8) -> bool { return this.vtable.RemoveProperty(this, handle, nItemID, pchPropertyName); }

ISteamInventory_SetProperty :: inline (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: /*const*/ *u8, flValue: float) -> bool { return this.vtable.SetProperty(this, handle, nItemID, pchPropertyName, flValue); }

ISteamInventory_SetProperty_1 :: inline (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: /*const*/ *u8, nValue: int64) -> bool { return this.vtable.SetProperty_1(this, handle, nItemID, pchPropertyName, nValue); }

ISteamInventory_SetProperty_2 :: inline (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: /*const*/ *u8, bValue: bool) -> bool { return this.vtable.SetProperty_2(this, handle, nItemID, pchPropertyName, bValue); }

ISteamInventory_SetProperty_3 :: inline (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: /*const*/ *u8, pchPropertyValue: /*const*/ *u8) -> bool { return this.vtable.SetProperty_3(this, handle, nItemID, pchPropertyName, pchPropertyValue); }

ISteamInventory_SubmitUpdateProperties :: inline (this: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool { return this.vtable.SubmitUpdateProperties(this, handle, pResultHandle); }

ISteamInventory_InspectItem :: inline (this: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pchItemToken: *u8) -> bool { return this.vtable.InspectItem(this, pResultHandle, pchItemToken); }

vtable :: (obj: *ISteamInventory) -> *ISteamInventory_VTable { return obj.vtable; }


// SteamInventoryResultReady_t callbacks are fired whenever asynchronous
// results transition from "Pending" to "OK" or an error state. There will
// always be exactly one callback per handle.
SteamInventoryResultReady_t :: struct {
    anon_enum_229 :: enum s32 {
        k_iCallback :: 4700;
    }
    m_handle: SteamInventoryResult_t;
    m_result: EResult;
}

// SteamInventoryFullUpdate_t callbacks are triggered when GetAllItems
// successfully returns a result which is newer / fresher than the last
// known result. (It will not trigger if the inventory hasn't changed,
// or if results from two overlapping calls are reversed in flight and
// the earlier result is already known to be stale/out-of-date.)
// The normal ResultReady callback will still be triggered immediately
// afterwards; this is an additional notification for your convenience.
SteamInventoryFullUpdate_t :: struct {
    anon_enum_230 :: enum s32 {
        k_iCallback :: 4701;
    }
    m_handle: SteamInventoryResult_t;
}

// A SteamInventoryDefinitionUpdate_t callback is triggered whenever
// item definitions have been updated, which could be in response to
// LoadItemDefinitions() or any other async request which required
// a definition update in order to process results from the server.
SteamInventoryDefinitionUpdate_t :: struct {
    anon_enum_231 :: enum s32 {
        k_iCallback :: 4702;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

// Returned
SteamInventoryEligiblePromoItemDefIDs_t :: struct {
    anon_enum_232 :: enum s32 {
        k_iCallback :: 4703;
    }
    m_result:                   EResult;
    m_steamID:                  CSteamID #align 4;
    m_numEligiblePromoItemDefs: s32;
    m_bCachedData:              bool; // indicates that the data was retrieved from the cache and not the server
}

// Triggered from StartPurchase call
SteamInventoryStartPurchaseResult_t :: struct {
    anon_enum_233 :: enum s32 {
        k_iCallback :: 4704;
    }
    m_result:    EResult;
    m_ulOrderID: uint64;
    m_ulTransID: uint64;
}

// Triggered from RequestPrices
SteamInventoryRequestPricesResult_t :: struct {
    anon_enum_234 :: enum s32 {
        k_iCallback :: 4705;
    }
    m_result:       EResult;
    m_rgchCurrency: [4] u8;
}

// Controls the color of the timeline bar segments. The value names listed here map to a multiplayer game, where
// the user starts a game (in menus), then joins a multiplayer session that first has a character selection lobby
// then finally the multiplayer session starts. However, you can also map these values to any type of game. In a single
// player game where you visit towns & dungeons, you could set k_ETimelineGameMode_Menus when the player is in a town
// buying items, k_ETimelineGameMode_Staging for when a dungeon is loading and k_ETimelineGameMode_Playing for when
// inside the dungeon fighting monsters.
ETimelineGameMode :: enum s32 {
    Invalid       :: 0;
    Playing       :: 1;
    Staging       :: 2;
    Menus         :: 3;
    LoadingScreen :: 4;

    Max           :: 5;

    k_ETimelineGameMode_Invalid       :: Invalid;
    k_ETimelineGameMode_Playing       :: Playing;
    k_ETimelineGameMode_Staging       :: Staging;
    k_ETimelineGameMode_Menus         :: Menus;
    k_ETimelineGameMode_LoadingScreen :: LoadingScreen;

    k_ETimelineGameMode_Max           :: Max;
}

// Used in AddTimelineEvent, where Featured events will be offered before Standard events
ETimelineEventClipPriority :: enum s32 {
    Invalid  :: 0;
    None     :: 1;
    Standard :: 2;
    Featured :: 3;

    k_ETimelineEventClipPriority_Invalid  :: Invalid;
    k_ETimelineEventClipPriority_None     :: None;
    k_ETimelineEventClipPriority_Standard :: Standard;
    k_ETimelineEventClipPriority_Featured :: Featured;
}

k_unMaxTimelinePriority: uint32 : 1000;
k_flMaxTimelineEventDuration: float : 600.0;

//-----------------------------------------------------------------------------
// Purpose: Steam Timeline API
//-----------------------------------------------------------------------------
ISteamTimeline :: struct {
    vtable: *ISteamTimeline_VTable;
}
ISteamTimeline_VTable :: struct #type_info_none {
    SetTimelineStateDescription: (this: *ISteamTimeline, pchDescription: *u8, flTimeDelta: float) -> void #cpp_method;
    ClearTimelineStateDescription: (this: *ISteamTimeline, flTimeDelta: float) -> void #cpp_method;

    AddTimelineEvent: (this: *ISteamTimeline, pchIcon: *u8, pchTitle: *u8, pchDescription: *u8, unPriority: uint32, flStartOffsetSeconds: float, flDurationSeconds: float, ePossibleClip: ETimelineEventClipPriority) -> void #cpp_method;

    SetTimelineGameMode: (this: *ISteamTimeline, eMode: ETimelineGameMode) -> void #cpp_method;
}

ISteamTimeline_SetTimelineStateDescription :: inline (this: *ISteamTimeline, pchDescription: *u8, flTimeDelta: float) { this.vtable.SetTimelineStateDescription(this, pchDescription, flTimeDelta); }
ISteamTimeline_ClearTimelineStateDescription :: inline (this: *ISteamTimeline, flTimeDelta: float) { this.vtable.ClearTimelineStateDescription(this, flTimeDelta); }

ISteamTimeline_AddTimelineEvent :: inline (this: *ISteamTimeline, pchIcon: *u8, pchTitle: *u8, pchDescription: *u8, unPriority: uint32, flStartOffsetSeconds: float, flDurationSeconds: float, ePossibleClip: ETimelineEventClipPriority) { this.vtable.AddTimelineEvent(this, pchIcon, pchTitle, pchDescription, unPriority, flStartOffsetSeconds, flDurationSeconds, ePossibleClip); }

ISteamTimeline_SetTimelineGameMode :: inline (this: *ISteamTimeline, eMode: ETimelineGameMode) { this.vtable.SetTimelineGameMode(this, eMode); }

vtable :: (obj: *ISteamTimeline) -> *ISteamTimeline_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Steam Video API
//-----------------------------------------------------------------------------
ISteamVideo :: struct {
    vtable: *ISteamVideo_VTable;
}
ISteamVideo_VTable :: struct #type_info_none {
    GetVideoURL: (this: *ISteamVideo, unVideoAppID: AppId_t) -> void #cpp_method;

    IsBroadcasting: (this: *ISteamVideo, pnNumViewers: *s32) -> bool #cpp_method;

    GetOPFSettings: (this: *ISteamVideo, unVideoAppID: AppId_t) -> void #cpp_method;
    GetOPFStringForApp: (this: *ISteamVideo, unVideoAppID: AppId_t, pchBuffer: *u8, pnBufferSize: *int32) -> bool #cpp_method;
}

ISteamVideo_GetVideoURL :: inline (this: *ISteamVideo, unVideoAppID: AppId_t) { this.vtable.GetVideoURL(this, unVideoAppID); }

ISteamVideo_IsBroadcasting :: inline (this: *ISteamVideo, pnNumViewers: *s32) -> bool { return this.vtable.IsBroadcasting(this, pnNumViewers); }

ISteamVideo_GetOPFSettings :: inline (this: *ISteamVideo, unVideoAppID: AppId_t) { this.vtable.GetOPFSettings(this, unVideoAppID); }
ISteamVideo_GetOPFStringForApp :: inline (this: *ISteamVideo, unVideoAppID: AppId_t, pchBuffer: *u8, pnBufferSize: *int32) -> bool { return this.vtable.GetOPFStringForApp(this, unVideoAppID, pchBuffer, pnBufferSize); }

vtable :: (obj: *ISteamVideo) -> *ISteamVideo_VTable { return obj.vtable; }


GetVideoURLResult_t :: struct {
    anon_enum_235 :: enum s32 {
        k_iCallback :: 4611;
    }
    m_eResult:      EResult;
    m_unVideoAppID: AppId_t;
    m_rgchURL:      [256] u8;
}

GetOPFSettingsResult_t :: struct {
    anon_enum_236 :: enum s32 {
        k_iCallback :: 4624;
    }
    m_eResult:      EResult;
    m_unVideoAppID: AppId_t;
}

// Feature types for parental settings
EParentalFeature :: enum s32 {
    EFeatureInvalid              :: 0;
    EFeatureStore                :: 1;
    EFeatureCommunity            :: 2;
    EFeatureProfile              :: 3;
    EFeatureFriends              :: 4;
    EFeatureNews                 :: 5;
    EFeatureTrading              :: 6;
    EFeatureSettings             :: 7;
    EFeatureConsole              :: 8;
    EFeatureBrowser              :: 9;
    EFeatureParentalSetup        :: 10;
    EFeatureLibrary              :: 11;
    EFeatureTest                 :: 12;
    EFeatureSiteLicense          :: 13;
    EFeatureKioskMode_Deprecated :: 14;
    EFeatureBlockAlways          :: 15;
    EFeatureMax                  :: 16;

    k_EFeatureInvalid              :: EFeatureInvalid;
    k_EFeatureStore                :: EFeatureStore;
    k_EFeatureCommunity            :: EFeatureCommunity;
    k_EFeatureProfile              :: EFeatureProfile;
    k_EFeatureFriends              :: EFeatureFriends;
    k_EFeatureNews                 :: EFeatureNews;
    k_EFeatureTrading              :: EFeatureTrading;
    k_EFeatureSettings             :: EFeatureSettings;
    k_EFeatureConsole              :: EFeatureConsole;
    k_EFeatureBrowser              :: EFeatureBrowser;
    k_EFeatureParentalSetup        :: EFeatureParentalSetup;
    k_EFeatureLibrary              :: EFeatureLibrary;
    k_EFeatureTest                 :: EFeatureTest;
    k_EFeatureSiteLicense          :: EFeatureSiteLicense;
    k_EFeatureKioskMode_Deprecated :: EFeatureKioskMode_Deprecated;
    k_EFeatureBlockAlways          :: EFeatureBlockAlways;
    k_EFeatureMax                  :: EFeatureMax;
}

ISteamParentalSettings :: struct {
    vtable: *ISteamParentalSettings_VTable;
}
ISteamParentalSettings_VTable :: struct #type_info_none {
    BIsParentalLockEnabled: (this: *ISteamParentalSettings) -> bool #cpp_method;
    BIsParentalLockLocked: (this: *ISteamParentalSettings) -> bool #cpp_method;

    BIsAppBlocked: (this: *ISteamParentalSettings, nAppID: AppId_t) -> bool #cpp_method;
    BIsAppInBlockList: (this: *ISteamParentalSettings, nAppID: AppId_t) -> bool #cpp_method;

    BIsFeatureBlocked: (this: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool #cpp_method;
    BIsFeatureInBlockList: (this: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool #cpp_method;
}

ISteamParentalSettings_BIsParentalLockEnabled :: inline (this: *ISteamParentalSettings) -> bool { return this.vtable.BIsParentalLockEnabled(this); }
ISteamParentalSettings_BIsParentalLockLocked :: inline (this: *ISteamParentalSettings) -> bool { return this.vtable.BIsParentalLockLocked(this); }

ISteamParentalSettings_BIsAppBlocked :: inline (this: *ISteamParentalSettings, nAppID: AppId_t) -> bool { return this.vtable.BIsAppBlocked(this, nAppID); }
ISteamParentalSettings_BIsAppInBlockList :: inline (this: *ISteamParentalSettings, nAppID: AppId_t) -> bool { return this.vtable.BIsAppInBlockList(this, nAppID); }

ISteamParentalSettings_BIsFeatureBlocked :: inline (this: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool { return this.vtable.BIsFeatureBlocked(this, eFeature); }
ISteamParentalSettings_BIsFeatureInBlockList :: inline (this: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool { return this.vtable.BIsFeatureInBlockList(this, eFeature); }

vtable :: (obj: *ISteamParentalSettings) -> *ISteamParentalSettings_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: Callback for querying UGC
//-----------------------------------------------------------------------------
SteamParentalSettingsChanged_t :: struct {
    anon_enum_237 :: enum s32 {
        k_iCallback :: 5001;
    }
    __empty_struct_padding: u8; // C++ makes empty structs have length 1
}

//-----------------------------------------------------------------------------
// Purpose: The form factor of a device
//-----------------------------------------------------------------------------
ESteamDeviceFormFactor :: enum s32 {
    ESteamDeviceFormFactorUnknown   :: 0;
    ESteamDeviceFormFactorPhone     :: 1;
    ESteamDeviceFormFactorTablet    :: 2;
    ESteamDeviceFormFactorComputer  :: 3;
    ESteamDeviceFormFactorTV        :: 4;
    ESteamDeviceFormFactorVRHeadset :: 5;

    k_ESteamDeviceFormFactorUnknown   :: ESteamDeviceFormFactorUnknown;
    k_ESteamDeviceFormFactorPhone     :: ESteamDeviceFormFactorPhone;
    k_ESteamDeviceFormFactorTablet    :: ESteamDeviceFormFactorTablet;
    k_ESteamDeviceFormFactorComputer  :: ESteamDeviceFormFactorComputer;
    k_ESteamDeviceFormFactorTV        :: ESteamDeviceFormFactorTV;
    k_ESteamDeviceFormFactorVRHeadset :: ESteamDeviceFormFactorVRHeadset;
}

// Steam Remote Play session ID
RemotePlaySessionID_t :: uint32;

//-----------------------------------------------------------------------------
// Purpose: Functions to provide information about Steam Remote Play sessions
//-----------------------------------------------------------------------------
ISteamRemotePlay :: struct {
    vtable: *ISteamRemotePlay_VTable;
}
ISteamRemotePlay_VTable :: struct #type_info_none {
    GetSessionCount: (this: *ISteamRemotePlay) -> uint32 #cpp_method;

    GetSessionID: (this: *ISteamRemotePlay, iSessionIndex: s32) -> RemotePlaySessionID_t #cpp_method;

    GetSessionSteamID: (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    GetSessionClientName: (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> *u8 #cpp_method;

    GetSessionClientFormFactor: (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor #cpp_method;

    BGetSessionClientResolution: (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t, pnResolutionX: *s32, pnResolutionY: *s32) -> bool #cpp_method;

    BStartRemotePlayTogether: (this: *ISteamRemotePlay, bShowOverlay := true) -> bool #cpp_method;

    BSendRemotePlayTogetherInvite: (this: *ISteamRemotePlay, steamIDFriend: CSteamID) -> bool #cpp_method;
}

ISteamRemotePlay_GetSessionCount :: inline (this: *ISteamRemotePlay) -> uint32 { return this.vtable.GetSessionCount(this); }

ISteamRemotePlay_GetSessionID :: inline (this: *ISteamRemotePlay, iSessionIndex: s32) -> RemotePlaySessionID_t { return this.vtable.GetSessionID(this, iSessionIndex); }

ISteamRemotePlay_GetSessionSteamID :: inline (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> CSteamID { return this.vtable.GetSessionSteamID(this, unSessionID); }

ISteamRemotePlay_GetSessionClientName :: inline (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> *u8 { return this.vtable.GetSessionClientName(this, unSessionID); }

ISteamRemotePlay_GetSessionClientFormFactor :: inline (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor { return this.vtable.GetSessionClientFormFactor(this, unSessionID); }

ISteamRemotePlay_BGetSessionClientResolution :: inline (this: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t, pnResolutionX: *s32, pnResolutionY: *s32) -> bool { return this.vtable.BGetSessionClientResolution(this, unSessionID, pnResolutionX, pnResolutionY); }

ISteamRemotePlay_BStartRemotePlayTogether :: inline (this: *ISteamRemotePlay, bShowOverlay := true) -> bool { return this.vtable.BStartRemotePlayTogether(this, bShowOverlay); }

ISteamRemotePlay_BSendRemotePlayTogetherInvite :: inline (this: *ISteamRemotePlay, steamIDFriend: CSteamID) -> bool { return this.vtable.BSendRemotePlayTogetherInvite(this, steamIDFriend); }

vtable :: (obj: *ISteamRemotePlay) -> *ISteamRemotePlay_VTable { return obj.vtable; }


SteamRemotePlaySessionConnected_t :: struct {
    anon_enum_238 :: enum s32 {
        k_iCallback :: 5701;
    }
    m_unSessionID: RemotePlaySessionID_t;
}

SteamRemotePlaySessionDisconnected_t :: struct {
    anon_enum_239 :: enum s32 {
        k_iCallback :: 5702;
    }
    m_unSessionID: RemotePlaySessionID_t;
}

SteamRemotePlayTogetherGuestInvite_t :: struct {
    anon_enum_240 :: enum s32 {
        k_iCallback :: 5703;
    }
    m_szConnectURL: [1024] u8;
}

SteamDatagramRelayAuthTicket :: struct {}
SteamDatagramHostedAddress :: struct {}
SteamDatagramGameCoordinatorServerLogin :: struct {}

SteamNetworkingFakeIPResult_t :: struct {}

FnSteamNetConnectionStatusChanged :: #type (unknown0: *SteamNetConnectionStatusChangedCallback_t) -> void #c_call;
FnSteamNetAuthenticationStatusChanged :: #type (unknown0: *SteamNetAuthenticationStatus_t) -> void #c_call;
FnSteamRelayNetworkStatusChanged :: #type (unknown0: *SteamRelayNetworkStatus_t) -> void #c_call;
FnSteamNetworkingMessagesSessionRequest :: #type (unknown0: *SteamNetworkingMessagesSessionRequest_t) -> void #c_call;
FnSteamNetworkingMessagesSessionFailed :: #type (unknown0: *SteamNetworkingMessagesSessionFailed_t) -> void #c_call;
FnSteamNetworkingFakeIPResult :: #type (unknown0: *SteamNetworkingFakeIPResult_t) -> void #c_call;

/// Handle used to identify a connection to a remote host.
HSteamNetConnection :: uint32;
k_HSteamNetConnection_Invalid: HSteamNetConnection : 0;

/// Handle used to identify a "listen socket".  Unlike traditional
/// Berkeley sockets, a listen socket and a connection are two
/// different abstractions.
HSteamListenSocket :: uint32;
k_HSteamListenSocket_Invalid: HSteamListenSocket : 0;

/// Handle used to identify a poll group, used to query many
/// connections at once efficiently.
HSteamNetPollGroup :: uint32;
k_HSteamNetPollGroup_Invalid: HSteamNetPollGroup : 0;

/// Max length of diagnostic error message
k_cchMaxSteamNetworkingErrMsg: s32 : 1024;

/// Used to return English-language diagnostic error messages to caller.
/// (For debugging or spewing to a console, etc.  Not intended for UI.)
SteamNetworkingErrMsg :: [1024] u8;

/// Identifier used for a network location point of presence.  (E.g. a Valve data center.)
/// Typically you won't need to directly manipulate these.
SteamNetworkingPOPID :: uint32;

/// A local timestamp.  You can subtract two timestamps to get the number of elapsed
/// microseconds.  This is guaranteed to increase over time during the lifetime
/// of a process, but not globally across runs.  You don't need to worry about
/// the value wrapping around.  Note that the underlying clock might not actually have
/// microsecond resolution.
SteamNetworkingMicroseconds :: int64;

/// Describe the status of a particular network resource
ESteamNetworkingAvailability :: enum s32 {
    CannotTry  :: -102;
    Failed     :: -101;
    Previously :: -100;

    Retrying   :: -10;

    NeverTried :: 1;
    Waiting    :: 2;
    Attempting :: 3;

    Current    :: 100;

    Unknown    :: 0;
    Force32bit :: 2147483647;

    k_ESteamNetworkingAvailability_CannotTry   :: CannotTry;
    k_ESteamNetworkingAvailability_Failed      :: Failed;
    k_ESteamNetworkingAvailability_Previously  :: Previously;

    k_ESteamNetworkingAvailability_Retrying    :: Retrying;

    k_ESteamNetworkingAvailability_NeverTried  :: NeverTried;
    k_ESteamNetworkingAvailability_Waiting     :: Waiting;
    k_ESteamNetworkingAvailability_Attempting  :: Attempting;

    k_ESteamNetworkingAvailability_Current     :: Current;

    k_ESteamNetworkingAvailability_Unknown     :: Unknown;
    k_ESteamNetworkingAvailability__Force32bit :: Force32bit;
}

/// Different methods of describing the identity of a network host
ESteamNetworkingIdentityType :: enum s32 {
    Invalid        :: 0;

    SteamID        :: 16;
    XboxPairwiseID :: 17;
    SonyPSN        :: 18;
    GoogleStadia   :: 19;

    IPAddress      :: 1;

    GenericString  :: 2;
    GenericBytes   :: 3;

    UnknownType    :: 4;

    Force32bit     :: 2147483647;

    k_ESteamNetworkingIdentityType_Invalid        :: Invalid;

    k_ESteamNetworkingIdentityType_SteamID        :: SteamID;
    k_ESteamNetworkingIdentityType_XboxPairwiseID :: XboxPairwiseID;
    k_ESteamNetworkingIdentityType_SonyPSN        :: SonyPSN;
    k_ESteamNetworkingIdentityType_GoogleStadia   :: GoogleStadia;

    k_ESteamNetworkingIdentityType_IPAddress      :: IPAddress;

    k_ESteamNetworkingIdentityType_GenericString  :: GenericString;
    k_ESteamNetworkingIdentityType_GenericBytes   :: GenericBytes;

    k_ESteamNetworkingIdentityType_UnknownType    :: UnknownType;

    k_ESteamNetworkingIdentityType__Force32bit    :: Force32bit;
}

/// "Fake IPs" are assigned to hosts, to make it easier to interface with
/// older code that assumed all hosts will have an IPv4 address
ESteamNetworkingFakeIPType :: enum s32 {
    Invalid    :: 0;
    NotFake    :: 1;
    GlobalIPv4 :: 2;
    LocalIPv4  :: 3;

    Force32Bit :: 2147483647;

    k_ESteamNetworkingFakeIPType_Invalid     :: Invalid;
    k_ESteamNetworkingFakeIPType_NotFake     :: NotFake;
    k_ESteamNetworkingFakeIPType_GlobalIPv4  :: GlobalIPv4;
    k_ESteamNetworkingFakeIPType_LocalIPv4   :: LocalIPv4;

    k_ESteamNetworkingFakeIPType__Force32Bit :: Force32Bit;
}

/// Store an IP and port.  IPv6 is always used; IPv4 is represented using
/// "IPv4-mapped" addresses: IPv4 aa.bb.cc.dd => IPv6 ::ffff:aabb:ccdd
/// (RFC 4291 section 2.5.5.2.)
SteamNetworkingIPAddr :: struct {
    // Max length of the buffer needed to hold IP formatted using ToString, including '\0'
    // ([0123:4567:89ab:cdef:0123:4567:89ab:cdef]:12345)
    anon_enum_241 :: enum s32 {
        k_cchMaxString :: 48;
    }

    /// RFC4038, section 4.2
    IPv4MappedAddress :: struct {
        m_8zeros: uint64;
        m_0000:   uint16;
        m_ffff:   uint16;
        m_ip:     [4] uint8; // NOTE: As bytes, i.e. network byte order
    }

    union {
        m_ipv6: [16] uint8;
        m_ipv4: IPv4MappedAddress;
    }

    m_port: uint16; // Host byte order
}

// Forward declare types
SteamNetworkingIdentity :: struct {
    /// Type of identity.
    m_eType:  ESteamNetworkingIdentityType;

    // Max sizes
    k_2 :: enum s32 {
        cchMaxString         :: 128;
        cchMaxGenericString  :: 32;
        cchMaxXboxPairwiseID :: 33;
        cbMaxGenericBytes    :: 32;

        k_cchMaxString         :: cchMaxString;
        k_cchMaxGenericString  :: cchMaxGenericString;
        k_cchMaxXboxPairwiseID :: cchMaxXboxPairwiseID;
        k_cbMaxGenericBytes    :: cbMaxGenericBytes;
    }

    //
    // Internal representation.  Don't access this directly, use the accessors!
    //
    // Number of bytes that are relevant below.  This MUST ALWAYS be
    // set.  (Use the accessors!)  This is important to enable old code to work
    // with new identity types.
    m_cbSize: s32;
    union {
        m_steamID64:          uint64;
        m_PSNID:              uint64;
        m_stadiaID:           uint64;
        m_szGenericString:    [32] u8;
        m_szXboxPairwiseID:   [33] u8;
        m_genericBytes:       [32] uint8;
        m_szUnknownRawString: [128] u8;
        m_ip:                 SteamNetworkingIPAddr;
        m_reserved:           [32] uint32; // Pad structure to leave easy room for future expansion
    }
}

/// High level connection status
ESteamNetworkingConnectionState :: enum s32 {
    None                   :: 0;

    Connecting             :: 1;

    FindingRoute           :: 2;

    Connected              :: 3;

    ClosedByPeer           :: 4;

    ProblemDetectedLocally :: 5;

    FinWait                :: -1;

    Linger                 :: -2;

    Dead                   :: -3;

    Force32Bit             :: 2147483647;

    k_ESteamNetworkingConnectionState_None                   :: None;

    k_ESteamNetworkingConnectionState_Connecting             :: Connecting;

    k_ESteamNetworkingConnectionState_FindingRoute           :: FindingRoute;

    k_ESteamNetworkingConnectionState_Connected              :: Connected;

    k_ESteamNetworkingConnectionState_ClosedByPeer           :: ClosedByPeer;

    k_ESteamNetworkingConnectionState_ProblemDetectedLocally :: ProblemDetectedLocally;

    k_ESteamNetworkingConnectionState_FinWait                :: FinWait;

    k_ESteamNetworkingConnectionState_Linger                 :: Linger;

    k_ESteamNetworkingConnectionState_Dead                   :: Dead;

    k_ESteamNetworkingConnectionState__Force32Bit            :: Force32Bit;
}

/// Enumerate various causes of connection termination.  These are designed to work similar
/// to HTTP error codes: the numeric range gives you a rough classification as to the source
/// of the problem.
ESteamNetConnectionEnd :: enum s32 {
    Invalid                          :: 0;

    App_Min                          :: 1000;
    App_Generic                      :: 1000;

    App_Max                          :: 1999;

    AppException_Min                 :: 2000;
    AppException_Generic             :: 2000;

    AppException_Max                 :: 2999;

    Local_Min                        :: 3000;

    Local_OfflineMode                :: 3001;

    Local_ManyRelayConnectivity      :: 3002;

    Local_HostedServerPrimaryRelay   :: 3003;

    Local_NetworkConfig              :: 3004;

    Local_Rights                     :: 3005;

    Local_P2P_ICE_NoPublicAddresses  :: 3006;

    Local_Max                        :: 3999;

    Remote_Min                       :: 4000;

    Remote_Timeout                   :: 4001;

    Remote_BadCrypt                  :: 4002;

    Remote_BadCert                   :: 4003;

    Remote_BadProtocolVersion        :: 4006;

    Remote_P2P_ICE_NoPublicAddresses :: 4007;

    Remote_Max                       :: 4999;

    Misc_Min                         :: 5000;

    Misc_Generic                     :: 5001;

    Misc_InternalError               :: 5002;

    Misc_Timeout                     :: 5003;

    Misc_SteamConnectivity           :: 5005;

    Misc_NoRelaySessionsToClient     :: 5006;

    Misc_P2P_Rendezvous              :: 5008;

    Misc_P2P_NAT_Firewall            :: 5009;

    Misc_PeerSentNoConnection        :: 5010;

    Misc_Max                         :: 5999;

    Force32Bit                       :: 2147483647;

    k_ESteamNetConnectionEnd_Invalid                          :: Invalid;

    k_ESteamNetConnectionEnd_App_Min                          :: App_Min;
    k_ESteamNetConnectionEnd_App_Generic                      :: App_Generic;

    k_ESteamNetConnectionEnd_App_Max                          :: App_Max;

    k_ESteamNetConnectionEnd_AppException_Min                 :: AppException_Min;
    k_ESteamNetConnectionEnd_AppException_Generic             :: AppException_Generic;

    k_ESteamNetConnectionEnd_AppException_Max                 :: AppException_Max;

    k_ESteamNetConnectionEnd_Local_Min                        :: Local_Min;

    k_ESteamNetConnectionEnd_Local_OfflineMode                :: Local_OfflineMode;

    k_ESteamNetConnectionEnd_Local_ManyRelayConnectivity      :: Local_ManyRelayConnectivity;

    k_ESteamNetConnectionEnd_Local_HostedServerPrimaryRelay   :: Local_HostedServerPrimaryRelay;

    k_ESteamNetConnectionEnd_Local_NetworkConfig              :: Local_NetworkConfig;

    k_ESteamNetConnectionEnd_Local_Rights                     :: Local_Rights;

    k_ESteamNetConnectionEnd_Local_P2P_ICE_NoPublicAddresses  :: Local_P2P_ICE_NoPublicAddresses;

    k_ESteamNetConnectionEnd_Local_Max                        :: Local_Max;

    k_ESteamNetConnectionEnd_Remote_Min                       :: Remote_Min;

    k_ESteamNetConnectionEnd_Remote_Timeout                   :: Remote_Timeout;

    k_ESteamNetConnectionEnd_Remote_BadCrypt                  :: Remote_BadCrypt;

    k_ESteamNetConnectionEnd_Remote_BadCert                   :: Remote_BadCert;

    k_ESteamNetConnectionEnd_Remote_BadProtocolVersion        :: Remote_BadProtocolVersion;

    k_ESteamNetConnectionEnd_Remote_P2P_ICE_NoPublicAddresses :: Remote_P2P_ICE_NoPublicAddresses;

    k_ESteamNetConnectionEnd_Remote_Max                       :: Remote_Max;

    k_ESteamNetConnectionEnd_Misc_Min                         :: Misc_Min;

    k_ESteamNetConnectionEnd_Misc_Generic                     :: Misc_Generic;

    k_ESteamNetConnectionEnd_Misc_InternalError               :: Misc_InternalError;

    k_ESteamNetConnectionEnd_Misc_Timeout                     :: Misc_Timeout;

    k_ESteamNetConnectionEnd_Misc_SteamConnectivity           :: Misc_SteamConnectivity;

    k_ESteamNetConnectionEnd_Misc_NoRelaySessionsToClient     :: Misc_NoRelaySessionsToClient;

    k_ESteamNetConnectionEnd_Misc_P2P_Rendezvous              :: Misc_P2P_Rendezvous;

    k_ESteamNetConnectionEnd_Misc_P2P_NAT_Firewall            :: Misc_P2P_NAT_Firewall;

    k_ESteamNetConnectionEnd_Misc_PeerSentNoConnection        :: Misc_PeerSentNoConnection;

    k_ESteamNetConnectionEnd_Misc_Max                         :: Misc_Max;

    k_ESteamNetConnectionEnd__Force32Bit                      :: Force32Bit;
}

/// Max length, in bytes (including null terminator) of the reason string
/// when a connection is closed.
k_cchSteamNetworkingMaxConnectionCloseReason: s32 : 128;

/// Max length, in bytes (include null terminator) of debug description
/// of a connection.
k_cchSteamNetworkingMaxConnectionDescription: s32 : 128;

/// Max length of the app's part of the description
k_cchSteamNetworkingMaxConnectionAppName: s32 : 32;

k_nSteamNetworkConnectionInfoFlags_Unauthenticated: s32 : 1; // We don't have a certificate for the remote host.
k_nSteamNetworkConnectionInfoFlags_Unencrypted: s32 : 2; // Information is being sent out over a wire unencrypted (by this library)
k_nSteamNetworkConnectionInfoFlags_LoopbackBuffers: s32 : 4; // Internal loopback buffers.  Won't be true for localhost.  (You can check the address to determine that.)  This implies k_nSteamNetworkConnectionInfoFlags_FastLAN
k_nSteamNetworkConnectionInfoFlags_Fast: s32 : 8; // The connection is "fast" and "reliable".  Either internal/localhost (check the address to find out), or the peer is on the same LAN.  (Probably.  It's based on the address and the ping time, this is actually hard to determine unambiguously).
k_nSteamNetworkConnectionInfoFlags_Relayed: s32 : 16; // The connection is relayed somehow (SDR or TURN).
k_nSteamNetworkConnectionInfoFlags_DualWifi: s32 : 32; // We're taking advantage of dual-wifi multi-path

/// Describe the state of a connection.
SteamNetConnectionInfo_t :: struct {
    /// Who is on the other end?  Depending on the connection type and phase of the connection, we might not know
    m_identityRemote:          SteamNetworkingIdentity;

    /// Arbitrary user data set by the local application code
    m_nUserData:               int64;

    /// Handle to listen socket this was connected on, or k_HSteamListenSocket_Invalid if we initiated the connection
    m_hListenSocket:           HSteamListenSocket;

    /// Remote address.  Might be all 0's if we don't know it, or if this is N/A.
    /// (E.g. Basically everything except direct UDP connection.)
    m_addrRemote:              SteamNetworkingIPAddr;
    m__pad1:                   uint16;

    /// What data center is the remote host in?  (0 if we don't know.)
    m_idPOPRemote:             SteamNetworkingPOPID;

    /// What relay are we using to communicate with the remote host?
    /// (0 if not applicable.)
    m_idPOPRelay:              SteamNetworkingPOPID;

    /// High level state of the connection
    m_eState:                  ESteamNetworkingConnectionState;

    /// Basic cause of the connection termination or problem.
    /// See ESteamNetConnectionEnd for the values used
    m_eEndReason:              s32;

    /// Human-readable, but non-localized explanation for connection
    /// termination or problem.  This is intended for debugging /
    /// diagnostic purposes only, not to display to users.  It might
    /// have some details specific to the issue.
    m_szEndDebug:              [128] u8;

    /// Debug description.  This includes the internal connection ID,
    /// connection type (and peer information), and any name
    /// given to the connection by the app.  This string is used in various
    /// internal logging messages.
    ///
    /// Note that the connection ID *usually* matches the HSteamNetConnection
    /// handle, but in certain cases with symmetric connections it might not.
    m_szConnectionDescription: [128] u8;

    /// Misc flags.  Bitmask of k_nSteamNetworkConnectionInfoFlags_Xxxx
    m_nFlags:                  s32;

    /// Internal stuff, room to change API easily
    reserved:                  [63] uint32;
}

/// Quick connection state, pared down to something you could call
/// more frequently without it being too big of a perf hit.
SteamNetConnectionRealTimeStatus_t :: struct {
    /// High level state of the connection
    m_eState:                    ESteamNetworkingConnectionState;

    /// Current ping (ms)
    m_nPing:                     s32;

    /// Connection quality measured locally, 0...1.  (Percentage of packets delivered
    /// end-to-end in order).
    m_flConnectionQualityLocal:  float;

    /// Packet delivery success rate as observed from remote host
    m_flConnectionQualityRemote: float;

    /// Current data rates from recent history.
    m_flOutPacketsPerSec:        float;
    m_flOutBytesPerSec:          float;
    m_flInPacketsPerSec:         float;
    m_flInBytesPerSec:           float;

    /// Estimate rate that we believe that we can send data to our peer.
    /// Note that this could be significantly higher than m_flOutBytesPerSec,
    /// meaning the capacity of the channel is higher than you are sending data.
    /// (That's OK!)
    m_nSendRateBytesPerSecond:   s32;

    /// Number of bytes pending to be sent.  This is data that you have recently
    /// requested to be sent but has not yet actually been put on the wire.  The
    /// reliable number ALSO includes data that was previously placed on the wire,
    /// but has now been scheduled for re-transmission.  Thus, it's possible to
    /// observe m_cbPendingReliable increasing between two checks, even if no
    /// calls were made to send reliable data between the checks.  Data that is
    /// awaiting the Nagle delay will appear in these numbers.
    m_cbPendingUnreliable:       s32;
    m_cbPendingReliable:         s32;

    /// Number of bytes of reliable data that has been placed the wire, but
    /// for which we have not yet received an acknowledgment, and thus we may
    /// have to re-transmit.
    m_cbSentUnackedReliable:     s32;

    /// If you queued a message right now, approximately how long would that message
    /// wait in the queue before we actually started putting its data on the wire in
    /// a packet?
    ///
    /// In general, data that is sent by the application is limited by the bandwidth
    /// of the channel.  If you send data faster than this, it must be queued and
    /// put on the wire at a metered rate.  Even sending a small amount of data (e.g.
    /// a few MTU, say ~3k) will require some of the data to be delayed a bit.
    ///
    /// Ignoring multiple lanes, the estimated delay will be approximately equal to
    ///
    ///		( m_cbPendingUnreliable+m_cbPendingReliable ) / m_nSendRateBytesPerSecond
    ///
    /// plus or minus one MTU.  It depends on how much time has elapsed since the last
    /// packet was put on the wire.  For example, the queue might have *just* been emptied,
    /// and the last packet placed on the wire, and we are exactly up against the send
    /// rate limit.  In that case we might need to wait for one packet's worth of time to
    /// elapse before we can send again.  On the other extreme, the queue might have data
    /// in it waiting for Nagle.  (This will always be less than one packet, because as
    /// soon as we have a complete packet we would send it.)  In that case, we might be
    /// ready to send data now, and this value will be 0.
    ///
    /// This value is only valid if multiple lanes are not used.  If multiple lanes are
    /// in use, then the queue time will be different for each lane, and you must use
    /// the value in SteamNetConnectionRealTimeLaneStatus_t.
    ///
    /// Nagle delay is ignored for the purposes of this calculation.
    m_usecQueueTime:             SteamNetworkingMicroseconds;

    // Internal stuff, room to change API easily
    reserved:                    [16] uint32;
}

/// Quick status of a particular lane
SteamNetConnectionRealTimeLaneStatus_t :: struct {
    // Counters for this particular lane.  See the corresponding variables
    // in SteamNetConnectionRealTimeStatus_t
    m_cbPendingUnreliable:   s32;
    m_cbPendingReliable:     s32;
    m_cbSentUnackedReliable: s32;
    _reservePad1:            s32; // Reserved for future use

    /// Lane-specific queue time.  This value takes into consideration lane priorities
    /// and weights, and how much data is queued in each lane, and attempts to predict
    /// how any data currently queued will be sent out.
    m_usecQueueTime:         SteamNetworkingMicroseconds;

    // Internal stuff, room to change API easily
    reserved:                [10] uint32;
}

/// Max size of a single message that we can SEND.
/// Note: We might be wiling to receive larger messages,
/// and our peer might, too.
k_cbMaxSteamNetworkingSocketsMessageSizeSend: s32 : 512 * 1024;

/// A message that has been received.
SteamNetworkingMessage_t :: struct {
    /// Message payload
    m_pData:            *void;

    /// Size of the payload.
    m_cbSize:           s32;

    /// For messages received on connections: what connection did this come from?
    /// For outgoing messages: what connection to send it to?
    /// Not used when using the ISteamNetworkingMessages interface
    m_conn:             HSteamNetConnection;

    /// For inbound messages: Who sent this to us?
    /// For outbound messages on connections: not used.
    /// For outbound messages on the ad-hoc ISteamNetworkingMessages interface: who should we send this to?
    m_identityPeer:     SteamNetworkingIdentity;

    /// For messages received on connections, this is the user data
    /// associated with the connection.
    ///
    /// This is *usually* the same as calling GetConnection() and then
    /// fetching the user data associated with that connection, but for
    /// the following subtle differences:
    ///
    /// - This user data will match the connection's user data at the time
    ///   is captured at the time the message is returned by the API.
    ///   If you subsequently change the userdata on the connection,
    ///   this won't be updated.
    /// - This is an inline call, so it's *much* faster.
    /// - You might have closed the connection, so fetching the user data
    ///   would not be possible.
    ///
    /// Not used when sending messages.
    m_nConnUserData:    int64;

    /// Local timestamp when the message was received
    /// Not used for outbound messages.
    m_usecTimeReceived: SteamNetworkingMicroseconds;

    /// Message number assigned by the sender.  This is not used for outbound
    /// messages.  Note that if multiple lanes are used, each lane has its own
    /// message numbers, which are assigned sequentially, so messages from
    /// different lanes will share the same numbers.
    m_nMessageNumber:   int64;

    /// Function used to free up m_pData.  This mechanism exists so that
    /// apps can create messages with buffers allocated from their own
    /// heap, and pass them into the library.  This function will
    /// usually be something like:
    ///
    /// free( pMsg->m_pData );
    m_pfnFreeData:      #type (pMsg: *SteamNetworkingMessage_t) -> void #c_call;

    /// Function to used to decrement the internal reference count and, if
    /// it's zero, release the message.  You should not set this function pointer,
    /// or need to access this directly!  Use the Release() function instead!
    m_pfnRelease:       #type (pMsg: *SteamNetworkingMessage_t) -> void #c_call;

    /// When using ISteamNetworkingMessages, the channel number the message was received on
    /// (Not used for messages sent or received on "connections")
    m_nChannel:         s32;

    /// Bitmask of k_nSteamNetworkingSend_xxx flags.
    /// For received messages, only the k_nSteamNetworkingSend_Reliable bit is valid.
    /// For outbound messages, all bits are relevant
    m_nFlags:           s32;

    /// Arbitrary user data that you can use when sending messages using
    /// ISteamNetworkingUtils::AllocateMessage and ISteamNetworkingSockets::SendMessage.
    /// (The callback you set in m_pfnFreeData might use this field.)
    ///
    /// Not used for received messages.
    m_nUserData:        int64;

    /// For outbound messages, which lane to use?  See ISteamNetworkingSockets::ConfigureConnectionLanes.
    /// For inbound messages, what lane was the message received on?
    m_idxLane:          uint16;
    _pad1__:            uint16;
}

// Send the message unreliably. Can be lost.  Messages *can* be larger than a
// single MTU (UDP packet), but there is no retransmission, so if any piece
// of the message is lost, the entire message will be dropped.
//
// The sending API does have some knowledge of the underlying connection, so
// if there is no NAT-traversal accomplished or there is a recognized adjustment
// happening on the connection, the packet will be batched until the connection
// is open again.
//
// Migration note: This is not exactly the same as k_EP2PSendUnreliable!  You
// probably want k_ESteamNetworkingSendType_UnreliableNoNagle
k_nSteamNetworkingSend_Unreliable: s32 : 0;

// Disable Nagle's algorithm.
// By default, Nagle's algorithm is applied to all outbound messages.  This means
// that the message will NOT be sent immediately, in case further messages are
// sent soon after you send this, which can be grouped together.  Any time there
// is enough buffered data to fill a packet, the packets will be pushed out immediately,
// but partially-full packets not be sent until the Nagle timer expires.  See
// ISteamNetworkingSockets::FlushMessagesOnConnection, ISteamNetworkingMessages::FlushMessagesToUser
//
// NOTE: Don't just send every message without Nagle because you want packets to get there
// quicker.  Make sure you understand the problem that Nagle is solving before disabling it.
// If you are sending small messages, often many at the same time, then it is very likely that
// it will be more efficient to leave Nagle enabled.  A typical proper use of this flag is
// when you are sending what you know will be the last message sent for a while (e.g. the last
// in the server simulation tick to a particular client), and you use this flag to flush all
// messages.
k_nSteamNetworkingSend_NoNagle: s32 : 1;

// Send a message unreliably, bypassing Nagle's algorithm for this message and any messages
// currently pending on the Nagle timer.  This is equivalent to using k_ESteamNetworkingSend_Unreliable
// and then immediately flushing the messages using ISteamNetworkingSockets::FlushMessagesOnConnection
// or ISteamNetworkingMessages::FlushMessagesToUser.  (But using this flag is more efficient since you
// only make one API call.)
k_nSteamNetworkingSend_UnreliableNoNagle: s32 : k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoNagle;

// If the message cannot be sent very soon (because the connection is still doing some initial
// handshaking, route negotiations, etc), then just drop it.  This is only applicable for unreliable
// messages.  Using this flag on reliable messages is invalid.
k_nSteamNetworkingSend_NoDelay: s32 : 4;

// Send an unreliable message, but if it cannot be sent relatively quickly, just drop it instead of queuing it.
// This is useful for messages that are not useful if they are excessively delayed, such as voice data.
// NOTE: The Nagle algorithm is not used, and if the message is not dropped, any messages waiting on the
// Nagle timer are immediately flushed.
//
// A message will be dropped under the following circumstances:
// - the connection is not fully connected.  (E.g. the "Connecting" or "FindingRoute" states)
// - there is a sufficiently large number of messages queued up already such that the current message
//   will not be placed on the wire in the next ~200ms or so.
//
// If a message is dropped for these reasons, k_EResultIgnored will be returned.
k_nSteamNetworkingSend_UnreliableNoDelay: s32 : k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoDelay | k_nSteamNetworkingSend_NoNagle;

// Reliable message send. Can send up to k_cbMaxSteamNetworkingSocketsMessageSizeSend bytes in a single message.
// Does fragmentation/re-assembly of messages under the hood, as well as a sliding window for
// efficient sends of large chunks of data.
//
// The Nagle algorithm is used.  See notes on k_ESteamNetworkingSendType_Unreliable for more details.
// See k_ESteamNetworkingSendType_ReliableNoNagle, ISteamNetworkingSockets::FlushMessagesOnConnection,
// ISteamNetworkingMessages::FlushMessagesToUser
//
// Migration note: This is NOT the same as k_EP2PSendReliable, it's more like k_EP2PSendReliableWithBuffering
k_nSteamNetworkingSend_Reliable: s32 : 8;

// Send a message reliably, but bypass Nagle's algorithm.
//
// Migration note: This is equivalent to k_EP2PSendReliable
k_nSteamNetworkingSend_ReliableNoNagle: s32 : k_nSteamNetworkingSend_Reliable | k_nSteamNetworkingSend_NoNagle;

// By default, message sending is queued, and the work of encryption and talking to
// the operating system sockets, etc is done on a service thread.  This is usually a
// a performance win when messages are sent from the "main thread".  However, if this
// flag is set, and data is ready to be sent immediately (either from this message
// or earlier queued data), then that work will be done in the current thread, before
// the current call returns.  If data is not ready to be sent (due to rate limiting
// or Nagle), then this flag has no effect.
//
// This is an advanced flag used to control performance at a very low level.  For
// most applications running on modern hardware with more than one CPU core, doing
// the work of sending on a service thread will yield the best performance.  Only
// use this flag if you have a really good reason and understand what you are doing.
// Otherwise you will probably just make performance worse.
k_nSteamNetworkingSend_UseCurrentThread: s32 : 16;

// When sending a message using ISteamNetworkingMessages, automatically re-establish
// a broken session, without returning k_EResultNoConnection.  Without this flag,
// if you attempt to send a message, and the session was proactively closed by the
// peer, or an error occurred that disrupted communications, then you must close the
// session using ISteamNetworkingMessages::CloseSessionWithUser before attempting to
// send another message.  (Or you can simply add this flag and retry.)  In this way,
// the disruption cannot go unnoticed, and a more clear order of events can be
// ascertained. This is especially important when reliable messages are used, since
// if the connection is disrupted, some of those messages will not have been delivered,
// and it is in general not possible to know which.  Although a
// SteamNetworkingMessagesSessionFailed_t callback will be posted when an error occurs
// to notify you that a failure has happened, callbacks are asynchronous, so it is not
// possible to tell exactly when it happened.  And because the primary purpose of
// ISteamNetworkingMessages is to be like UDP, there is no notification when a peer closes
// the session.
//
// If you are not using any reliable messages (e.g. you are using ISteamNetworkingMessages
// exactly as a transport replacement for UDP-style datagrams only), you may not need to
// know when an underlying connection fails, and so you may not need this notification.
k_nSteamNetworkingSend_AutoRestartBrokenSession: s32 : 32;

/// Object that describes a "location" on the Internet with sufficient
/// detail that we can reasonably estimate an upper bound on the ping between
/// the two hosts, even if a direct route between the hosts is not possible,
/// and the connection must be routed through the Steam Datagram Relay network.
/// This does not contain any information that identifies the host.  Indeed,
/// if two hosts are in the same building or otherwise have nearly identical
/// networking characteristics, then it's valid to use the same location
/// object for both of them.
///
/// NOTE: This object should only be used in the same process!  Do not serialize it,
/// send it over the wire, or persist it in a file or database!  If you need
/// to do that, convert it to a string representation using the methods in
/// ISteamNetworkingUtils().
SteamNetworkPingLocation_t :: struct {
    m_data: [512] uint8;
}

/// Max possible length of a ping location, in string format.  This is
/// an extremely conservative worst case value which leaves room for future
/// syntax enhancements.  Most strings in practice are a lot shorter.
/// If you are storing many of these, you will very likely benefit from
/// using dynamic memory.
k_cchMaxSteamNetworkingPingLocationString: s32 : 1024;

/// Special values that are returned by some functions that return a ping.
k_nSteamNetworkingPing_Failed: s32 : -1;
k_nSteamNetworkingPing_Unknown: s32 : -2;

/// Configuration values can be applied to different types of objects.
ESteamNetworkingConfigScope :: enum s32 {
    ESteamNetworkingConfig_Global           :: 1;

    ESteamNetworkingConfig_SocketsInterface :: 2;

    ESteamNetworkingConfig_ListenSocket     :: 3;

    ESteamNetworkingConfig_Connection       :: 4;

    ESteamNetworkingConfigScope__Force32Bit :: 2147483647;

    k_ESteamNetworkingConfig_Global           :: ESteamNetworkingConfig_Global;

    k_ESteamNetworkingConfig_SocketsInterface :: ESteamNetworkingConfig_SocketsInterface;

    k_ESteamNetworkingConfig_ListenSocket     :: ESteamNetworkingConfig_ListenSocket;

    k_ESteamNetworkingConfig_Connection       :: ESteamNetworkingConfig_Connection;

    k_ESteamNetworkingConfigScope__Force32Bit :: ESteamNetworkingConfigScope__Force32Bit;
}

// Different configuration values have different data types
ESteamNetworkingConfigDataType :: enum s32 {
    ESteamNetworkingConfig_Int32               :: 1;
    ESteamNetworkingConfig_Int64               :: 2;
    ESteamNetworkingConfig_Float               :: 3;
    ESteamNetworkingConfig_String              :: 4;
    ESteamNetworkingConfig_Ptr                 :: 5;

    ESteamNetworkingConfigDataType__Force32Bit :: 2147483647;

    k_ESteamNetworkingConfig_Int32               :: ESteamNetworkingConfig_Int32;
    k_ESteamNetworkingConfig_Int64               :: ESteamNetworkingConfig_Int64;
    k_ESteamNetworkingConfig_Float               :: ESteamNetworkingConfig_Float;
    k_ESteamNetworkingConfig_String              :: ESteamNetworkingConfig_String;
    k_ESteamNetworkingConfig_Ptr                 :: ESteamNetworkingConfig_Ptr;

    k_ESteamNetworkingConfigDataType__Force32Bit :: ESteamNetworkingConfigDataType__Force32Bit;
}

/// Configuration options
ESteamNetworkingConfigValue :: enum s32 {
    ESteamNetworkingConfig_Invalid                                        :: 0;

    ESteamNetworkingConfig_TimeoutInitial                                 :: 24;

    ESteamNetworkingConfig_TimeoutConnected                               :: 25;

    ESteamNetworkingConfig_SendBufferSize                                 :: 9;

    ESteamNetworkingConfig_RecvBufferSize                                 :: 47;

    ESteamNetworkingConfig_RecvBufferMessages                             :: 48;

    ESteamNetworkingConfig_RecvMaxMessageSize                             :: 49;

    ESteamNetworkingConfig_RecvMaxSegmentsPerPacket                       :: 50;

    ESteamNetworkingConfig_ConnectionUserData                             :: 40;

    ESteamNetworkingConfig_SendRateMin                                    :: 10;
    ESteamNetworkingConfig_SendRateMax                                    :: 11;

    ESteamNetworkingConfig_NagleTime                                      :: 12;

    ESteamNetworkingConfig_IP_AllowWithoutAuth                            :: 23;

    ESteamNetworkingConfig_IPLocalHost_AllowWithoutAuth                   :: 52;

    ESteamNetworkingConfig_MTU_PacketSize                                 :: 32;

    ESteamNetworkingConfig_MTU_DataSize                                   :: 33;

    ESteamNetworkingConfig_Unencrypted                                    :: 34;

    ESteamNetworkingConfig_SymmetricConnect                               :: 37;

    ESteamNetworkingConfig_LocalVirtualPort                               :: 38;

    ESteamNetworkingConfig_DualWifi_Enable                                :: 39;

    ESteamNetworkingConfig_EnableDiagnosticsUI                            :: 46;

    ESteamNetworkingConfig_FakePacketLoss_Send                            :: 2;
    ESteamNetworkingConfig_FakePacketLoss_Recv                            :: 3;

    ESteamNetworkingConfig_FakePacketLag_Send                             :: 4;
    ESteamNetworkingConfig_FakePacketLag_Recv                             :: 5;

    ESteamNetworkingConfig_FakePacketReorder_Send                         :: 6;
    ESteamNetworkingConfig_FakePacketReorder_Recv                         :: 7;

    ESteamNetworkingConfig_FakePacketReorder_Time                         :: 8;

    ESteamNetworkingConfig_FakePacketDup_Send                             :: 26;
    ESteamNetworkingConfig_FakePacketDup_Recv                             :: 27;

    ESteamNetworkingConfig_FakePacketDup_TimeMax                          :: 28;

    ESteamNetworkingConfig_PacketTraceMaxBytes                            :: 41;

    ESteamNetworkingConfig_FakeRateLimit_Send_Rate                        :: 42;
    ESteamNetworkingConfig_FakeRateLimit_Send_Burst                       :: 43;
    ESteamNetworkingConfig_FakeRateLimit_Recv_Rate                        :: 44;
    ESteamNetworkingConfig_FakeRateLimit_Recv_Burst                       :: 45;

    ESteamNetworkingConfig_OutOfOrderCorrectionWindowMicroseconds         :: 51;

    ESteamNetworkingConfig_Callback_ConnectionStatusChanged               :: 201;

    ESteamNetworkingConfig_Callback_AuthStatusChanged                     :: 202;

    ESteamNetworkingConfig_Callback_RelayNetworkStatusChanged             :: 203;

    ESteamNetworkingConfig_Callback_MessagesSessionRequest                :: 204;

    ESteamNetworkingConfig_Callback_MessagesSessionFailed                 :: 205;

    ESteamNetworkingConfig_Callback_CreateConnectionSignaling             :: 206;

    ESteamNetworkingConfig_Callback_FakeIPResult                          :: 207;

    ESteamNetworkingConfig_P2P_STUN_ServerList                            :: 103;

    ESteamNetworkingConfig_P2P_Transport_ICE_Enable                       :: 104;

    ESteamNetworkingConfig_P2P_Transport_ICE_Penalty                      :: 105;
    ESteamNetworkingConfig_P2P_Transport_SDR_Penalty                      :: 106;
    ESteamNetworkingConfig_P2P_TURN_ServerList                            :: 107;
    ESteamNetworkingConfig_P2P_TURN_UserList                              :: 108;
    ESteamNetworkingConfig_P2P_TURN_PassList                              :: 109;

    ESteamNetworkingConfig_P2P_Transport_ICE_Implementation               :: 110;

    ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFailInitial :: 19;

    ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFail        :: 20;

    ESteamNetworkingConfig_SDRClient_MinPingsBeforePingAccurate           :: 21;

    ESteamNetworkingConfig_SDRClient_SingleSocket                         :: 22;

    ESteamNetworkingConfig_SDRClient_ForceRelayCluster                    :: 29;

    ESteamNetworkingConfig_SDRClient_DevTicket                            :: 30;

    ESteamNetworkingConfig_SDRClient_ForceProxyAddr                       :: 31;

    ESteamNetworkingConfig_SDRClient_FakeClusterPing                      :: 36;

    ESteamNetworkingConfig_SDRClient_LimitPingProbesToNearestN            :: 60;

    ESteamNetworkingConfig_LogLevel_AckRTT                                :: 13;
    ESteamNetworkingConfig_LogLevel_PacketDecode                          :: 14;
    ESteamNetworkingConfig_LogLevel_Message                               :: 15;
    ESteamNetworkingConfig_LogLevel_PacketGaps                            :: 16;
    ESteamNetworkingConfig_LogLevel_P2PRendezvous                         :: 17;
    ESteamNetworkingConfig_LogLevel_SDRRelayPings                         :: 18;

    ESteamNetworkingConfig_ECN                                            :: 999;

    ESteamNetworkingConfig_DELETED_EnumerateDevVars                       :: 35;

    ESteamNetworkingConfigValue__Force32Bit                               :: 2147483647;

    k_ESteamNetworkingConfig_Invalid                                        :: ESteamNetworkingConfig_Invalid;

    k_ESteamNetworkingConfig_TimeoutInitial                                 :: ESteamNetworkingConfig_TimeoutInitial;

    k_ESteamNetworkingConfig_TimeoutConnected                               :: ESteamNetworkingConfig_TimeoutConnected;

    k_ESteamNetworkingConfig_SendBufferSize                                 :: ESteamNetworkingConfig_SendBufferSize;

    k_ESteamNetworkingConfig_RecvBufferSize                                 :: ESteamNetworkingConfig_RecvBufferSize;

    k_ESteamNetworkingConfig_RecvBufferMessages                             :: ESteamNetworkingConfig_RecvBufferMessages;

    k_ESteamNetworkingConfig_RecvMaxMessageSize                             :: ESteamNetworkingConfig_RecvMaxMessageSize;

    k_ESteamNetworkingConfig_RecvMaxSegmentsPerPacket                       :: ESteamNetworkingConfig_RecvMaxSegmentsPerPacket;

    k_ESteamNetworkingConfig_ConnectionUserData                             :: ESteamNetworkingConfig_ConnectionUserData;

    k_ESteamNetworkingConfig_SendRateMin                                    :: ESteamNetworkingConfig_SendRateMin;
    k_ESteamNetworkingConfig_SendRateMax                                    :: ESteamNetworkingConfig_SendRateMax;

    k_ESteamNetworkingConfig_NagleTime                                      :: ESteamNetworkingConfig_NagleTime;

    k_ESteamNetworkingConfig_IP_AllowWithoutAuth                            :: ESteamNetworkingConfig_IP_AllowWithoutAuth;

    k_ESteamNetworkingConfig_IPLocalHost_AllowWithoutAuth                   :: ESteamNetworkingConfig_IPLocalHost_AllowWithoutAuth;

    k_ESteamNetworkingConfig_MTU_PacketSize                                 :: ESteamNetworkingConfig_MTU_PacketSize;

    k_ESteamNetworkingConfig_MTU_DataSize                                   :: ESteamNetworkingConfig_MTU_DataSize;

    k_ESteamNetworkingConfig_Unencrypted                                    :: ESteamNetworkingConfig_Unencrypted;

    k_ESteamNetworkingConfig_SymmetricConnect                               :: ESteamNetworkingConfig_SymmetricConnect;

    k_ESteamNetworkingConfig_LocalVirtualPort                               :: ESteamNetworkingConfig_LocalVirtualPort;

    k_ESteamNetworkingConfig_DualWifi_Enable                                :: ESteamNetworkingConfig_DualWifi_Enable;

    k_ESteamNetworkingConfig_EnableDiagnosticsUI                            :: ESteamNetworkingConfig_EnableDiagnosticsUI;

    k_ESteamNetworkingConfig_FakePacketLoss_Send                            :: ESteamNetworkingConfig_FakePacketLoss_Send;
    k_ESteamNetworkingConfig_FakePacketLoss_Recv                            :: ESteamNetworkingConfig_FakePacketLoss_Recv;

    k_ESteamNetworkingConfig_FakePacketLag_Send                             :: ESteamNetworkingConfig_FakePacketLag_Send;
    k_ESteamNetworkingConfig_FakePacketLag_Recv                             :: ESteamNetworkingConfig_FakePacketLag_Recv;

    k_ESteamNetworkingConfig_FakePacketReorder_Send                         :: ESteamNetworkingConfig_FakePacketReorder_Send;
    k_ESteamNetworkingConfig_FakePacketReorder_Recv                         :: ESteamNetworkingConfig_FakePacketReorder_Recv;

    k_ESteamNetworkingConfig_FakePacketReorder_Time                         :: ESteamNetworkingConfig_FakePacketReorder_Time;

    k_ESteamNetworkingConfig_FakePacketDup_Send                             :: ESteamNetworkingConfig_FakePacketDup_Send;
    k_ESteamNetworkingConfig_FakePacketDup_Recv                             :: ESteamNetworkingConfig_FakePacketDup_Recv;

    k_ESteamNetworkingConfig_FakePacketDup_TimeMax                          :: ESteamNetworkingConfig_FakePacketDup_TimeMax;

    k_ESteamNetworkingConfig_PacketTraceMaxBytes                            :: ESteamNetworkingConfig_PacketTraceMaxBytes;

    k_ESteamNetworkingConfig_FakeRateLimit_Send_Rate                        :: ESteamNetworkingConfig_FakeRateLimit_Send_Rate;
    k_ESteamNetworkingConfig_FakeRateLimit_Send_Burst                       :: ESteamNetworkingConfig_FakeRateLimit_Send_Burst;
    k_ESteamNetworkingConfig_FakeRateLimit_Recv_Rate                        :: ESteamNetworkingConfig_FakeRateLimit_Recv_Rate;
    k_ESteamNetworkingConfig_FakeRateLimit_Recv_Burst                       :: ESteamNetworkingConfig_FakeRateLimit_Recv_Burst;

    k_ESteamNetworkingConfig_OutOfOrderCorrectionWindowMicroseconds         :: ESteamNetworkingConfig_OutOfOrderCorrectionWindowMicroseconds;

    k_ESteamNetworkingConfig_Callback_ConnectionStatusChanged               :: ESteamNetworkingConfig_Callback_ConnectionStatusChanged;

    k_ESteamNetworkingConfig_Callback_AuthStatusChanged                     :: ESteamNetworkingConfig_Callback_AuthStatusChanged;

    k_ESteamNetworkingConfig_Callback_RelayNetworkStatusChanged             :: ESteamNetworkingConfig_Callback_RelayNetworkStatusChanged;

    k_ESteamNetworkingConfig_Callback_MessagesSessionRequest                :: ESteamNetworkingConfig_Callback_MessagesSessionRequest;

    k_ESteamNetworkingConfig_Callback_MessagesSessionFailed                 :: ESteamNetworkingConfig_Callback_MessagesSessionFailed;

    k_ESteamNetworkingConfig_Callback_CreateConnectionSignaling             :: ESteamNetworkingConfig_Callback_CreateConnectionSignaling;

    k_ESteamNetworkingConfig_Callback_FakeIPResult                          :: ESteamNetworkingConfig_Callback_FakeIPResult;

    k_ESteamNetworkingConfig_P2P_STUN_ServerList                            :: ESteamNetworkingConfig_P2P_STUN_ServerList;

    k_ESteamNetworkingConfig_P2P_Transport_ICE_Enable                       :: ESteamNetworkingConfig_P2P_Transport_ICE_Enable;

    k_ESteamNetworkingConfig_P2P_Transport_ICE_Penalty                      :: ESteamNetworkingConfig_P2P_Transport_ICE_Penalty;
    k_ESteamNetworkingConfig_P2P_Transport_SDR_Penalty                      :: ESteamNetworkingConfig_P2P_Transport_SDR_Penalty;
    k_ESteamNetworkingConfig_P2P_TURN_ServerList                            :: ESteamNetworkingConfig_P2P_TURN_ServerList;
    k_ESteamNetworkingConfig_P2P_TURN_UserList                              :: ESteamNetworkingConfig_P2P_TURN_UserList;
    k_ESteamNetworkingConfig_P2P_TURN_PassList                              :: ESteamNetworkingConfig_P2P_TURN_PassList;

    k_ESteamNetworkingConfig_P2P_Transport_ICE_Implementation               :: ESteamNetworkingConfig_P2P_Transport_ICE_Implementation;

    k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFailInitial :: ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFailInitial;

    k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFail        :: ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFail;

    k_ESteamNetworkingConfig_SDRClient_MinPingsBeforePingAccurate           :: ESteamNetworkingConfig_SDRClient_MinPingsBeforePingAccurate;

    k_ESteamNetworkingConfig_SDRClient_SingleSocket                         :: ESteamNetworkingConfig_SDRClient_SingleSocket;

    k_ESteamNetworkingConfig_SDRClient_ForceRelayCluster                    :: ESteamNetworkingConfig_SDRClient_ForceRelayCluster;

    k_ESteamNetworkingConfig_SDRClient_DevTicket                            :: ESteamNetworkingConfig_SDRClient_DevTicket;

    k_ESteamNetworkingConfig_SDRClient_ForceProxyAddr                       :: ESteamNetworkingConfig_SDRClient_ForceProxyAddr;

    k_ESteamNetworkingConfig_SDRClient_FakeClusterPing                      :: ESteamNetworkingConfig_SDRClient_FakeClusterPing;

    k_ESteamNetworkingConfig_SDRClient_LimitPingProbesToNearestN            :: ESteamNetworkingConfig_SDRClient_LimitPingProbesToNearestN;

    k_ESteamNetworkingConfig_LogLevel_AckRTT                                :: ESteamNetworkingConfig_LogLevel_AckRTT;
    k_ESteamNetworkingConfig_LogLevel_PacketDecode                          :: ESteamNetworkingConfig_LogLevel_PacketDecode;
    k_ESteamNetworkingConfig_LogLevel_Message                               :: ESteamNetworkingConfig_LogLevel_Message;
    k_ESteamNetworkingConfig_LogLevel_PacketGaps                            :: ESteamNetworkingConfig_LogLevel_PacketGaps;
    k_ESteamNetworkingConfig_LogLevel_P2PRendezvous                         :: ESteamNetworkingConfig_LogLevel_P2PRendezvous;
    k_ESteamNetworkingConfig_LogLevel_SDRRelayPings                         :: ESteamNetworkingConfig_LogLevel_SDRRelayPings;

    k_ESteamNetworkingConfig_ECN                                            :: ESteamNetworkingConfig_ECN;

    k_ESteamNetworkingConfig_DELETED_EnumerateDevVars                       :: ESteamNetworkingConfig_DELETED_EnumerateDevVars;

    k_ESteamNetworkingConfigValue__Force32Bit                               :: ESteamNetworkingConfigValue__Force32Bit;
}

k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Default: s32 : -1; // Special value - use user defaults
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Disable: s32 : 0; // Do not do any ICE work at all or share any IP addresses with peer
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Relay: s32 : 1; // Relayed connection via TURN server.
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Private: s32 : 2; // host addresses that appear to be link-local or RFC1918 addresses
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Public: s32 : 4; // STUN reflexive addresses, or host address that isn't a "private" address
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_All: s32 : 2147483647;

/// In a few places we need to set configuration options on listen sockets and connections, and
/// have them take effect *before* the listen socket or connection really starts doing anything.
/// Creating the object and then setting the options "immediately" after creation doesn't work
/// completely, because network packets could be received between the time the object is created and
/// when the options are applied.  To set options at creation time in a reliable way, they must be
/// passed to the creation function.  This structure is used to pass those options.
///
/// For the meaning of these fields, see ISteamNetworkingUtils::SetConfigValue.  Basically
/// when the object is created, we just iterate over the list of options and call
/// ISteamNetworkingUtils::SetConfigValueStruct, where the scope arguments are supplied by the
/// object being created.
SteamNetworkingConfigValue_t :: struct {
    /// Which option is being set
    m_eValue:    ESteamNetworkingConfigValue;

    /// Which field below did you fill in?
    m_eDataType: ESteamNetworkingConfigDataType;

    m_val:       union {
        m_int32:  s32;
        m_int64:  s64;
        m_float:  float;
        m_string: *u8; // Points to your '\0'-terminated buffer
        m_ptr:    *void;
    };
}

/// Return value of ISteamNetworkintgUtils::GetConfigValue
ESteamNetworkingGetConfigValueResult :: enum s32 {
    ESteamNetworkingGetConfigValue_BadValue          :: -1;
    ESteamNetworkingGetConfigValue_BadScopeObj       :: -2;
    ESteamNetworkingGetConfigValue_BufferTooSmall    :: -3;
    ESteamNetworkingGetConfigValue_OK                :: 1;
    ESteamNetworkingGetConfigValue_OKInherited       :: 2;

    ESteamNetworkingGetConfigValueResult__Force32Bit :: 2147483647;

    k_ESteamNetworkingGetConfigValue_BadValue          :: ESteamNetworkingGetConfigValue_BadValue;
    k_ESteamNetworkingGetConfigValue_BadScopeObj       :: ESteamNetworkingGetConfigValue_BadScopeObj;
    k_ESteamNetworkingGetConfigValue_BufferTooSmall    :: ESteamNetworkingGetConfigValue_BufferTooSmall;
    k_ESteamNetworkingGetConfigValue_OK                :: ESteamNetworkingGetConfigValue_OK;
    k_ESteamNetworkingGetConfigValue_OKInherited       :: ESteamNetworkingGetConfigValue_OKInherited;

    k_ESteamNetworkingGetConfigValueResult__Force32Bit :: ESteamNetworkingGetConfigValueResult__Force32Bit;
}

/// Detail level for diagnostic output callback.
/// See ISteamNetworkingUtils::SetDebugOutputFunction
ESteamNetworkingSocketsDebugOutputType :: enum s32 {
    None       :: 0;
    Bug        :: 1;
    Error      :: 2;
    Important  :: 3;
    Warning    :: 4;
    Msg        :: 5;
    Verbose    :: 6;
    Debug      :: 7;
    Everything :: 8;

    Force32Bit :: 2147483647;

    k_ESteamNetworkingSocketsDebugOutputType_None        :: None;
    k_ESteamNetworkingSocketsDebugOutputType_Bug         :: Bug;
    k_ESteamNetworkingSocketsDebugOutputType_Error       :: Error;
    k_ESteamNetworkingSocketsDebugOutputType_Important   :: Important;
    k_ESteamNetworkingSocketsDebugOutputType_Warning     :: Warning;
    k_ESteamNetworkingSocketsDebugOutputType_Msg         :: Msg;
    k_ESteamNetworkingSocketsDebugOutputType_Verbose     :: Verbose;
    k_ESteamNetworkingSocketsDebugOutputType_Debug       :: Debug;
    k_ESteamNetworkingSocketsDebugOutputType_Everything  :: Everything;

    k_ESteamNetworkingSocketsDebugOutputType__Force32Bit :: Force32Bit;
}

/// Setup callback for debug output, and the desired verbosity you want.
FSteamNetworkingSocketsDebugOutput :: #type (nType: ESteamNetworkingSocketsDebugOutputType, pszMsg: *u8) -> void #c_call;

/// The POPID "dev" is used in non-production environments for testing.
k_SteamDatagramPOPID_dev: SteamNetworkingPOPID : (100 << 16) | (101 << 8) | 118;

/// Utility class for printing a SteamNetworkingPOPID.
SteamNetworkingPOPIDRender :: struct {
    buf: [8] u8;
}

// For code compatibility
ISteamNetworkingMessage :: SteamNetworkingMessage_t;
SteamDatagramErrMsg :: SteamNetworkingErrMsg;

//-----------------------------------------------------------------------------
/// The non-connection-oriented interface to send and receive messages
/// (whether they be "clients" or "servers").
///
/// ISteamNetworkingSockets is connection-oriented (like TCP), meaning you
/// need to listen and connect, and then you send messages using a connection
/// handle.  ISteamNetworkingMessages is more like UDP, in that you can just send
/// messages to arbitrary peers at any time.  The underlying connections are
/// established implicitly.
///
/// Under the hood ISteamNetworkingMessages works on top of the ISteamNetworkingSockets
/// code, so you get the same routing and messaging efficiency.  The difference is
/// mainly in your responsibility to explicitly establish a connection and
/// the type of feedback you get about the state of the connection.  Both
/// interfaces can do "P2P" communications, and both support both unreliable
/// and reliable messages, fragmentation and reassembly.
///
/// The primary purpose of this interface is to be "like UDP", so that UDP-based code
/// can be ported easily to take advantage of relayed connections.  If you find
/// yourself needing more low level information or control, or to be able to better
/// handle failure, then you probably need to use ISteamNetworkingSockets directly.
/// Also, note that if your main goal is to obtain a connection between two peers
/// without concerning yourself with assigning roles of "client" and "server",
/// you may find the symmetric connection mode of ISteamNetworkingSockets useful.
/// (See k_ESteamNetworkingConfig_SymmetricConnect.)
///
ISteamNetworkingMessages :: struct {
    vtable: *ISteamNetworkingMessages_VTable;
}
ISteamNetworkingMessages_VTable :: struct #type_info_none {
    SendMessageToUser: (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult #cpp_method;

    ReceiveMessagesOnChannel: (this: *ISteamNetworkingMessages, nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #cpp_method;

    AcceptSessionWithUser: (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool #cpp_method;

    CloseSessionWithUser: (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool #cpp_method;

    CloseChannelWithUser: (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool #cpp_method;

    GetSessionConnectionInfo: (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetConnectionRealTimeStatus_t) -> ESteamNetworkingConnectionState #cpp_method;
}

ISteamNetworkingMessages_SendMessageToUser :: inline (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult { return this.vtable.SendMessageToUser(this, identityRemote, pubData, cubData, nSendFlags, nRemoteChannel); }

ISteamNetworkingMessages_ReceiveMessagesOnChannel :: inline (this: *ISteamNetworkingMessages, nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 { return this.vtable.ReceiveMessagesOnChannel(this, nLocalChannel, ppOutMessages, nMaxMessages); }

ISteamNetworkingMessages_AcceptSessionWithUser :: inline (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool { return this.vtable.AcceptSessionWithUser(this, identityRemote); }

ISteamNetworkingMessages_CloseSessionWithUser :: inline (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool { return this.vtable.CloseSessionWithUser(this, identityRemote); }

ISteamNetworkingMessages_CloseChannelWithUser :: inline (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool { return this.vtable.CloseChannelWithUser(this, identityRemote, nLocalChannel); }

ISteamNetworkingMessages_GetSessionConnectionInfo :: inline (this: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetConnectionRealTimeStatus_t) -> ESteamNetworkingConnectionState { return this.vtable.GetSessionConnectionInfo(this, identityRemote, pConnectionInfo, pQuickStatus); }

vtable :: (obj: *ISteamNetworkingMessages) -> *ISteamNetworkingMessages_VTable { return obj.vtable; }


/// Posted when a remote host is sending us a message, and we do not already have a session with them
SteamNetworkingMessagesSessionRequest_t :: struct {
    anon_enum_242 :: enum s32 {
        k_iCallback :: 1251;
    }
    m_identityRemote: SteamNetworkingIdentity; // user who wants to talk to us
}

/// Posted when we fail to establish a connection, or we detect that communications
/// have been disrupted it an unusual way.  There is no notification when a peer proactively
/// closes the session.  ("Closed by peer" is not a concept of UDP-style communications, and
/// SteamNetworkingMessages is primarily intended to make porting UDP code easy.)
///
/// Remember: callbacks are asynchronous.   See notes on SendMessageToUser,
/// and k_nSteamNetworkingSend_AutoRestartBrokenSession in particular.
///
/// Also, if a session times out due to inactivity, no callbacks will be posted.  The only
/// way to detect that this is happening is that querying the session state may return
/// none, connecting, and findingroute again.
SteamNetworkingMessagesSessionFailed_t :: struct {
    anon_enum_243 :: enum s32 {
        k_iCallback :: 1252;
    }

    /// Detailed info about the session that failed.
    /// SteamNetConnectionInfo_t::m_identityRemote indicates who this session
    /// was with.
    m_info: SteamNetConnectionInfo_t;
}

ISteamNetworkingConnectionSignaling :: struct {}
ISteamNetworkingSignalingRecvContext :: struct {}
ISteamNetworkingFakeUDPPort :: struct {}

//-----------------------------------------------------------------------------
/// Lower level networking API.
///
/// - Connection-oriented API (like TCP, not UDP).  When sending and receiving
///   messages, a connection handle is used.  (For a UDP-style interface, where
///   the peer is identified by their address with each send/recv call, see
///   ISteamNetworkingMessages.)  The typical pattern is for a "server" to "listen"
///   on a "listen socket."  A "client" will "connect" to the server, and the
///   server will "accept" the connection.  If you have a symmetric situation
///   where either peer may initiate the connection and server/client roles are
///   not clearly defined, check out k_ESteamNetworkingConfig_SymmetricConnect.
/// - But unlike TCP, it's message-oriented, not stream-oriented.
/// - Mix of reliable and unreliable messages
/// - Fragmentation and reassembly
/// - Supports connectivity over plain UDP
/// - Also supports SDR ("Steam Datagram Relay") connections, which are
///   addressed by the identity of the peer.  There is a "P2P" use case and
///   a "hosted dedicated server" use case.
///
/// Note that neither of the terms "connection" nor "socket" necessarily correspond
/// one-to-one with an underlying UDP socket.  An attempt has been made to
/// keep the semantics as similar to the standard socket model when appropriate,
/// but some deviations do exist.
///
/// See also: ISteamNetworkingMessages, the UDP-style interface.  This API might be
/// easier to use, especially when porting existing UDP code.
ISteamNetworkingSockets :: struct {
    vtable: *ISteamNetworkingSockets_VTable;
}
ISteamNetworkingSockets_VTable :: struct #type_info_none {
    CreateListenSocketIP: (this: *ISteamNetworkingSockets, localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #cpp_method;

    ConnectByIPAddress: (this: *ISteamNetworkingSockets, address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #cpp_method;

    CreateListenSocketP2P: (this: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #cpp_method;

    ConnectP2P: (this: *ISteamNetworkingSockets, identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #cpp_method;

    AcceptConnection: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult #cpp_method;

    CloseConnection: (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nReason: s32, pszDebug: *u8, bEnableLinger: bool) -> bool #cpp_method;

    CloseListenSocket: (this: *ISteamNetworkingSockets, hSocket: HSteamListenSocket) -> bool #cpp_method;

    SetConnectionUserData: (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nUserData: int64) -> bool #cpp_method;

    GetConnectionUserData: (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection) -> int64 #cpp_method;

    SetConnectionName: (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *u8) -> void #cpp_method;

    GetConnectionName: (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *u8, nMaxLen: s32) -> bool #cpp_method;

    SendMessageToConnection: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult #cpp_method;

    SendMessages: (this: *ISteamNetworkingSockets, nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) -> void #cpp_method;

    FlushMessagesOnConnection: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult #cpp_method;

    ReceiveMessagesOnConnection: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #cpp_method;

    GetConnectionInfo: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool #cpp_method;

    GetConnectionRealTimeStatus: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pStatus: *SteamNetConnectionRealTimeStatus_t, nLanes: s32, pLanes: *SteamNetConnectionRealTimeLaneStatus_t) -> EResult #cpp_method;

    GetDetailedConnectionStatus: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pszBuf: *u8, cbBuf: s32) -> s32 #cpp_method;

    GetListenSocketAddress: (this: *ISteamNetworkingSockets, hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool #cpp_method;

    CreateSocketPair: (this: *ISteamNetworkingSockets, pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool #cpp_method;

    ConfigureConnectionLanes: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, nNumLanes: s32, pLanePriorities: *s32, pLaneWeights: *uint16) -> EResult #cpp_method;

    GetIdentity: (this: *ISteamNetworkingSockets, pIdentity: *SteamNetworkingIdentity) -> bool #cpp_method;

    InitAuthentication: (this: *ISteamNetworkingSockets) -> ESteamNetworkingAvailability #cpp_method;

    GetAuthenticationStatus: (this: *ISteamNetworkingSockets, pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability #cpp_method;

    CreatePollGroup: (this: *ISteamNetworkingSockets) -> HSteamNetPollGroup #cpp_method;

    DestroyPollGroup: (this: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool #cpp_method;

    SetConnectionPollGroup: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool #cpp_method;

    ReceiveMessagesOnPollGroup: (this: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #cpp_method;

    ReceivedRelayAuthTicket: (this: *ISteamNetworkingSockets, pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool #cpp_method;

    FindRelayAuthTicketForServer: (this: *ISteamNetworkingSockets, identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 #cpp_method;

    ConnectToHostedDedicatedServer: (this: *ISteamNetworkingSockets, identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #cpp_method;

    GetHostedDedicatedServerPort: (this: *ISteamNetworkingSockets) -> uint16 #cpp_method;

    GetHostedDedicatedServerPOPID: (this: *ISteamNetworkingSockets) -> SteamNetworkingPOPID #cpp_method;

    GetHostedDedicatedServerAddress: (this: *ISteamNetworkingSockets, pRouting: *SteamDatagramHostedAddress) -> EResult #cpp_method;

    CreateHostedDedicatedServerListenSocket: (this: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #cpp_method;

    GetGameCoordinatorServerLogin: (this: *ISteamNetworkingSockets, pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult #cpp_method;

    ConnectP2PCustomSignaling: (this: *ISteamNetworkingSockets, pSignaling: *ISteamNetworkingConnectionSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #cpp_method;

    ReceivedP2PCustomSignal: (this: *ISteamNetworkingSockets, pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingSignalingRecvContext) -> bool #cpp_method;

    GetCertificateRequest: (this: *ISteamNetworkingSockets, pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool #cpp_method;

    SetCertificate: (this: *ISteamNetworkingSockets, pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool #cpp_method;

    ResetIdentity: (this: *ISteamNetworkingSockets, pIdentity: *SteamNetworkingIdentity) -> void #cpp_method;

    RunCallbacks: (this: *ISteamNetworkingSockets) -> void #cpp_method;

    BeginAsyncRequestFakeIP: (this: *ISteamNetworkingSockets, nNumPorts: s32) -> bool #cpp_method;

    GetFakeIP: (this: *ISteamNetworkingSockets, idxFirstPort: s32, pInfo: *SteamNetworkingFakeIPResult_t) -> void #cpp_method;

    CreateListenSocketP2PFakeIP: (this: *ISteamNetworkingSockets, idxFakePort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #cpp_method;

    GetRemoteFakeIPForConnection: (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pOutAddr: *SteamNetworkingIPAddr) -> EResult #cpp_method;

    CreateFakeUDPPort: (this: *ISteamNetworkingSockets, idxFakeServerPort: s32) -> *ISteamNetworkingFakeUDPPort #cpp_method;
}

ISteamNetworkingSockets_CreateListenSocketIP :: inline (this: *ISteamNetworkingSockets, localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket { return this.vtable.CreateListenSocketIP(this, localAddress, nOptions, pOptions); }

ISteamNetworkingSockets_ConnectByIPAddress :: inline (this: *ISteamNetworkingSockets, address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection { return this.vtable.ConnectByIPAddress(this, address, nOptions, pOptions); }

ISteamNetworkingSockets_CreateListenSocketP2P :: inline (this: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket { return this.vtable.CreateListenSocketP2P(this, nLocalVirtualPort, nOptions, pOptions); }

ISteamNetworkingSockets_ConnectP2P :: inline (this: *ISteamNetworkingSockets, identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection { return this.vtable.ConnectP2P(this, identityRemote, nRemoteVirtualPort, nOptions, pOptions); }

ISteamNetworkingSockets_AcceptConnection :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult { return this.vtable.AcceptConnection(this, hConn); }

ISteamNetworkingSockets_CloseConnection :: inline (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nReason: s32, pszDebug: *u8, bEnableLinger: bool) -> bool { return this.vtable.CloseConnection(this, hPeer, nReason, pszDebug, bEnableLinger); }

ISteamNetworkingSockets_CloseListenSocket :: inline (this: *ISteamNetworkingSockets, hSocket: HSteamListenSocket) -> bool { return this.vtable.CloseListenSocket(this, hSocket); }

ISteamNetworkingSockets_SetConnectionUserData :: inline (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nUserData: int64) -> bool { return this.vtable.SetConnectionUserData(this, hPeer, nUserData); }

ISteamNetworkingSockets_GetConnectionUserData :: inline (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection) -> int64 { return this.vtable.GetConnectionUserData(this, hPeer); }

ISteamNetworkingSockets_SetConnectionName :: inline (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *u8) { this.vtable.SetConnectionName(this, hPeer, pszName); }

ISteamNetworkingSockets_GetConnectionName :: inline (this: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *u8, nMaxLen: s32) -> bool { return this.vtable.GetConnectionName(this, hPeer, pszName, nMaxLen); }

ISteamNetworkingSockets_SendMessageToConnection :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult { return this.vtable.SendMessageToConnection(this, hConn, pData, cbData, nSendFlags, pOutMessageNumber); }

ISteamNetworkingSockets_SendMessages :: inline (this: *ISteamNetworkingSockets, nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) { this.vtable.SendMessages(this, nMessages, pMessages, pOutMessageNumberOrResult); }

ISteamNetworkingSockets_FlushMessagesOnConnection :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult { return this.vtable.FlushMessagesOnConnection(this, hConn); }

ISteamNetworkingSockets_ReceiveMessagesOnConnection :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 { return this.vtable.ReceiveMessagesOnConnection(this, hConn, ppOutMessages, nMaxMessages); }

ISteamNetworkingSockets_GetConnectionInfo :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool { return this.vtable.GetConnectionInfo(this, hConn, pInfo); }

ISteamNetworkingSockets_GetConnectionRealTimeStatus :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pStatus: *SteamNetConnectionRealTimeStatus_t, nLanes: s32, pLanes: *SteamNetConnectionRealTimeLaneStatus_t) -> EResult { return this.vtable.GetConnectionRealTimeStatus(this, hConn, pStatus, nLanes, pLanes); }

ISteamNetworkingSockets_GetDetailedConnectionStatus :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pszBuf: *u8, cbBuf: s32) -> s32 { return this.vtable.GetDetailedConnectionStatus(this, hConn, pszBuf, cbBuf); }

ISteamNetworkingSockets_GetListenSocketAddress :: inline (this: *ISteamNetworkingSockets, hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool { return this.vtable.GetListenSocketAddress(this, hSocket, address); }

ISteamNetworkingSockets_CreateSocketPair :: inline (this: *ISteamNetworkingSockets, pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool { return this.vtable.CreateSocketPair(this, pOutConnection1, pOutConnection2, bUseNetworkLoopback, pIdentity1, pIdentity2); }

ISteamNetworkingSockets_ConfigureConnectionLanes :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, nNumLanes: s32, pLanePriorities: *s32, pLaneWeights: *uint16) -> EResult { return this.vtable.ConfigureConnectionLanes(this, hConn, nNumLanes, pLanePriorities, pLaneWeights); }

ISteamNetworkingSockets_GetIdentity :: inline (this: *ISteamNetworkingSockets, pIdentity: *SteamNetworkingIdentity) -> bool { return this.vtable.GetIdentity(this, pIdentity); }

ISteamNetworkingSockets_InitAuthentication :: inline (this: *ISteamNetworkingSockets) -> ESteamNetworkingAvailability { return this.vtable.InitAuthentication(this); }

ISteamNetworkingSockets_GetAuthenticationStatus :: inline (this: *ISteamNetworkingSockets, pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability { return this.vtable.GetAuthenticationStatus(this, pDetails); }

ISteamNetworkingSockets_CreatePollGroup :: inline (this: *ISteamNetworkingSockets) -> HSteamNetPollGroup { return this.vtable.CreatePollGroup(this); }

ISteamNetworkingSockets_DestroyPollGroup :: inline (this: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool { return this.vtable.DestroyPollGroup(this, hPollGroup); }

ISteamNetworkingSockets_SetConnectionPollGroup :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool { return this.vtable.SetConnectionPollGroup(this, hConn, hPollGroup); }

ISteamNetworkingSockets_ReceiveMessagesOnPollGroup :: inline (this: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 { return this.vtable.ReceiveMessagesOnPollGroup(this, hPollGroup, ppOutMessages, nMaxMessages); }

ISteamNetworkingSockets_ReceivedRelayAuthTicket :: inline (this: *ISteamNetworkingSockets, pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool { return this.vtable.ReceivedRelayAuthTicket(this, pvTicket, cbTicket, pOutParsedTicket); }

ISteamNetworkingSockets_FindRelayAuthTicketForServer :: inline (this: *ISteamNetworkingSockets, identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 { return this.vtable.FindRelayAuthTicketForServer(this, identityGameServer, nRemoteVirtualPort, pOutParsedTicket); }

ISteamNetworkingSockets_ConnectToHostedDedicatedServer :: inline (this: *ISteamNetworkingSockets, identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection { return this.vtable.ConnectToHostedDedicatedServer(this, identityTarget, nRemoteVirtualPort, nOptions, pOptions); }

ISteamNetworkingSockets_GetHostedDedicatedServerPort :: inline (this: *ISteamNetworkingSockets) -> uint16 { return this.vtable.GetHostedDedicatedServerPort(this); }

ISteamNetworkingSockets_GetHostedDedicatedServerPOPID :: inline (this: *ISteamNetworkingSockets) -> SteamNetworkingPOPID { return this.vtable.GetHostedDedicatedServerPOPID(this); }

ISteamNetworkingSockets_GetHostedDedicatedServerAddress :: inline (this: *ISteamNetworkingSockets, pRouting: *SteamDatagramHostedAddress) -> EResult { return this.vtable.GetHostedDedicatedServerAddress(this, pRouting); }

ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket :: inline (this: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket { return this.vtable.CreateHostedDedicatedServerListenSocket(this, nLocalVirtualPort, nOptions, pOptions); }

ISteamNetworkingSockets_GetGameCoordinatorServerLogin :: inline (this: *ISteamNetworkingSockets, pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult { return this.vtable.GetGameCoordinatorServerLogin(this, pLoginInfo, pcbSignedBlob, pBlob); }

ISteamNetworkingSockets_ConnectP2PCustomSignaling :: inline (this: *ISteamNetworkingSockets, pSignaling: *ISteamNetworkingConnectionSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection { return this.vtable.ConnectP2PCustomSignaling(this, pSignaling, pPeerIdentity, nRemoteVirtualPort, nOptions, pOptions); }

ISteamNetworkingSockets_ReceivedP2PCustomSignal :: inline (this: *ISteamNetworkingSockets, pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingSignalingRecvContext) -> bool { return this.vtable.ReceivedP2PCustomSignal(this, pMsg, cbMsg, pContext); }

ISteamNetworkingSockets_GetCertificateRequest :: inline (this: *ISteamNetworkingSockets, pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool { return this.vtable.GetCertificateRequest(this, pcbBlob, pBlob, errMsg); }

ISteamNetworkingSockets_SetCertificate :: inline (this: *ISteamNetworkingSockets, pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool { return this.vtable.SetCertificate(this, pCertificate, cbCertificate, errMsg); }

ISteamNetworkingSockets_ResetIdentity :: inline (this: *ISteamNetworkingSockets, pIdentity: *SteamNetworkingIdentity) { this.vtable.ResetIdentity(this, pIdentity); }

ISteamNetworkingSockets_RunCallbacks :: inline (this: *ISteamNetworkingSockets) { this.vtable.RunCallbacks(this); }

ISteamNetworkingSockets_BeginAsyncRequestFakeIP :: inline (this: *ISteamNetworkingSockets, nNumPorts: s32) -> bool { return this.vtable.BeginAsyncRequestFakeIP(this, nNumPorts); }

ISteamNetworkingSockets_GetFakeIP :: inline (this: *ISteamNetworkingSockets, idxFirstPort: s32, pInfo: *SteamNetworkingFakeIPResult_t) { this.vtable.GetFakeIP(this, idxFirstPort, pInfo); }

ISteamNetworkingSockets_CreateListenSocketP2PFakeIP :: inline (this: *ISteamNetworkingSockets, idxFakePort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket { return this.vtable.CreateListenSocketP2PFakeIP(this, idxFakePort, nOptions, pOptions); }

ISteamNetworkingSockets_GetRemoteFakeIPForConnection :: inline (this: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pOutAddr: *SteamNetworkingIPAddr) -> EResult { return this.vtable.GetRemoteFakeIPForConnection(this, hConn, pOutAddr); }

ISteamNetworkingSockets_CreateFakeUDPPort :: inline (this: *ISteamNetworkingSockets, idxFakeServerPort: s32) -> *ISteamNetworkingFakeUDPPort { return this.vtable.CreateFakeUDPPort(this, idxFakeServerPort); }

vtable :: (obj: *ISteamNetworkingSockets) -> *ISteamNetworkingSockets_VTable { return obj.vtable; }


/// This callback is posted whenever a connection is created, destroyed, or changes state.
/// The m_info field will contain a complete description of the connection at the time the
/// change occurred and the callback was posted.  In particular, m_eState will have the
/// new connection state.
///
/// You will usually need to listen for this callback to know when:
/// - A new connection arrives on a listen socket.
///   m_info.m_hListenSocket will be set, m_eOldState = k_ESteamNetworkingConnectionState_None,
///   and m_info.m_eState = k_ESteamNetworkingConnectionState_Connecting.
///   See ISteamNetworkigSockets::AcceptConnection.
/// - A connection you initiated has been accepted by the remote host.
///   m_eOldState = k_ESteamNetworkingConnectionState_Connecting, and
///   m_info.m_eState = k_ESteamNetworkingConnectionState_Connected.
///   Some connections might transition to k_ESteamNetworkingConnectionState_FindingRoute first.
/// - A connection has been actively rejected or closed by the remote host.
///   m_eOldState = k_ESteamNetworkingConnectionState_Connecting or k_ESteamNetworkingConnectionState_Connected,
///   and m_info.m_eState = k_ESteamNetworkingConnectionState_ClosedByPeer.  m_info.m_eEndReason
///   and m_info.m_szEndDebug will have for more details.
///   NOTE: upon receiving this callback, you must still destroy the connection using
///   ISteamNetworkingSockets::CloseConnection to free up local resources.  (The details
///   passed to the function are not used in this case, since the connection is already closed.)
/// - A problem was detected with the connection, and it has been closed by the local host.
///   The most common failure is timeout, but other configuration or authentication failures
///   can cause this.  m_eOldState = k_ESteamNetworkingConnectionState_Connecting or
///   k_ESteamNetworkingConnectionState_Connected, and m_info.m_eState = k_ESteamNetworkingConnectionState_ProblemDetectedLocally.
///   m_info.m_eEndReason and m_info.m_szEndDebug will have for more details.
///   NOTE: upon receiving this callback, you must still destroy the connection using
///   ISteamNetworkingSockets::CloseConnection to free up local resources.  (The details
///   passed to the function are not used in this case, since the connection is already closed.)
///
/// Remember that callbacks are posted to a queue, and networking connections can
/// change at any time.  It is possible that the connection has already changed
/// state by the time you process this callback.
///
/// Also note that callbacks will be posted when connections are created and destroyed by your own API calls.
SteamNetConnectionStatusChangedCallback_t :: struct {
    anon_enum_244 :: enum s32 {
        k_iCallback :: 1221;
    }

    /// Connection handle
    m_hConn:     HSteamNetConnection;

    /// Full connection info
    m_info:      SteamNetConnectionInfo_t;

    /// Previous state.  (Current state is in m_info.m_eState)
    m_eOldState: ESteamNetworkingConnectionState;
}

/// A struct used to describe our readiness to participate in authenticated,
/// encrypted communication.  In order to do this we need:
///
/// - The list of trusted CA certificates that might be relevant for this
///   app.
/// - A valid certificate issued by a CA.
///
/// This callback is posted whenever the state of our readiness changes.
SteamNetAuthenticationStatus_t :: struct {
    anon_enum_245 :: enum s32 {
        k_iCallback :: 1222;
    }

    /// Status
    m_eAvail:   ESteamNetworkingAvailability;

    /// Non-localized English language status.  For diagnostic/debugging
    /// purposes only.
    m_debugMsg: [256] u8;
}

//-----------------------------------------------------------------------------
/// Misc networking utilities for checking the local networking environment
/// and estimating pings.
ISteamNetworkingUtils :: struct {
    vtable: *ISteamNetworkingUtils_VTable;
}
ISteamNetworkingUtils_VTable :: struct #type_info_none {
    AllocateMessage: (this: *ISteamNetworkingUtils, cbAllocateBuffer: s32) -> *SteamNetworkingMessage_t #cpp_method;

    GetRelayNetworkStatus: (this: *ISteamNetworkingUtils, pDetails: *SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability #cpp_method;

    GetLocalPingLocation: (this: *ISteamNetworkingUtils, result: *SteamNetworkPingLocation_t) -> float #cpp_method;

    EstimatePingTimeBetweenTwoLocations: (this: *ISteamNetworkingUtils, location1: *SteamNetworkPingLocation_t, location2: *SteamNetworkPingLocation_t) -> s32 #cpp_method;

    EstimatePingTimeFromLocalHost: (this: *ISteamNetworkingUtils, remoteLocation: *SteamNetworkPingLocation_t) -> s32 #cpp_method;

    ConvertPingLocationToString: (this: *ISteamNetworkingUtils, location: *SteamNetworkPingLocation_t, pszBuf: *u8, cchBufSize: s32) -> void #cpp_method;

    ParsePingLocationString: (this: *ISteamNetworkingUtils, pszString: *u8, result: *SteamNetworkPingLocation_t) -> bool #cpp_method;

    CheckPingDataUpToDate: (this: *ISteamNetworkingUtils, flMaxAgeSeconds: float) -> bool #cpp_method;

    GetPingToDataCenter: (this: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID, pViaRelayPoP: *SteamNetworkingPOPID) -> s32 #cpp_method;

    GetDirectPingToPOP: (this: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID) -> s32 #cpp_method;

    GetPOPCount: (this: *ISteamNetworkingUtils) -> s32 #cpp_method;

    GetPOPList: (this: *ISteamNetworkingUtils, list: *SteamNetworkingPOPID, nListSz: s32) -> s32 #cpp_method;

    GetLocalTimestamp: (this: *ISteamNetworkingUtils) -> SteamNetworkingMicroseconds #cpp_method;

    SetDebugOutputFunction: (this: *ISteamNetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) -> void #cpp_method;

    GetIPv4FakeIPType: (this: *ISteamNetworkingUtils, nIPv4: uint32) -> ESteamNetworkingFakeIPType #cpp_method;

    GetRealIdentityForFakeIP: (this: *ISteamNetworkingUtils, fakeIP: *SteamNetworkingIPAddr, pOutRealIdentity: *SteamNetworkingIdentity) -> EResult #cpp_method;

    SetConfigValue: (this: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64, eDataType: ESteamNetworkingConfigDataType, pArg: *void) -> bool #cpp_method;

    GetConfigValue: (this: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64, pOutDataType: *ESteamNetworkingConfigDataType, pResult: *void, cbResult: *u64) -> ESteamNetworkingGetConfigValueResult #cpp_method;

    GetConfigValueInfo: (this: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, pOutDataType: *ESteamNetworkingConfigDataType, pOutScope: *ESteamNetworkingConfigScope) -> *u8 #cpp_method;

    IterateGenericEditableConfigValues: (this: *ISteamNetworkingUtils, eCurrent: ESteamNetworkingConfigValue, bEnumerateDevVars: bool) -> ESteamNetworkingConfigValue #cpp_method;

    SteamNetworkingIPAddr_ToString: (this: *ISteamNetworkingUtils, addr: *SteamNetworkingIPAddr, buf: *u8, cbBuf: u64, bWithPort: bool) -> void #cpp_method;
    SteamNetworkingIPAddr_ParseString: (this: *ISteamNetworkingUtils, pAddr: *SteamNetworkingIPAddr, pszStr: *u8) -> bool #cpp_method;
    SteamNetworkingIPAddr_GetFakeIPType: (this: *ISteamNetworkingUtils, addr: *SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType #cpp_method;
    SteamNetworkingIdentity_ToString: (this: *ISteamNetworkingUtils, identity: *SteamNetworkingIdentity, buf: *u8, cbBuf: u64) -> void #cpp_method;
    SteamNetworkingIdentity_ParseString: (this: *ISteamNetworkingUtils, pIdentity: *SteamNetworkingIdentity, pszStr: *u8) -> bool #cpp_method;
}

ISteamNetworkingUtils_AllocateMessage :: inline (this: *ISteamNetworkingUtils, cbAllocateBuffer: s32) -> *SteamNetworkingMessage_t { return this.vtable.AllocateMessage(this, cbAllocateBuffer); }

ISteamNetworkingUtils_GetRelayNetworkStatus :: inline (this: *ISteamNetworkingUtils, pDetails: *SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability { return this.vtable.GetRelayNetworkStatus(this, pDetails); }

ISteamNetworkingUtils_GetLocalPingLocation :: inline (this: *ISteamNetworkingUtils, result: *SteamNetworkPingLocation_t) -> float { return this.vtable.GetLocalPingLocation(this, result); }

ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations :: inline (this: *ISteamNetworkingUtils, location1: *SteamNetworkPingLocation_t, location2: *SteamNetworkPingLocation_t) -> s32 { return this.vtable.EstimatePingTimeBetweenTwoLocations(this, location1, location2); }

ISteamNetworkingUtils_EstimatePingTimeFromLocalHost :: inline (this: *ISteamNetworkingUtils, remoteLocation: *SteamNetworkPingLocation_t) -> s32 { return this.vtable.EstimatePingTimeFromLocalHost(this, remoteLocation); }

ISteamNetworkingUtils_ConvertPingLocationToString :: inline (this: *ISteamNetworkingUtils, location: *SteamNetworkPingLocation_t, pszBuf: *u8, cchBufSize: s32) { this.vtable.ConvertPingLocationToString(this, location, pszBuf, cchBufSize); }

ISteamNetworkingUtils_ParsePingLocationString :: inline (this: *ISteamNetworkingUtils, pszString: *u8, result: *SteamNetworkPingLocation_t) -> bool { return this.vtable.ParsePingLocationString(this, pszString, result); }

ISteamNetworkingUtils_CheckPingDataUpToDate :: inline (this: *ISteamNetworkingUtils, flMaxAgeSeconds: float) -> bool { return this.vtable.CheckPingDataUpToDate(this, flMaxAgeSeconds); }

ISteamNetworkingUtils_GetPingToDataCenter :: inline (this: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID, pViaRelayPoP: *SteamNetworkingPOPID) -> s32 { return this.vtable.GetPingToDataCenter(this, popID, pViaRelayPoP); }

ISteamNetworkingUtils_GetDirectPingToPOP :: inline (this: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID) -> s32 { return this.vtable.GetDirectPingToPOP(this, popID); }

ISteamNetworkingUtils_GetPOPCount :: inline (this: *ISteamNetworkingUtils) -> s32 { return this.vtable.GetPOPCount(this); }

ISteamNetworkingUtils_GetPOPList :: inline (this: *ISteamNetworkingUtils, list: *SteamNetworkingPOPID, nListSz: s32) -> s32 { return this.vtable.GetPOPList(this, list, nListSz); }

ISteamNetworkingUtils_GetLocalTimestamp :: inline (this: *ISteamNetworkingUtils) -> SteamNetworkingMicroseconds { return this.vtable.GetLocalTimestamp(this); }

ISteamNetworkingUtils_SetDebugOutputFunction :: inline (this: *ISteamNetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) { this.vtable.SetDebugOutputFunction(this, eDetailLevel, pfnFunc); }

ISteamNetworkingUtils_GetIPv4FakeIPType :: inline (this: *ISteamNetworkingUtils, nIPv4: uint32) -> ESteamNetworkingFakeIPType { return this.vtable.GetIPv4FakeIPType(this, nIPv4); }

ISteamNetworkingUtils_GetRealIdentityForFakeIP :: inline (this: *ISteamNetworkingUtils, fakeIP: *SteamNetworkingIPAddr, pOutRealIdentity: *SteamNetworkingIdentity) -> EResult { return this.vtable.GetRealIdentityForFakeIP(this, fakeIP, pOutRealIdentity); }

ISteamNetworkingUtils_SetConfigValue :: inline (this: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64, eDataType: ESteamNetworkingConfigDataType, pArg: *void) -> bool { return this.vtable.SetConfigValue(this, eValue, eScopeType, scopeObj, eDataType, pArg); }

ISteamNetworkingUtils_GetConfigValue :: inline (this: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64, pOutDataType: *ESteamNetworkingConfigDataType, pResult: *void, cbResult: *u64) -> ESteamNetworkingGetConfigValueResult { return this.vtable.GetConfigValue(this, eValue, eScopeType, scopeObj, pOutDataType, pResult, cbResult); }

ISteamNetworkingUtils_GetConfigValueInfo :: inline (this: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, pOutDataType: *ESteamNetworkingConfigDataType, pOutScope: *ESteamNetworkingConfigScope) -> *u8 { return this.vtable.GetConfigValueInfo(this, eValue, pOutDataType, pOutScope); }

ISteamNetworkingUtils_IterateGenericEditableConfigValues :: inline (this: *ISteamNetworkingUtils, eCurrent: ESteamNetworkingConfigValue, bEnumerateDevVars: bool) -> ESteamNetworkingConfigValue { return this.vtable.IterateGenericEditableConfigValues(this, eCurrent, bEnumerateDevVars); }

ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString :: inline (this: *ISteamNetworkingUtils, addr: *SteamNetworkingIPAddr, buf: *u8, cbBuf: u64, bWithPort: bool) { this.vtable.SteamNetworkingIPAddr_ToString(this, addr, buf, cbBuf, bWithPort); }
ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString :: inline (this: *ISteamNetworkingUtils, pAddr: *SteamNetworkingIPAddr, pszStr: *u8) -> bool { return this.vtable.SteamNetworkingIPAddr_ParseString(this, pAddr, pszStr); }
ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType :: inline (this: *ISteamNetworkingUtils, addr: *SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType { return this.vtable.SteamNetworkingIPAddr_GetFakeIPType(this, addr); }
ISteamNetworkingUtils_SteamNetworkingIdentity_ToString :: inline (this: *ISteamNetworkingUtils, identity: *SteamNetworkingIdentity, buf: *u8, cbBuf: u64) { this.vtable.SteamNetworkingIdentity_ToString(this, identity, buf, cbBuf); }
ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString :: inline (this: *ISteamNetworkingUtils, pIdentity: *SteamNetworkingIdentity, pszStr: *u8) -> bool { return this.vtable.SteamNetworkingIdentity_ParseString(this, pIdentity, pszStr); }

vtable :: (obj: *ISteamNetworkingUtils) -> *ISteamNetworkingUtils_VTable { return obj.vtable; }


/// A struct used to describe our readiness to use the relay network.
/// To do this we first need to fetch the network configuration,
/// which describes what POPs are available.
SteamRelayNetworkStatus_t :: struct {
    anon_enum_246 :: enum s32 {
        k_iCallback :: 1281;
    }

    /// Summary status.  When this is "current", initialization has
    /// completed.  Anything else means you are not ready yet, or
    /// there is a significant problem.
    m_eAvail:                     ESteamNetworkingAvailability;

    /// Nonzero if latency measurement is in progress (or pending,
    /// awaiting a prerequisite).
    m_bPingMeasurementInProgress: s32;

    /// Status obtaining the network config.  This is a prerequisite
    /// for relay network access.
    ///
    /// Failure to obtain the network config almost always indicates
    /// a problem with the local internet connection.
    m_eAvailNetworkConfig:        ESteamNetworkingAvailability;

    /// Current ability to communicate with ANY relay.  Note that
    /// the complete failure to communicate with any relays almost
    /// always indicates a problem with the local Internet connection.
    /// (However, just because you can reach a single relay doesn't
    /// mean that the local connection is in perfect health.)
    m_eAvailAnyRelay:             ESteamNetworkingAvailability;

    /// Non-localized English language status.  For diagnostic/debugging
    /// purposes only.
    m_debugMsg:                   [256] u8;
}

/// Utility class for printing a SteamNetworkingIdentity.
/// E.g. printf( "Identity is '%s'\n", SteamNetworkingIdentityRender( identity ).c_str() );
SteamNetworkingIdentityRender :: struct {
    buf: [128] u8;
}

/// Utility class for printing a SteamNetworkingIPAddrRender.
SteamNetworkingIPAddrRender :: struct {
    buf: [48] u8;
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------//
//	Steam API setup & shutdown
//
//	These functions manage loading, initializing and shutdown of the steamclient.dll
//
//----------------------------------------------------------------------------------------------------------------------------------------------------------//
ESteamAPIInitResult :: enum s32 {
    OK              :: 0;
    FailedGeneric   :: 1;
    NoSteamClient   :: 2;
    VersionMismatch :: 3;

    k_ESteamAPIInitResult_OK              :: OK;
    k_ESteamAPIInitResult_FailedGeneric   :: FailedGeneric;
    k_ESteamAPIInitResult_NoSteamClient   :: NoSteamClient;
    k_ESteamAPIInitResult_VersionMismatch :: VersionMismatch;
}

// See "Initializing the Steamworks SDK" above for how to choose an init method.
// Same usage as SteamAPI_InitEx(), however does not verify ISteam* interfaces are
// supported by the user's client and is exported from the dll
SteamAPI_InitFlat :: (pOutErrMsg: *SteamErrMsg) -> ESteamAPIInitResult #foreign steam_api64;

// SteamAPI_Shutdown should be called during process shutdown if possible.
SteamAPI_Shutdown :: () -> void #foreign steam_api64;

// SteamAPI_RestartAppIfNecessary ensures that your executable was launched through Steam.
//
// Returns true if the current process should terminate. Steam is now re-launching your application.
//
// Returns false if no action needs to be taken. This means that your executable was started through
// the Steam client, or a steam_appid.txt file is present in your game's directory (for development).
// Your current process should continue if false is returned.
//
// NOTE: If you use the Steam DRM wrapper on your primary executable file, this check is unnecessary
// since the DRM wrapper will ensure that your application was launched properly through Steam.
SteamAPI_RestartAppIfNecessary :: (unOwnAppID: uint32) -> bool #foreign steam_api64;

// Many Steam API functions allocate a small amount of thread-local memory for parameter storage.
// SteamAPI_ReleaseCurrentThreadMemory() will free API memory associated with the calling thread.
// This function is also called automatically by SteamAPI_RunCallbacks(), so a single-threaded
// program never needs to explicitly call this function.
SteamAPI_ReleaseCurrentThreadMemory :: () -> void #foreign steam_api64;

// crash dump recording functions
SteamAPI_WriteMiniDump :: (uStructuredExceptionCode: uint32, pvExceptionInfo: *void, uBuildID: uint32) -> void #foreign steam_api64;
SteamAPI_SetMiniDumpComment :: (pchMsg: *u8) -> void #foreign steam_api64;

// SteamAPI_IsSteamRunning() returns true if Steam is currently running
SteamAPI_IsSteamRunning :: () -> bool #foreign steam_api64;

// returns the filename path of the current running Steam process, used if you need to load an explicit steam dll by name.
// DEPRECATED - implementation is Windows only, and the path returned is a UTF-8 string which must be converted to UTF-16 for use with Win32 APIs
SteamAPI_GetSteamInstallPath :: () -> *u8 #foreign steam_api64;

// sets whether or not Steam_RunCallbacks() should do a try {} catch (...) {} around calls to issuing callbacks
// This is ignored if you are using the manual callback dispatch method
SteamAPI_SetTryCatchCallbacks :: (bTryCatchCallbacks: bool) -> void #foreign steam_api64;

/// Inform the API that you wish to use manual event dispatch.  This must be called after SteamAPI_Init, but before
/// you use any of the other manual dispatch functions below.
SteamAPI_ManualDispatch_Init :: () -> void #foreign steam_api64;

/// Perform certain periodic actions that need to be performed.
SteamAPI_ManualDispatch_RunFrame :: (hSteamPipe: HSteamPipe) -> void #foreign steam_api64;

/// Fetch the next pending callback on the given pipe, if any.  If a callback is available, true is returned
/// and the structure is populated.  In this case, you MUST call SteamAPI_ManualDispatch_FreeLastCallback
/// (after dispatching the callback) before calling SteamAPI_ManualDispatch_GetNextCallback again.
SteamAPI_ManualDispatch_GetNextCallback :: (hSteamPipe: HSteamPipe, pCallbackMsg: *CallbackMsg_t) -> bool #foreign steam_api64;

/// You must call this after dispatching the callback, if SteamAPI_ManualDispatch_GetNextCallback returns true.
SteamAPI_ManualDispatch_FreeLastCallback :: (hSteamPipe: HSteamPipe) -> void #foreign steam_api64;

/// Return the call result for the specified call on the specified pipe.  You really should
/// only call this in a handler for SteamAPICallCompleted_t callback.
SteamAPI_ManualDispatch_GetAPICallResult :: (hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool #foreign steam_api64;

// Internal implementation of SteamAPI_InitEx.  This is done in a way that checks
// all of the versions of interfaces from headers being compiled into this code.
SteamInternal_SteamAPI_Init :: (pszInternalCheckInterfaceVersions: *u8, pOutErrMsg: *SteamErrMsg) -> ESteamAPIInitResult #foreign steam_api64;

//-----------------------------------------------------------------------------
// Purpose: Functions for authenticating users via Steam to play on a game server
//-----------------------------------------------------------------------------
ISteamGameServer :: struct {
    vtable: *ISteamGameServer_VTable;
}
ISteamGameServer_VTable :: struct #type_info_none {
    InitGameServer: (this: *ISteamGameServer, unIP: uint32, usGamePort: uint16, usQueryPort: uint16, unFlags: uint32, nGameAppId: AppId_t, pchVersionString: *u8) -> bool #cpp_method;

    SetProduct: (this: *ISteamGameServer, pszProduct: *u8) -> void #cpp_method;

    SetGameDescription: (this: *ISteamGameServer, pszGameDescription: *u8) -> void #cpp_method;

    SetModDir: (this: *ISteamGameServer, pszModDir: *u8) -> void #cpp_method;

    SetDedicatedServer: (this: *ISteamGameServer, bDedicated: bool) -> void #cpp_method;

    LogOn: (this: *ISteamGameServer, pszToken: *u8) -> void #cpp_method;

    LogOnAnonymous: (this: *ISteamGameServer) -> void #cpp_method;

    LogOff: (this: *ISteamGameServer) -> void #cpp_method;

    BLoggedOn: (this: *ISteamGameServer) -> bool #cpp_method;
    BSecure: (this: *ISteamGameServer) -> bool #cpp_method;
    GetSteamID: (this: *ISteamGameServer) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    WasRestartRequested: (this: *ISteamGameServer) -> bool #cpp_method;

    SetMaxPlayerCount: (this: *ISteamGameServer, cPlayersMax: s32) -> void #cpp_method;

    SetBotPlayerCount: (this: *ISteamGameServer, cBotplayers: s32) -> void #cpp_method;

    SetServerName: (this: *ISteamGameServer, pszServerName: *u8) -> void #cpp_method;

    SetMapName: (this: *ISteamGameServer, pszMapName: *u8) -> void #cpp_method;

    SetPasswordProtected: (this: *ISteamGameServer, bPasswordProtected: bool) -> void #cpp_method;

    SetSpectatorPort: (this: *ISteamGameServer, unSpectatorPort: uint16) -> void #cpp_method;

    SetSpectatorServerName: (this: *ISteamGameServer, pszSpectatorServerName: *u8) -> void #cpp_method;

    ClearAllKeyValues: (this: *ISteamGameServer) -> void #cpp_method;

    SetKeyValue: (this: *ISteamGameServer, pKey: *u8, pValue: *u8) -> void #cpp_method;

    SetGameTags: (this: *ISteamGameServer, pchGameTags: *u8) -> void #cpp_method;

    SetGameData: (this: *ISteamGameServer, pchGameData: *u8) -> void #cpp_method;

    SetRegion: (this: *ISteamGameServer, pszRegion: *u8) -> void #cpp_method;

    SetAdvertiseServerActive: (this: *ISteamGameServer, bActive: bool) -> void #cpp_method;

    GetAuthSessionTicket: (this: *ISteamGameServer, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32, pSnid: *SteamNetworkingIdentity) -> HAuthTicket #cpp_method;

    BeginAuthSession: (this: *ISteamGameServer, pAuthTicket: *void, cbAuthTicket: s32, steamID: CSteamID) -> EBeginAuthSessionResult #cpp_method;

    EndAuthSession: (this: *ISteamGameServer, steamID: CSteamID) -> void #cpp_method;

    CancelAuthTicket: (this: *ISteamGameServer, hAuthTicket: HAuthTicket) -> void #cpp_method;

    UserHasLicenseForApp: (this: *ISteamGameServer, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult #cpp_method;

    RequestUserGroupStatus: (this: *ISteamGameServer, steamIDUser: CSteamID, steamIDGroup: CSteamID) -> bool #cpp_method;

    GetGameplayStats: (this: *ISteamGameServer) -> void #cpp_method;

    GetServerReputation: (this: *ISteamGameServer) -> SteamAPICall_t #cpp_method;

    GetPublicIP: (this: *ISteamGameServer) -> SteamIPAddress_t #cpp_method;

    HandleIncomingPacket: (this: *ISteamGameServer, pData: *void, cbData: s32, srcIP: uint32, srcPort: uint16) -> bool #cpp_method;

    GetNextOutgoingPacket: (this: *ISteamGameServer, pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16) -> s32 #cpp_method;

    AssociateWithClan: (this: *ISteamGameServer, steamIDClan: CSteamID) -> SteamAPICall_t #cpp_method;

    ComputeNewPlayerCompatibility: (this: *ISteamGameServer, steamIDNewPlayer: CSteamID) -> SteamAPICall_t #cpp_method;

    SendUserConnectAndAuthenticate_DEPRECATED: (this: *ISteamGameServer, unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID) -> bool #cpp_method;

    CreateUnauthenticatedUserConnection: (this: *ISteamGameServer) -> CSteamID #cpp_method #cpp_return_type_is_non_pod;

    SendUserDisconnect_DEPRECATED: (this: *ISteamGameServer, steamIDUser: CSteamID) -> void #cpp_method;

    BUpdateUserData: (this: *ISteamGameServer, steamIDUser: CSteamID, pchPlayerName: *u8, uScore: uint32) -> bool #cpp_method;

    SetMasterServerHeartbeatInterval_DEPRECATED: (this: *ISteamGameServer, iHeartbeatInterval: s32) -> void #cpp_method;
    ForceMasterServerHeartbeat_DEPRECATED: (this: *ISteamGameServer) -> void #cpp_method;
}

ISteamGameServer_InitGameServer :: inline (this: *ISteamGameServer, unIP: uint32, usGamePort: uint16, usQueryPort: uint16, unFlags: uint32, nGameAppId: AppId_t, pchVersionString: *u8) -> bool { return this.vtable.InitGameServer(this, unIP, usGamePort, usQueryPort, unFlags, nGameAppId, pchVersionString); }

ISteamGameServer_SetProduct :: inline (this: *ISteamGameServer, pszProduct: *u8) { this.vtable.SetProduct(this, pszProduct); }

ISteamGameServer_SetGameDescription :: inline (this: *ISteamGameServer, pszGameDescription: *u8) { this.vtable.SetGameDescription(this, pszGameDescription); }

ISteamGameServer_SetModDir :: inline (this: *ISteamGameServer, pszModDir: *u8) { this.vtable.SetModDir(this, pszModDir); }

ISteamGameServer_SetDedicatedServer :: inline (this: *ISteamGameServer, bDedicated: bool) { this.vtable.SetDedicatedServer(this, bDedicated); }

ISteamGameServer_LogOn :: inline (this: *ISteamGameServer, pszToken: *u8) { this.vtable.LogOn(this, pszToken); }

ISteamGameServer_LogOnAnonymous :: inline (this: *ISteamGameServer) { this.vtable.LogOnAnonymous(this); }

ISteamGameServer_LogOff :: inline (this: *ISteamGameServer) { this.vtable.LogOff(this); }

ISteamGameServer_BLoggedOn :: inline (this: *ISteamGameServer) -> bool { return this.vtable.BLoggedOn(this); }
ISteamGameServer_BSecure :: inline (this: *ISteamGameServer) -> bool { return this.vtable.BSecure(this); }
ISteamGameServer_GetSteamID :: inline (this: *ISteamGameServer) -> CSteamID { return this.vtable.GetSteamID(this); }

ISteamGameServer_WasRestartRequested :: inline (this: *ISteamGameServer) -> bool { return this.vtable.WasRestartRequested(this); }

ISteamGameServer_SetMaxPlayerCount :: inline (this: *ISteamGameServer, cPlayersMax: s32) { this.vtable.SetMaxPlayerCount(this, cPlayersMax); }

ISteamGameServer_SetBotPlayerCount :: inline (this: *ISteamGameServer, cBotplayers: s32) { this.vtable.SetBotPlayerCount(this, cBotplayers); }

ISteamGameServer_SetServerName :: inline (this: *ISteamGameServer, pszServerName: *u8) { this.vtable.SetServerName(this, pszServerName); }

ISteamGameServer_SetMapName :: inline (this: *ISteamGameServer, pszMapName: *u8) { this.vtable.SetMapName(this, pszMapName); }

ISteamGameServer_SetPasswordProtected :: inline (this: *ISteamGameServer, bPasswordProtected: bool) { this.vtable.SetPasswordProtected(this, bPasswordProtected); }

ISteamGameServer_SetSpectatorPort :: inline (this: *ISteamGameServer, unSpectatorPort: uint16) { this.vtable.SetSpectatorPort(this, unSpectatorPort); }

ISteamGameServer_SetSpectatorServerName :: inline (this: *ISteamGameServer, pszSpectatorServerName: *u8) { this.vtable.SetSpectatorServerName(this, pszSpectatorServerName); }

ISteamGameServer_ClearAllKeyValues :: inline (this: *ISteamGameServer) { this.vtable.ClearAllKeyValues(this); }

ISteamGameServer_SetKeyValue :: inline (this: *ISteamGameServer, pKey: *u8, pValue: *u8) { this.vtable.SetKeyValue(this, pKey, pValue); }

ISteamGameServer_SetGameTags :: inline (this: *ISteamGameServer, pchGameTags: *u8) { this.vtable.SetGameTags(this, pchGameTags); }

ISteamGameServer_SetGameData :: inline (this: *ISteamGameServer, pchGameData: *u8) { this.vtable.SetGameData(this, pchGameData); }

ISteamGameServer_SetRegion :: inline (this: *ISteamGameServer, pszRegion: *u8) { this.vtable.SetRegion(this, pszRegion); }

ISteamGameServer_SetAdvertiseServerActive :: inline (this: *ISteamGameServer, bActive: bool) { this.vtable.SetAdvertiseServerActive(this, bActive); }

ISteamGameServer_GetAuthSessionTicket :: inline (this: *ISteamGameServer, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32, pSnid: *SteamNetworkingIdentity) -> HAuthTicket { return this.vtable.GetAuthSessionTicket(this, pTicket, cbMaxTicket, pcbTicket, pSnid); }

ISteamGameServer_BeginAuthSession :: inline (this: *ISteamGameServer, pAuthTicket: *void, cbAuthTicket: s32, steamID: CSteamID) -> EBeginAuthSessionResult { return this.vtable.BeginAuthSession(this, pAuthTicket, cbAuthTicket, steamID); }

ISteamGameServer_EndAuthSession :: inline (this: *ISteamGameServer, steamID: CSteamID) { this.vtable.EndAuthSession(this, steamID); }

ISteamGameServer_CancelAuthTicket :: inline (this: *ISteamGameServer, hAuthTicket: HAuthTicket) { this.vtable.CancelAuthTicket(this, hAuthTicket); }

ISteamGameServer_UserHasLicenseForApp :: inline (this: *ISteamGameServer, steamID: CSteamID, appID: AppId_t) -> EUserHasLicenseForAppResult { return this.vtable.UserHasLicenseForApp(this, steamID, appID); }

ISteamGameServer_RequestUserGroupStatus :: inline (this: *ISteamGameServer, steamIDUser: CSteamID, steamIDGroup: CSteamID) -> bool { return this.vtable.RequestUserGroupStatus(this, steamIDUser, steamIDGroup); }

ISteamGameServer_GetGameplayStats :: inline (this: *ISteamGameServer) { this.vtable.GetGameplayStats(this); }

ISteamGameServer_GetServerReputation :: inline (this: *ISteamGameServer) -> SteamAPICall_t { return this.vtable.GetServerReputation(this); }

ISteamGameServer_GetPublicIP :: inline (this: *ISteamGameServer) -> SteamIPAddress_t { return this.vtable.GetPublicIP(this); }

ISteamGameServer_HandleIncomingPacket :: inline (this: *ISteamGameServer, pData: *void, cbData: s32, srcIP: uint32, srcPort: uint16) -> bool { return this.vtable.HandleIncomingPacket(this, pData, cbData, srcIP, srcPort); }

ISteamGameServer_GetNextOutgoingPacket :: inline (this: *ISteamGameServer, pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16) -> s32 { return this.vtable.GetNextOutgoingPacket(this, pOut, cbMaxOut, pNetAdr, pPort); }

ISteamGameServer_AssociateWithClan :: inline (this: *ISteamGameServer, steamIDClan: CSteamID) -> SteamAPICall_t { return this.vtable.AssociateWithClan(this, steamIDClan); }

ISteamGameServer_ComputeNewPlayerCompatibility :: inline (this: *ISteamGameServer, steamIDNewPlayer: CSteamID) -> SteamAPICall_t { return this.vtable.ComputeNewPlayerCompatibility(this, steamIDNewPlayer); }

ISteamGameServer_SendUserConnectAndAuthenticate_DEPRECATED :: inline (this: *ISteamGameServer, unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID) -> bool { return this.vtable.SendUserConnectAndAuthenticate_DEPRECATED(this, unIPClient, pvAuthBlob, cubAuthBlobSize, pSteamIDUser); }

ISteamGameServer_CreateUnauthenticatedUserConnection :: inline (this: *ISteamGameServer) -> CSteamID { return this.vtable.CreateUnauthenticatedUserConnection(this); }

ISteamGameServer_SendUserDisconnect_DEPRECATED :: inline (this: *ISteamGameServer, steamIDUser: CSteamID) { this.vtable.SendUserDisconnect_DEPRECATED(this, steamIDUser); }

ISteamGameServer_BUpdateUserData :: inline (this: *ISteamGameServer, steamIDUser: CSteamID, pchPlayerName: *u8, uScore: uint32) -> bool { return this.vtable.BUpdateUserData(this, steamIDUser, pchPlayerName, uScore); }

ISteamGameServer_SetMasterServerHeartbeatInterval_DEPRECATED :: inline (this: *ISteamGameServer, iHeartbeatInterval: s32) { this.vtable.SetMasterServerHeartbeatInterval_DEPRECATED(this, iHeartbeatInterval); }
ISteamGameServer_ForceMasterServerHeartbeat_DEPRECATED :: inline (this: *ISteamGameServer) { this.vtable.ForceMasterServerHeartbeat_DEPRECATED(this); }

vtable :: (obj: *ISteamGameServer) -> *ISteamGameServer_VTable { return obj.vtable; }


// client has been approved to connect to this game server
GSClientApprove_t :: struct {
    anon_enum_247 :: enum s32 {
        k_iCallback :: 201;
    }
    m_SteamID:      CSteamID; // SteamID of approved player
    m_OwnerSteamID: CSteamID; // SteamID of original owner for game license
}

// client has been denied to connection to this game server
GSClientDeny_t :: struct {
    anon_enum_248 :: enum s32 {
        k_iCallback :: 202;
    }
    m_SteamID:          CSteamID;
    m_eDenyReason:      EDenyReason;
    m_rgchOptionalText: [128] u8;
}

// request the game server should kick the user
GSClientKick_t :: struct {
    anon_enum_249 :: enum s32 {
        k_iCallback :: 203;
    }
    m_SteamID:     CSteamID;
    m_eDenyReason: EDenyReason;
}

// client achievement info
GSClientAchievementStatus_t :: struct {
    anon_enum_250 :: enum s32 {
        k_iCallback :: 206;
    }
    m_SteamID:        uint64;
    m_pchAchievement: [128] u8;
    m_bUnlocked:      bool;
}

// received when the game server requests to be displayed as secure (VAC protected)
// m_bSecure is true if the game server should display itself as secure to users, false otherwise
GSPolicyResponse_t :: struct {
    anon_enum_251 :: enum s32 {
        k_iCallback :: 115;
    }
    m_bSecure: uint8;
}

// GS gameplay stats info
GSGameplayStats_t :: struct {
    anon_enum_252 :: enum s32 {
        k_iCallback :: 207;
    }
    m_eResult:              EResult; // Result of the call
    m_nRank:                int32; // Overall rank of the server (0-based)
    m_unTotalConnects:      uint32; // Total number of clients who have ever connected to the server
    m_unTotalMinutesPlayed: uint32; // Total number of minutes ever played on the server
}

// send as a reply to RequestUserGroupStatus()
GSClientGroupStatus_t :: struct {
    anon_enum_253 :: enum s32 {
        k_iCallback :: 208;
    }
    m_SteamIDUser:  CSteamID;
    m_SteamIDGroup: CSteamID;
    m_bMember:      bool;
    m_bOfficer:     bool;
}

// Sent as a reply to GetServerReputation()
GSReputation_t :: struct {
    anon_enum_254 :: enum s32 {
        k_iCallback :: 209;
    }
    m_eResult:           EResult; // Result of the call;
    m_unReputationScore: uint32; // The reputation score for the game server
    m_bBanned:           bool; // True if the server is banned from the Steam

    m_unBannedIP:        uint32; // The IP of the banned server
    m_usBannedPort:      uint16; // The port of the banned server
    m_ulBannedGameID:    uint64; // The game ID the banned server is serving
    m_unBanExpires:      uint32; // Time the ban expires, expressed in the Unix epoch (seconds since 1/1/1970)
}

// Sent as a reply to AssociateWithClan()
AssociateWithClanResult_t :: struct {
    anon_enum_255 :: enum s32 {
        k_iCallback :: 210;
    }
    m_eResult: EResult; // Result of the call;
}

// Sent as a reply to ComputeNewPlayerCompatibility()
ComputeNewPlayerCompatibilityResult_t :: struct {
    anon_enum_256 :: enum s32 {
        k_iCallback :: 211;
    }
    m_eResult:                           EResult; // Result of the call;
    m_cPlayersThatDontLikeCandidate:     s32;
    m_cPlayersThatCandidateDoesntLike:   s32;
    m_cClanPlayersThatDontLikeCandidate: s32;
    m_SteamIDCandidate:                  CSteamID;
}

//-----------------------------------------------------------------------------
// Purpose: Functions for authenticating users via Steam to play on a game server
//-----------------------------------------------------------------------------
ISteamGameServerStats :: struct {
    vtable: *ISteamGameServerStats_VTable;
}
ISteamGameServerStats_VTable :: struct #type_info_none {
    RequestUserStats: (this: *ISteamGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t #cpp_method;

    GetUserStat: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8, pData: *float) -> bool #cpp_method;

    GetUserStat_1: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, pData: *int32) -> bool #cpp_method;

    GetUserAchievement: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8, pbAchieved: *bool) -> bool #cpp_method;

    SetUserStat: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8, fData: float) -> bool #cpp_method;

    SetUserStat_1: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, nData: int32) -> bool #cpp_method;

    UpdateUserAvgRateStat: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8, flCountThisSession: float, dSessionLength: float64) -> bool #cpp_method;

    SetUserAchievement: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8) -> bool #cpp_method;
    ClearUserAchievement: (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8) -> bool #cpp_method;

    StoreUserStats: (this: *ISteamGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t #cpp_method;
}

ISteamGameServerStats_RequestUserStats :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t { return this.vtable.RequestUserStats(this, steamIDUser); }

ISteamGameServerStats_GetUserStat :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, pData: *float) -> bool { return this.vtable.GetUserStat(this, steamIDUser, pchName, pData); }

ISteamGameServerStats_GetUserStat_1 :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, pData: *int32) -> bool { return this.vtable.GetUserStat_1(this, steamIDUser, pchName, pData); }

ISteamGameServerStats_GetUserAchievement :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8, pbAchieved: *bool) -> bool { return this.vtable.GetUserAchievement(this, steamIDUser, pchName, pbAchieved); }

ISteamGameServerStats_SetUserStat :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, fData: float) -> bool { return this.vtable.SetUserStat(this, steamIDUser, pchName, fData); }

ISteamGameServerStats_SetUserStat_1 :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: /*const*/ *u8, nData: int32) -> bool { return this.vtable.SetUserStat_1(this, steamIDUser, pchName, nData); }

ISteamGameServerStats_UpdateUserAvgRateStat :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8, flCountThisSession: float, dSessionLength: float64) -> bool { return this.vtable.UpdateUserAvgRateStat(this, steamIDUser, pchName, flCountThisSession, dSessionLength); }

ISteamGameServerStats_SetUserAchievement :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8) -> bool { return this.vtable.SetUserAchievement(this, steamIDUser, pchName); }
ISteamGameServerStats_ClearUserAchievement :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID, pchName: *u8) -> bool { return this.vtable.ClearUserAchievement(this, steamIDUser, pchName); }

ISteamGameServerStats_StoreUserStats :: inline (this: *ISteamGameServerStats, steamIDUser: CSteamID) -> SteamAPICall_t { return this.vtable.StoreUserStats(this, steamIDUser); }

vtable :: (obj: *ISteamGameServerStats) -> *ISteamGameServerStats_VTable { return obj.vtable; }


//-----------------------------------------------------------------------------
// Purpose: called when the latests stats and achievements have been received
//			from the server
//-----------------------------------------------------------------------------
GSStatsReceived_t :: struct {
    anon_enum_257 :: enum s32 {
        k_iCallback :: 1800;
    }
    m_eResult:     EResult; // Success / error fetching the stats
    m_steamIDUser: CSteamID #align 4; // The user for whom the stats are retrieved for
}

//-----------------------------------------------------------------------------
// Purpose: result of a request to store the user stats for a game
//-----------------------------------------------------------------------------
GSStatsStored_t :: struct {
    anon_enum_258 :: enum s32 {
        k_iCallback :: 1801;
    }
    m_eResult:     EResult; // success / error
    m_steamIDUser: CSteamID #align 4; // The user for whom the stats were stored
}

//-----------------------------------------------------------------------------
// Purpose: Callback indicating that a user's stats have been unloaded.
//  Call RequestUserStats again to access stats for this user
//-----------------------------------------------------------------------------
GSStatsUnloaded_t :: struct {
    anon_enum_259 :: enum s32 {
        k_iCallback :: 1108;
    }
    m_steamIDUser: CSteamID; // User whose stats have been unloaded
}

uint64_steamid :: uint64;
uint64_gameid :: uint64;

// ISteamClient
SteamAPI_ISteamClient_CreateSteamPipe :: (self: *ISteamClient) -> HSteamPipe #foreign steam_api64;
SteamAPI_ISteamClient_BReleaseSteamPipe :: (self: *ISteamClient, hSteamPipe: HSteamPipe) -> bool #foreign steam_api64;
SteamAPI_ISteamClient_ConnectToGlobalUser :: (self: *ISteamClient, hSteamPipe: HSteamPipe) -> HSteamUser #foreign steam_api64;
SteamAPI_ISteamClient_CreateLocalUser :: (self: *ISteamClient, phSteamPipe: *HSteamPipe, eAccountType: EAccountType) -> HSteamUser #foreign steam_api64;
SteamAPI_ISteamClient_ReleaseUser :: (self: *ISteamClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) -> void #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamUser :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUser #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamGameServer :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameServer #foreign steam_api64;
SteamAPI_ISteamClient_SetLocalIPBinding :: (self: *ISteamClient, unIP: *SteamIPAddress_t, usPort: uint16) -> void #foreign steam_api64;
SteamAPI_ISteamClient_SetLocalIPBinding :: (self: *ISteamClient, unIP: SteamIPAddress_t, usPort: uint16) #no_context {
    SteamAPI_ISteamClient_SetLocalIPBinding(self, *unIP, usPort);
}
SteamAPI_ISteamClient_GetISteamFriends :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamFriends #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamUtils :: (self: *ISteamClient, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUtils #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamMatchmaking :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMatchmaking #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamMatchmakingServers :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMatchmakingServers #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamGenericInterface :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *void #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamUserStats :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUserStats #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamGameServerStats :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameServerStats #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamApps :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamApps #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamNetworking :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamNetworking #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamRemoteStorage :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamRemoteStorage #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamScreenshots :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamScreenshots #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamGameSearch :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamGameSearch #foreign steam_api64;
SteamAPI_ISteamClient_GetIPCCallCount :: (self: *ISteamClient) -> uint32 #foreign steam_api64;
SteamAPI_ISteamClient_SetWarningMessageHook :: (self: *ISteamClient, pFunction: SteamAPIWarningMessageHook_t) -> void #foreign steam_api64;
SteamAPI_ISteamClient_BShutdownIfAllPipesClosed :: (self: *ISteamClient) -> bool #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamHTTP :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamHTTP #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamController :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamController #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamUGC :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamUGC #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamMusic :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMusic #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamMusicRemote :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamMusicRemote #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamHTMLSurface :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamHTMLSurface #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamInventory :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamInventory #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamVideo :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamVideo #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamParentalSettings :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamParentalSettings #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamInput :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamInput #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamParties :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamParties #foreign steam_api64;
SteamAPI_ISteamClient_GetISteamRemotePlay :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *u8) -> *ISteamRemotePlay #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamUser_v023 :: () -> *ISteamUser #foreign steam_api64;

SteamAPI_ISteamUser_GetHSteamUser :: (self: *ISteamUser) -> HSteamUser #foreign steam_api64;
SteamAPI_ISteamUser_BLoggedOn :: (self: *ISteamUser) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_GetSteamID :: (self: *ISteamUser) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamUser_InitiateGameConnection_DEPRECATED :: (self: *ISteamUser, pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> s32 #foreign steam_api64;
SteamAPI_ISteamUser_TerminateGameConnection_DEPRECATED :: (self: *ISteamUser, unIPServer: uint32, usPortServer: uint16) -> void #foreign steam_api64;
SteamAPI_ISteamUser_TrackAppUsageEvent :: (self: *ISteamUser, gameID: uint64_gameid, eAppUsageEvent: s32, pchExtraInfo: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamUser_GetUserDataFolder :: (self: *ISteamUser, pchBuffer: *u8, cubBuffer: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_StartVoiceRecording :: (self: *ISteamUser) -> void #foreign steam_api64;
SteamAPI_ISteamUser_StopVoiceRecording :: (self: *ISteamUser) -> void #foreign steam_api64;
SteamAPI_ISteamUser_GetAvailableVoice :: (self: *ISteamUser, pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult #foreign steam_api64;
SteamAPI_ISteamUser_GetVoice :: (self: *ISteamUser, bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: *void, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult #foreign steam_api64;
SteamAPI_ISteamUser_DecompressVoice :: (self: *ISteamUser, pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult #foreign steam_api64;
SteamAPI_ISteamUser_GetVoiceOptimalSampleRate :: (self: *ISteamUser) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUser_GetAuthSessionTicket :: (self: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32, pSteamNetworkingIdentity: *SteamNetworkingIdentity) -> HAuthTicket #foreign steam_api64;
SteamAPI_ISteamUser_GetAuthTicketForWebApi :: (self: *ISteamUser, pchIdentity: *u8) -> HAuthTicket #foreign steam_api64;
SteamAPI_ISteamUser_BeginAuthSession :: (self: *ISteamUser, pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult #foreign steam_api64;
SteamAPI_ISteamUser_EndAuthSession :: (self: *ISteamUser, steamID: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamUser_CancelAuthTicket :: (self: *ISteamUser, hAuthTicket: HAuthTicket) -> void #foreign steam_api64;
SteamAPI_ISteamUser_UserHasLicenseForApp :: (self: *ISteamUser, steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult #foreign steam_api64;
SteamAPI_ISteamUser_BIsBehindNAT :: (self: *ISteamUser) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_AdvertiseGame :: (self: *ISteamUser, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16) -> void #foreign steam_api64;
SteamAPI_ISteamUser_RequestEncryptedAppTicket :: (self: *ISteamUser, pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUser_GetEncryptedAppTicket :: (self: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_GetGameBadgeLevel :: (self: *ISteamUser, nSeries: s32, bFoil: bool) -> s32 #foreign steam_api64;
SteamAPI_ISteamUser_GetPlayerSteamLevel :: (self: *ISteamUser) -> s32 #foreign steam_api64;
SteamAPI_ISteamUser_RequestStoreAuthURL :: (self: *ISteamUser, pchRedirectURL: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUser_BIsPhoneVerified :: (self: *ISteamUser) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_BIsTwoFactorEnabled :: (self: *ISteamUser) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_BIsPhoneIdentifying :: (self: *ISteamUser) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_BIsPhoneRequiringVerification :: (self: *ISteamUser) -> bool #foreign steam_api64;
SteamAPI_ISteamUser_GetMarketEligibility :: (self: *ISteamUser) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUser_GetDurationControl :: (self: *ISteamUser) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUser_BSetDurationControlOnlineState :: (self: *ISteamUser, eNewState: EDurationControlOnlineState) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamFriends_v017 :: () -> *ISteamFriends #foreign steam_api64;

SteamAPI_ISteamFriends_GetPersonaName :: (self: *ISteamFriends) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_SetPersonaName :: (self: *ISteamFriends, pchPersonaName: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_GetPersonaState :: (self: *ISteamFriends) -> EPersonaState #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendCount :: (self: *ISteamFriends, iFriendFlags: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendByIndex :: (self: *ISteamFriends, iFriend: s32, iFriendFlags: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendRelationship :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> EFriendRelationship #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendPersonaState :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> EPersonaState #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendPersonaName :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendGamePlayed :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pFriendGameInfo: *FriendGameInfo_t) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendPersonaNameHistory :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iPersonaName: s32) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendSteamLevel :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetPlayerNickname :: (self: *ISteamFriends, steamIDPlayer: uint64_steamid) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendsGroupCount :: (self: *ISteamFriends) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex :: (self: *ISteamFriends, iFG: s32) -> FriendsGroupID_t #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendsGroupName :: (self: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendsGroupMembersCount :: (self: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendsGroupMembersList :: (self: *ISteamFriends, friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_HasFriend :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iFriendFlags: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanCount :: (self: *ISteamFriends) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanByIndex :: (self: *ISteamFriends, iClan: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanName :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanTag :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanActivityCounts :: (self: *ISteamFriends, steamIDClan: uint64_steamid, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_DownloadClanActivityCounts :: (self: *ISteamFriends, psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendCountFromSource :: (self: *ISteamFriends, steamIDSource: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendFromSourceByIndex :: (self: *ISteamFriends, steamIDSource: uint64_steamid, iFriend: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamFriends_IsUserInSource :: (self: *ISteamFriends, steamIDUser: uint64_steamid, steamIDSource: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_SetInGameVoiceSpeaking :: (self: *ISteamFriends, steamIDUser: uint64_steamid, bSpeaking: bool) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_ActivateGameOverlay :: (self: *ISteamFriends, pchDialog: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_ActivateGameOverlayToUser :: (self: *ISteamFriends, pchDialog: *u8, steamID: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage :: (self: *ISteamFriends, pchURL: *u8, eMode: EActivateGameOverlayToWebPageMode) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_ActivateGameOverlayToStore :: (self: *ISteamFriends, nAppID: AppId_t, eFlag: EOverlayToStoreFlag) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_SetPlayedWith :: (self: *ISteamFriends, steamIDUserPlayedWith: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog :: (self: *ISteamFriends, steamIDLobby: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_GetSmallFriendAvatar :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetMediumFriendAvatar :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetLargeFriendAvatar :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_RequestUserInformation :: (self: *ISteamFriends, steamIDUser: uint64_steamid, bRequireNameOnly: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_RequestClanOfficerList :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanOwner :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanOfficerCount :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanOfficerByIndex :: (self: *ISteamFriends, steamIDClan: uint64_steamid, iOfficer: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamFriends_GetUserRestrictions :: (self: *ISteamFriends) -> uint32 #foreign steam_api64;
SteamAPI_ISteamFriends_SetRichPresence :: (self: *ISteamFriends, pchKey: *u8, pchValue: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_ClearRichPresence :: (self: *ISteamFriends) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendRichPresence :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pchKey: *u8) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iKey: s32) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_RequestFriendRichPresence :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_InviteUserToGame :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pchConnectString: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetCoplayFriendCount :: (self: *ISteamFriends) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetCoplayFriend :: (self: *ISteamFriends, iCoplayFriend: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendCoplayTime :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendCoplayGame :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> AppId_t #foreign steam_api64;
SteamAPI_ISteamFriends_JoinClanChatRoom :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_LeaveClanChatRoom :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanChatMemberCount :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetChatMemberByIndex :: (self: *ISteamFriends, steamIDClan: uint64_steamid, iUser: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamFriends_SendClanChatMessage :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid, pchText: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetClanChatMessage :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_IsClanChatAdmin :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid, steamIDUser: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_OpenClanChatWindowInSteam :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_CloseClanChatWindowInSteam :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_SetListenForFriendsMessages :: (self: *ISteamFriends, bInterceptEnabled: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_ReplyToFriendMessage :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pchMsgToSend: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetFriendMessage :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_GetFollowerCount :: (self: *ISteamFriends, steamID: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_IsFollowing :: (self: *ISteamFriends, steamID: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_EnumerateFollowingList :: (self: *ISteamFriends, unStartIndex: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_IsClanPublic :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_IsClanOfficialGameGroup :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages :: (self: *ISteamFriends) -> s32 #foreign steam_api64;
SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: (self: *ISteamFriends, steamIDLobby: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser :: (self: *ISteamFriends, pchProtocol: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString :: (self: *ISteamFriends, pchConnectString: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamFriends_RequestEquippedProfileItems :: (self: *ISteamFriends, steamID: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamFriends_BHasEquippedProfileItem :: (self: *ISteamFriends, steamID: uint64_steamid, itemType: ECommunityProfileItemType) -> bool #foreign steam_api64;
SteamAPI_ISteamFriends_GetProfileItemPropertyString :: (self: *ISteamFriends, steamID: uint64_steamid, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> *u8 #foreign steam_api64;
SteamAPI_ISteamFriends_GetProfileItemPropertyUint :: (self: *ISteamFriends, steamID: uint64_steamid, itemType: ECommunityProfileItemType, prop: ECommunityProfileItemProperty) -> uint32 #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamUtils_v010 :: () -> *ISteamUtils #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerUtils_v010 :: () -> *ISteamUtils #foreign steam_api64;

SteamAPI_ISteamUtils_GetSecondsSinceAppActive :: (self: *ISteamUtils) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUtils_GetSecondsSinceComputerActive :: (self: *ISteamUtils) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUtils_GetConnectedUniverse :: (self: *ISteamUtils) -> EUniverse #foreign steam_api64;
SteamAPI_ISteamUtils_GetServerRealTime :: (self: *ISteamUtils) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUtils_GetIPCountry :: (self: *ISteamUtils) -> *u8 #foreign steam_api64;
SteamAPI_ISteamUtils_GetImageSize :: (self: *ISteamUtils, iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_GetImageRGBA :: (self: *ISteamUtils, iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_GetCurrentBatteryPower :: (self: *ISteamUtils) -> uint8 #foreign steam_api64;
SteamAPI_ISteamUtils_GetAppID :: (self: *ISteamUtils) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUtils_SetOverlayNotificationPosition :: (self: *ISteamUtils, eNotificationPosition: ENotificationPosition) -> void #foreign steam_api64;
SteamAPI_ISteamUtils_IsAPICallCompleted :: (self: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_GetAPICallFailureReason :: (self: *ISteamUtils, hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure #foreign steam_api64;
SteamAPI_ISteamUtils_GetAPICallResult :: (self: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_GetIPCCallCount :: (self: *ISteamUtils) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUtils_SetWarningMessageHook :: (self: *ISteamUtils, pFunction: SteamAPIWarningMessageHook_t) -> void #foreign steam_api64;
SteamAPI_ISteamUtils_IsOverlayEnabled :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_BOverlayNeedsPresent :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_CheckFileSignature :: (self: *ISteamUtils, szFileName: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUtils_ShowGamepadTextInput :: (self: *ISteamUtils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *u8, unCharMax: uint32, pchExistingText: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_GetEnteredGamepadTextLength :: (self: *ISteamUtils) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUtils_GetEnteredGamepadTextInput :: (self: *ISteamUtils, pchText: *u8, cchText: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_GetSteamUILanguage :: (self: *ISteamUtils) -> *u8 #foreign steam_api64;
SteamAPI_ISteamUtils_IsSteamRunningInVR :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_SetOverlayNotificationInset :: (self: *ISteamUtils, nHorizontalInset: s32, nVerticalInset: s32) -> void #foreign steam_api64;
SteamAPI_ISteamUtils_IsSteamInBigPictureMode :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_StartVRDashboard :: (self: *ISteamUtils) -> void #foreign steam_api64;
SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled :: (self: *ISteamUtils, bEnabled: bool) -> void #foreign steam_api64;
SteamAPI_ISteamUtils_IsSteamChinaLauncher :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_InitFilterText :: (self: *ISteamUtils, unFilterOptions: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_FilterText :: (self: *ISteamUtils, eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *u8, pchOutFilteredText: *u8, nByteSizeOutFilteredText: uint32) -> s32 #foreign steam_api64;
SteamAPI_ISteamUtils_GetIPv6ConnectivityState :: (self: *ISteamUtils, eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState #foreign steam_api64;
SteamAPI_ISteamUtils_IsSteamRunningOnSteamDeck :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_ShowFloatingGamepadTextInput :: (self: *ISteamUtils, eKeyboardMode: EFloatingGamepadTextInputMode, nTextFieldXPosition: s32, nTextFieldYPosition: s32, nTextFieldWidth: s32, nTextFieldHeight: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_SetGameLauncherMode :: (self: *ISteamUtils, bLauncherMode: bool) -> void #foreign steam_api64;
SteamAPI_ISteamUtils_DismissFloatingGamepadTextInput :: (self: *ISteamUtils) -> bool #foreign steam_api64;
SteamAPI_ISteamUtils_DismissGamepadTextInput :: (self: *ISteamUtils) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamMatchmaking_v009 :: () -> *ISteamMatchmaking #foreign steam_api64;

SteamAPI_ISteamMatchmaking_GetFavoriteGameCount :: (self: *ISteamMatchmaking) -> s32 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetFavoriteGame :: (self: *ISteamMatchmaking, iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddFavoriteGame :: (self: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> s32 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_RemoveFavoriteGame :: (self: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_RequestLobbyList :: (self: *ISteamMatchmaking) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter :: (self: *ISteamMatchmaking, pchKeyToMatch: *u8, pchValueToMatch: *u8, eComparisonType: ELobbyComparison) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter :: (self: *ISteamMatchmaking, pchKeyToMatch: *u8, nValueToMatch: s32, eComparisonType: ELobbyComparison) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter :: (self: *ISteamMatchmaking, pchKeyToMatch: *u8, nValueToBeCloseTo: s32) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable :: (self: *ISteamMatchmaking, nSlotsAvailable: s32) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter :: (self: *ISteamMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter :: (self: *ISteamMatchmaking, cMaxResults: s32) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyByIndex :: (self: *ISteamMatchmaking, iLobby: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamMatchmaking_CreateLobby :: (self: *ISteamMatchmaking, eLobbyType: ELobbyType, cMaxMembers: s32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamMatchmaking_JoinLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamMatchmaking_LeaveLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_InviteUserToLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDInvitee: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetNumLobbyMembers :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, iMember: s32) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *u8) -> *u8 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *u8, pchValue: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyDataCount :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, iLobbyData: s32, pchKey: *u8, cchKeyBufferSize: s32, pchValue: *u8, cchValueBufferSize: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_DeleteLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyMemberData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDUser: uint64_steamid, pchKey: *u8) -> *u8 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLobbyMemberData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *u8, pchValue: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SendLobbyChatMsg :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pvMsgBody: *void, cubMsgBody: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyChatEntry :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_RequestLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLobbyGameServer :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyGameServer :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, cMaxMembers: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> s32 #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLobbyType :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, eLobbyType: ELobbyType) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLobbyJoinable :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, bLobbyJoinable: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_GetLobbyOwner :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLobbyOwner :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDNewOwner: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmaking_SetLinkedLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDLobbyDependent: uint64_steamid) -> bool #foreign steam_api64;

// ISteamMatchmakingServerListResponse
SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded :: (self: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond :: (self: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete :: (self: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, response: EMatchMakingServerResponse) -> void #foreign steam_api64;

// ISteamMatchmakingPingResponse
SteamAPI_ISteamMatchmakingPingResponse_ServerResponded :: (self: *ISteamMatchmakingPingResponse, server: *gameserveritem_t) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond :: (self: *ISteamMatchmakingPingResponse) -> void #foreign steam_api64;

// ISteamMatchmakingPlayersResponse
SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList :: (self: *ISteamMatchmakingPlayersResponse, pchName: *u8, nScore: s32, flTimePlayed: float) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond :: (self: *ISteamMatchmakingPlayersResponse) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete :: (self: *ISteamMatchmakingPlayersResponse) -> void #foreign steam_api64;

// ISteamMatchmakingRulesResponse
SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded :: (self: *ISteamMatchmakingRulesResponse, pchRule: *u8, pchValue: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond :: (self: *ISteamMatchmakingRulesResponse) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete :: (self: *ISteamMatchmakingRulesResponse) -> void #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamMatchmakingServers_v002 :: () -> *ISteamMatchmakingServers #foreign steam_api64;

SteamAPI_ISteamMatchmakingServers_RequestInternetServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_RequestLANServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_ReleaseRequest :: (self: *ISteamMatchmakingServers, hServerListRequest: HServerListRequest) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_GetServerDetails :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_CancelQuery :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_RefreshQuery :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_IsRefreshing :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> bool #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_GetServerCount :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> s32 #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_RefreshServer :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) -> void #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_PingServer :: (self: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_PlayerDetails :: (self: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_ServerRules :: (self: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery #foreign steam_api64;
SteamAPI_ISteamMatchmakingServers_CancelServerQuery :: (self: *ISteamMatchmakingServers, hServerQuery: HServerQuery) -> void #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameSearch_v001 :: () -> *ISteamGameSearch #foreign steam_api64;

SteamAPI_ISteamGameSearch_AddGameSearchParams :: (self: *ISteamGameSearch, pchKeyToFind: *u8, pchValuesToFind: *u8) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_SearchForGameWithLobby :: (self: *ISteamGameSearch, steamIDLobby: uint64_steamid, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_SearchForGameSolo :: (self: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_AcceptGame :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_DeclineGame :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_RetrieveConnectionDetails :: (self: *ISteamGameSearch, steamIDHost: uint64_steamid, pchConnectionDetails: *u8, cubConnectionDetails: s32) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_EndGameSearch :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_SetGameHostParams :: (self: *ISteamGameSearch, pchKey: *u8, pchValue: *u8) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_SetConnectionDetails :: (self: *ISteamGameSearch, pchConnectionDetails: *u8, cubConnectionDetails: s32) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_RequestPlayersForGame :: (self: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32, nMaxTeamSize: s32) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_HostConfirmGameStart :: (self: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_CancelRequestPlayersForGame :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_SubmitPlayerResult :: (self: *ISteamGameSearch, ullUniqueGameID: uint64, steamIDPlayer: uint64_steamid, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t #foreign steam_api64;
SteamAPI_ISteamGameSearch_EndGame :: (self: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamParties_v002 :: () -> *ISteamParties #foreign steam_api64;

SteamAPI_ISteamParties_GetNumActiveBeacons :: (self: *ISteamParties) -> uint32 #foreign steam_api64;
SteamAPI_ISteamParties_GetBeaconByIndex :: (self: *ISteamParties, unIndex: uint32) -> PartyBeaconID_t #foreign steam_api64;
SteamAPI_ISteamParties_GetBeaconDetails :: (self: *ISteamParties, ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *u8, cchMetadata: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamParties_JoinParty :: (self: *ISteamParties, ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamParties_GetNumAvailableBeaconLocations :: (self: *ISteamParties, puNumLocations: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamParties_GetAvailableBeaconLocations :: (self: *ISteamParties, pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamParties_CreateBeacon :: (self: *ISteamParties, unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *u8, pchMetadata: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamParties_OnReservationCompleted :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamParties_CancelReservation :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamParties_ChangeNumOpenSlots :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamParties_DestroyBeacon :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t) -> bool #foreign steam_api64;
SteamAPI_ISteamParties_GetBeaconLocationData :: (self: *ISteamParties, BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *u8, cchDataStringOut: s32) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamRemoteStorage_v016 :: () -> *ISteamRemoteStorage #foreign steam_api64;

SteamAPI_ISteamRemoteStorage_FileWrite :: (self: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubData: int32) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileRead :: (self: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubDataToRead: int32) -> int32 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileWriteAsync :: (self: *ISteamRemoteStorage, pchFile: *u8, pvData: *void, cubData: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileReadAsync :: (self: *ISteamRemoteStorage, pchFile: *u8, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete :: (self: *ISteamRemoteStorage, hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileForget :: (self: *ISteamRemoteStorage, pchFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileDelete :: (self: *ISteamRemoteStorage, pchFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileShare :: (self: *ISteamRemoteStorage, pchFile: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_SetSyncPlatforms :: (self: *ISteamRemoteStorage, pchFile: *u8, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen :: (self: *ISteamRemoteStorage, pchFile: *u8) -> UGCFileWriteStreamHandle_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk :: (self: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileWriteStreamClose :: (self: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel :: (self: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FileExists :: (self: *ISteamRemoteStorage, pchFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_FilePersisted :: (self: *ISteamRemoteStorage, pchFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetFileSize :: (self: *ISteamRemoteStorage, pchFile: *u8) -> int32 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetFileTimestamp :: (self: *ISteamRemoteStorage, pchFile: *u8) -> int64 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetSyncPlatforms :: (self: *ISteamRemoteStorage, pchFile: *u8) -> ERemoteStoragePlatform #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetFileCount :: (self: *ISteamRemoteStorage) -> int32 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetFileNameAndSize :: (self: *ISteamRemoteStorage, iFile: s32, pnFileSizeInBytes: *int32) -> *u8 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetQuota :: (self: *ISteamRemoteStorage, pnTotalBytes: *uint64, puAvailableBytes: *uint64) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount :: (self: *ISteamRemoteStorage) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp :: (self: *ISteamRemoteStorage) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp :: (self: *ISteamRemoteStorage, bEnabled: bool) -> void #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UGCDownload :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetUGCDetails :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **u8, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UGCRead :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetCachedUGCCount :: (self: *ISteamRemoteStorage) -> int32 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle :: (self: *ISteamRemoteStorage, iCachedContent: int32) -> UGCHandle_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_PublishWorkshopFile :: (self: *ISteamRemoteStorage, pchFile: *u8, pchPreviewFile: *u8, nConsumerAppId: AppId_t, pchTitle: *u8, pchDescription: *u8, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchTitle: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchDescription: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_DeletePublishedFile :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles :: (self: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_SubscribePublishedFile :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles :: (self: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles :: (self: *ISteamRemoteStorage, steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_PublishVideo :: (self: *ISteamRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *u8, pchVideoIdentifier: *u8, pchPreviewFile: *u8, nConsumerAppId: AppId_t, pchTitle: *u8, pchDescription: *u8, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction :: (self: *ISteamRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles :: (self: *ISteamRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pchLocation: *u8, unPriority: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetLocalFileChangeCount :: (self: *ISteamRemoteStorage) -> int32 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_GetLocalFileChange :: (self: *ISteamRemoteStorage, iFile: s32, pEChangeType: *ERemoteStorageLocalFileChange, pEFilePathType: *ERemoteStorageFilePathType) -> *u8 #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch :: (self: *ISteamRemoteStorage) -> bool #foreign steam_api64;
SteamAPI_ISteamRemoteStorage_EndFileWriteBatch :: (self: *ISteamRemoteStorage) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamUserStats_v012 :: () -> *ISteamUserStats #foreign steam_api64;

SteamAPI_ISteamUserStats_RequestCurrentStats :: (self: *ISteamUserStats) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetStatInt32 :: (self: *ISteamUserStats, pchName: *u8, pData: *int32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetStatFloat :: (self: *ISteamUserStats, pchName: *u8, pData: *float) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_SetStatInt32 :: (self: *ISteamUserStats, pchName: *u8, nData: int32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_SetStatFloat :: (self: *ISteamUserStats, pchName: *u8, fData: float) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_UpdateAvgRateStat :: (self: *ISteamUserStats, pchName: *u8, flCountThisSession: float, dSessionLength: float64) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievement :: (self: *ISteamUserStats, pchName: *u8, pbAchieved: *bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_SetAchievement :: (self: *ISteamUserStats, pchName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_ClearAchievement :: (self: *ISteamUserStats, pchName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime :: (self: *ISteamUserStats, pchName: *u8, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_StoreStats :: (self: *ISteamUserStats) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievementIcon :: (self: *ISteamUserStats, pchName: *u8) -> s32 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute :: (self: *ISteamUserStats, pchName: *u8, pchKey: *u8) -> *u8 #foreign steam_api64;
SteamAPI_ISteamUserStats_IndicateAchievementProgress :: (self: *ISteamUserStats, pchName: *u8, nCurProgress: uint32, nMaxProgress: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetNumAchievements :: (self: *ISteamUserStats) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievementName :: (self: *ISteamUserStats, iAchievement: uint32) -> *u8 #foreign steam_api64;
SteamAPI_ISteamUserStats_RequestUserStats :: (self: *ISteamUserStats, steamIDUser: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_GetUserStatInt32 :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *u8, pData: *int32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetUserStatFloat :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *u8, pData: *float) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetUserAchievement :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *u8, pbAchieved: *bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *u8, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_ResetAllStats :: (self: *ISteamUserStats, bAchievementsToo: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_FindOrCreateLeaderboard :: (self: *ISteamUserStats, pchLeaderboardName: *u8, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_FindLeaderboard :: (self: *ISteamUserStats, pchLeaderboardName: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_GetLeaderboardName :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> *u8 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetLeaderboardEntryCount :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetLeaderboardSortMethod :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod #foreign steam_api64;
SteamAPI_ISteamUserStats_GetLeaderboardDisplayType :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType #foreign steam_api64;
SteamAPI_ISteamUserStats_DownloadLeaderboardEntries :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry :: (self: *ISteamUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_UploadLeaderboardScore :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_AttachLeaderboardUGC :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers :: (self: *ISteamUserStats) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages :: (self: *ISteamUserStats) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo :: (self: *ISteamUserStats, pchName: *u8, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo :: (self: *ISteamUserStats, iIteratorPrevious: s32, pchName: *u8, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievementAchievedPercent :: (self: *ISteamUserStats, pchName: *u8, pflPercent: *float) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_RequestGlobalStats :: (self: *ISteamUserStats, nHistoryDays: s32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUserStats_GetGlobalStatInt64 :: (self: *ISteamUserStats, pchStatName: *u8, pData: *int64) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetGlobalStatDouble :: (self: *ISteamUserStats, pchStatName: *u8, pData: *float64) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64 :: (self: *ISteamUserStats, pchStatName: *u8, pData: *int64, cubData: uint32) -> int32 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble :: (self: *ISteamUserStats, pchStatName: *u8, pData: *float64, cubData: uint32) -> int32 #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32 :: (self: *ISteamUserStats, pchName: *u8, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool #foreign steam_api64;
SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat :: (self: *ISteamUserStats, pchName: *u8, pfMinProgress: *float, pfMaxProgress: *float) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamApps_v008 :: () -> *ISteamApps #foreign steam_api64;

SteamAPI_ISteamApps_BIsSubscribed :: (self: *ISteamApps) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_BIsLowViolence :: (self: *ISteamApps) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_BIsCybercafe :: (self: *ISteamApps) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_BIsVACBanned :: (self: *ISteamApps) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_GetCurrentGameLanguage :: (self: *ISteamApps) -> *u8 #foreign steam_api64;
SteamAPI_ISteamApps_GetAvailableGameLanguages :: (self: *ISteamApps) -> *u8 #foreign steam_api64;
SteamAPI_ISteamApps_BIsSubscribedApp :: (self: *ISteamApps, appID: AppId_t) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_BIsDlcInstalled :: (self: *ISteamApps, appID: AppId_t) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime :: (self: *ISteamApps, nAppID: AppId_t) -> uint32 #foreign steam_api64;
SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend :: (self: *ISteamApps) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_GetDLCCount :: (self: *ISteamApps) -> s32 #foreign steam_api64;
SteamAPI_ISteamApps_BGetDLCDataByIndex :: (self: *ISteamApps, iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *u8, cchNameBufferSize: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_InstallDLC :: (self: *ISteamApps, nAppID: AppId_t) -> void #foreign steam_api64;
SteamAPI_ISteamApps_UninstallDLC :: (self: *ISteamApps, nAppID: AppId_t) -> void #foreign steam_api64;
SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey :: (self: *ISteamApps, nAppID: AppId_t) -> void #foreign steam_api64;
SteamAPI_ISteamApps_GetCurrentBetaName :: (self: *ISteamApps, pchName: *u8, cchNameBufferSize: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_MarkContentCorrupt :: (self: *ISteamApps, bMissingFilesOnly: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_GetInstalledDepots :: (self: *ISteamApps, appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamApps_GetAppInstallDir :: (self: *ISteamApps, appID: AppId_t, pchFolder: *u8, cchFolderBufferSize: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamApps_BIsAppInstalled :: (self: *ISteamApps, appID: AppId_t) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_GetAppOwner :: (self: *ISteamApps) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamApps_GetLaunchQueryParam :: (self: *ISteamApps, pchKey: *u8) -> *u8 #foreign steam_api64;
SteamAPI_ISteamApps_GetDlcDownloadProgress :: (self: *ISteamApps, nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_GetAppBuildId :: (self: *ISteamApps) -> s32 #foreign steam_api64;
SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys :: (self: *ISteamApps) -> void #foreign steam_api64;
SteamAPI_ISteamApps_GetFileDetails :: (self: *ISteamApps, pszFileName: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamApps_GetLaunchCommandLine :: (self: *ISteamApps, pszCommandLine: *u8, cubCommandLine: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing :: (self: *ISteamApps) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_BIsTimedTrial :: (self: *ISteamApps, punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_SetDlcContext :: (self: *ISteamApps, nAppID: AppId_t) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_GetNumBetas :: (self: *ISteamApps, unAppID: AppId_t, pnAvailable: *s32, pnPrivate: *s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamApps_GetBetaInfo :: (self: *ISteamApps, unAppID: AppId_t, iBetaIndex: s32, punFlags: *uint32, punBuildID: *uint32, pchBetaName: *u8, cchBetaName: s32, pchDescription: *u8, cchDescription: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamApps_SetActiveBeta :: (self: *ISteamApps, unAppID: AppId_t, pchBetaName: *u8) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamNetworking_v006 :: () -> *ISteamNetworking #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerNetworking_v006 :: () -> *ISteamNetworking #foreign steam_api64;

SteamAPI_ISteamNetworking_SendP2PPacket :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_IsP2PPacketAvailable :: (self: *ISteamNetworking, pcubMsgSize: *uint32, nChannel: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_ReadP2PPacket :: (self: *ISteamNetworking, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_CloseP2PSessionWithUser :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_CloseP2PChannelWithUser :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid, nChannel: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_GetP2PSessionState :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid, pConnectionState: *P2PSessionState_t) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_AllowP2PPacketRelay :: (self: *ISteamNetworking, bAllow: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_CreateListenSocket :: (self: *ISteamNetworking, nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t #foreign steam_api64;
SteamAPI_ISteamNetworking_CreateP2PConnectionSocket :: (self: *ISteamNetworking, steamIDTarget: uint64_steamid, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool) -> SNetSocket_t #foreign steam_api64;
SteamAPI_ISteamNetworking_CreateConnectionSocket :: (self: *ISteamNetworking, nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32) -> SNetSocket_t #foreign steam_api64;
SteamAPI_ISteamNetworking_DestroySocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_DestroyListenSocket :: (self: *ISteamNetworking, hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_SendDataOnSocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_IsDataAvailableOnSocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pcubMsgSize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_RetrieveDataFromSocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_IsDataAvailable :: (self: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_RetrieveData :: (self: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_GetSocketInfo :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_GetListenSocketInfo :: (self: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworking_GetSocketConnectionType :: (self: *ISteamNetworking, hSocket: SNetSocket_t) -> ESNetSocketConnectionType #foreign steam_api64;
SteamAPI_ISteamNetworking_GetMaxPacketSize :: (self: *ISteamNetworking, hSocket: SNetSocket_t) -> s32 #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamScreenshots_v003 :: () -> *ISteamScreenshots #foreign steam_api64;

SteamAPI_ISteamScreenshots_WriteScreenshot :: (self: *ISteamScreenshots, pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle #foreign steam_api64;
SteamAPI_ISteamScreenshots_AddScreenshotToLibrary :: (self: *ISteamScreenshots, pchFilename: *u8, pchThumbnailFilename: *u8, nWidth: s32, nHeight: s32) -> ScreenshotHandle #foreign steam_api64;
SteamAPI_ISteamScreenshots_TriggerScreenshot :: (self: *ISteamScreenshots) -> void #foreign steam_api64;
SteamAPI_ISteamScreenshots_HookScreenshots :: (self: *ISteamScreenshots, bHook: bool) -> void #foreign steam_api64;
SteamAPI_ISteamScreenshots_SetLocation :: (self: *ISteamScreenshots, hScreenshot: ScreenshotHandle, pchLocation: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamScreenshots_TagUser :: (self: *ISteamScreenshots, hScreenshot: ScreenshotHandle, steamID: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamScreenshots_TagPublishedFile :: (self: *ISteamScreenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool #foreign steam_api64;
SteamAPI_ISteamScreenshots_IsScreenshotsHooked :: (self: *ISteamScreenshots) -> bool #foreign steam_api64;
SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary :: (self: *ISteamScreenshots, eType: EVRScreenshotType, pchFilename: *u8, pchVRFilename: *u8) -> ScreenshotHandle #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamMusic_v001 :: () -> *ISteamMusic #foreign steam_api64;

SteamAPI_ISteamMusic_BIsEnabled :: (self: *ISteamMusic) -> bool #foreign steam_api64;
SteamAPI_ISteamMusic_BIsPlaying :: (self: *ISteamMusic) -> bool #foreign steam_api64;
SteamAPI_ISteamMusic_GetPlaybackStatus :: (self: *ISteamMusic) -> AudioPlayback_Status #foreign steam_api64;
SteamAPI_ISteamMusic_Play :: (self: *ISteamMusic) -> void #foreign steam_api64;
SteamAPI_ISteamMusic_Pause :: (self: *ISteamMusic) -> void #foreign steam_api64;
SteamAPI_ISteamMusic_PlayPrevious :: (self: *ISteamMusic) -> void #foreign steam_api64;
SteamAPI_ISteamMusic_PlayNext :: (self: *ISteamMusic) -> void #foreign steam_api64;
SteamAPI_ISteamMusic_SetVolume :: (self: *ISteamMusic, flVolume: float) -> void #foreign steam_api64;
SteamAPI_ISteamMusic_GetVolume :: (self: *ISteamMusic) -> float #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamMusicRemote_v001 :: () -> *ISteamMusicRemote #foreign steam_api64;

SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote :: (self: *ISteamMusicRemote, pchName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_BActivationSuccess :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_SetDisplayName :: (self: *ISteamMusicRemote, pchDisplayName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64 :: (self: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_EnablePlayPrevious :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_EnablePlayNext :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_EnableShuffled :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_EnableLooped :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_EnableQueue :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_EnablePlaylists :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus :: (self: *ISteamMusicRemote, nStatus: AudioPlayback_Status) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_UpdateShuffled :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_UpdateLooped :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_UpdateVolume :: (self: *ISteamMusicRemote, flValue: float) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_CurrentEntryWillChange :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable :: (self: *ISteamMusicRemote, bAvailable: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText :: (self: *ISteamMusicRemote, pchText: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds :: (self: *ISteamMusicRemote, nValue: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt :: (self: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_CurrentEntryDidChange :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_QueueWillChange :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_ResetQueueEntries :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_SetQueueEntry :: (self: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry :: (self: *ISteamMusicRemote, nID: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_QueueDidChange :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_PlaylistWillChange :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_ResetPlaylistEntries :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_SetPlaylistEntry :: (self: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry :: (self: *ISteamMusicRemote, nID: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamMusicRemote_PlaylistDidChange :: (self: *ISteamMusicRemote) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamHTTP_v003 :: () -> *ISteamHTTP #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerHTTP_v003 :: () -> *ISteamHTTP #foreign steam_api64;

SteamAPI_ISteamHTTP_CreateHTTPRequest :: (self: *ISteamHTTP, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *u8) -> HTTPRequestHandle #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestContextValue :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, pchHeaderValue: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchParamName: *u8, pchParamValue: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SendHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_DeferHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_PrioritizeHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, unResponseHeaderSize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *u8, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_GetHTTPResponseBodySize :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_GetHTTPResponseBodyData :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_ReleaseHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchContentType: *u8, pubBody: *uint8, unBodyLen: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_CreateCookieContainer :: (self: *ISteamHTTP, bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle #foreign steam_api64;
SteamAPI_ISteamHTTP_ReleaseCookieContainer :: (self: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetCookie :: (self: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle, pchHost: *u8, pchUrl: *u8, pchCookie: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchUserAgentInfo: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamInput_v006 :: () -> *ISteamInput #foreign steam_api64;

SteamAPI_ISteamInput_Init :: (self: *ISteamInput, bExplicitlyCallRunFrame: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamInput_Shutdown :: (self: *ISteamInput) -> bool #foreign steam_api64;
SteamAPI_ISteamInput_SetInputActionManifestFilePath :: (self: *ISteamInput, pchInputActionManifestAbsolutePath: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamInput_RunFrame :: (self: *ISteamInput, bReservedValue: bool) -> void #foreign steam_api64;
SteamAPI_ISteamInput_BWaitForData :: (self: *ISteamInput, bWaitForever: bool, unTimeout: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInput_BNewDataAvailable :: (self: *ISteamInput) -> bool #foreign steam_api64;
SteamAPI_ISteamInput_GetConnectedControllers :: (self: *ISteamInput, handlesOut: *InputHandle_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamInput_EnableDeviceCallbacks :: (self: *ISteamInput) -> void #foreign steam_api64;
SteamAPI_ISteamInput_EnableActionEventCallbacks :: (self: *ISteamInput, pCallback: SteamInputActionEventCallbackPointer) -> void #foreign steam_api64;
SteamAPI_ISteamInput_GetActionSetHandle :: (self: *ISteamInput, pszActionSetName: *u8) -> InputActionSetHandle_t #foreign steam_api64;
SteamAPI_ISteamInput_ActivateActionSet :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamInput_GetCurrentActionSet :: (self: *ISteamInput, inputHandle: InputHandle_t) -> InputActionSetHandle_t #foreign steam_api64;
SteamAPI_ISteamInput_ActivateActionSetLayer :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamInput_DeactivateActionSetLayer :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamInput_DeactivateAllActionSetLayers :: (self: *ISteamInput, inputHandle: InputHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamInput_GetActiveActionSetLayers :: (self: *ISteamInput, inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamInput_GetDigitalActionHandle :: (self: *ISteamInput, pszActionName: *u8) -> InputDigitalActionHandle_t #foreign steam_api64;
SteamAPI_ISteamInput_GetDigitalActionData :: (self: *ISteamInput, inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t #foreign steam_api64;
SteamAPI_ISteamInput_GetDigitalActionOrigins :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #foreign steam_api64;
SteamAPI_ISteamInput_GetStringForDigitalActionName :: (self: *ISteamInput, eActionHandle: InputDigitalActionHandle_t) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_GetAnalogActionHandle :: (self: *ISteamInput, pszActionName: *u8) -> InputAnalogActionHandle_t #foreign steam_api64;
SteamAPI_ISteamInput_GetAnalogActionData :: (self: *ISteamInput, inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t #foreign steam_api64;
SteamAPI_ISteamInput_GetAnalogActionOrigins :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #foreign steam_api64;
SteamAPI_ISteamInput_GetGlyphPNGForActionOrigin :: (self: *ISteamInput, eOrigin: EInputActionOrigin, eSize: ESteamInputGlyphSize, unFlags: uint32) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_GetGlyphSVGForActionOrigin :: (self: *ISteamInput, eOrigin: EInputActionOrigin, unFlags: uint32) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_GetGlyphForActionOrigin_Legacy :: (self: *ISteamInput, eOrigin: EInputActionOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_GetStringForActionOrigin :: (self: *ISteamInput, eOrigin: EInputActionOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_GetStringForAnalogActionName :: (self: *ISteamInput, eActionHandle: InputAnalogActionHandle_t) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_StopAnalogActionMomentum :: (self: *ISteamInput, inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamInput_GetMotionData :: (self: *ISteamInput, inputHandle: InputHandle_t) -> InputMotionData_t #foreign steam_api64;
SteamAPI_ISteamInput_TriggerVibration :: (self: *ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) -> void #foreign steam_api64;
SteamAPI_ISteamInput_TriggerVibrationExtended :: (self: *ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16, usLeftTriggerSpeed: u16, usRightTriggerSpeed: u16) -> void #foreign steam_api64;
SteamAPI_ISteamInput_TriggerSimpleHapticEvent :: (self: *ISteamInput, inputHandle: InputHandle_t, eHapticLocation: EControllerHapticLocation, nIntensity: uint8, nGainDB: u8, nOtherIntensity: uint8, nOtherGainDB: u8) -> void #foreign steam_api64;
SteamAPI_ISteamInput_SetLEDColor :: (self: *ISteamInput, inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) -> void #foreign steam_api64;
SteamAPI_ISteamInput_Legacy_TriggerHapticPulse :: (self: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) -> void #foreign steam_api64;
SteamAPI_ISteamInput_Legacy_TriggerRepeatedHapticPulse :: (self: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) -> void #foreign steam_api64;
SteamAPI_ISteamInput_ShowBindingPanel :: (self: *ISteamInput, inputHandle: InputHandle_t) -> bool #foreign steam_api64;
SteamAPI_ISteamInput_GetInputTypeForHandle :: (self: *ISteamInput, inputHandle: InputHandle_t) -> ESteamInputType #foreign steam_api64;
SteamAPI_ISteamInput_GetControllerForGamepadIndex :: (self: *ISteamInput, nIndex: s32) -> InputHandle_t #foreign steam_api64;
SteamAPI_ISteamInput_GetGamepadIndexForController :: (self: *ISteamInput, ulinputHandle: InputHandle_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamInput_GetStringForXboxOrigin :: (self: *ISteamInput, eOrigin: EXboxOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_GetGlyphForXboxOrigin :: (self: *ISteamInput, eOrigin: EXboxOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin :: (self: *ISteamInput, inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin #foreign steam_api64;
SteamAPI_ISteamInput_TranslateActionOrigin :: (self: *ISteamInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin #foreign steam_api64;
SteamAPI_ISteamInput_GetDeviceBindingRevision :: (self: *ISteamInput, inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool #foreign steam_api64;
SteamAPI_ISteamInput_GetRemotePlaySessionID :: (self: *ISteamInput, inputHandle: InputHandle_t) -> uint32 #foreign steam_api64;
SteamAPI_ISteamInput_GetSessionInputConfigurationSettings :: (self: *ISteamInput) -> uint16 #foreign steam_api64;
SteamAPI_ISteamInput_SetDualSenseTriggerEffect :: (self: *ISteamInput, inputHandle: InputHandle_t, pParam: *ScePadTriggerEffectParam) -> void #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamController_v008 :: () -> *ISteamController #foreign steam_api64;

SteamAPI_ISteamController_Init :: (self: *ISteamController) -> bool #foreign steam_api64;
SteamAPI_ISteamController_Shutdown :: (self: *ISteamController) -> bool #foreign steam_api64;
SteamAPI_ISteamController_RunFrame :: (self: *ISteamController) -> void #foreign steam_api64;
SteamAPI_ISteamController_GetConnectedControllers :: (self: *ISteamController, handlesOut: *ControllerHandle_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamController_GetActionSetHandle :: (self: *ISteamController, pszActionSetName: *u8) -> ControllerActionSetHandle_t #foreign steam_api64;
SteamAPI_ISteamController_ActivateActionSet :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamController_GetCurrentActionSet :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t #foreign steam_api64;
SteamAPI_ISteamController_ActivateActionSetLayer :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamController_DeactivateActionSetLayer :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamController_DeactivateAllActionSetLayers :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamController_GetActiveActionSetLayers :: (self: *ISteamController, controllerHandle: ControllerHandle_t, handlesOut: *ControllerActionSetHandle_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamController_GetDigitalActionHandle :: (self: *ISteamController, pszActionName: *u8) -> ControllerDigitalActionHandle_t #foreign steam_api64;
SteamAPI_ISteamController_GetDigitalActionData :: (self: *ISteamController, controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t #foreign steam_api64;
SteamAPI_ISteamController_GetDigitalActionOrigins :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 #foreign steam_api64;
SteamAPI_ISteamController_GetAnalogActionHandle :: (self: *ISteamController, pszActionName: *u8) -> ControllerAnalogActionHandle_t #foreign steam_api64;
SteamAPI_ISteamController_GetAnalogActionData :: (self: *ISteamController, controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t #foreign steam_api64;
SteamAPI_ISteamController_GetAnalogActionOrigins :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 #foreign steam_api64;
SteamAPI_ISteamController_GetGlyphForActionOrigin :: (self: *ISteamController, eOrigin: EControllerActionOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamController_GetStringForActionOrigin :: (self: *ISteamController, eOrigin: EControllerActionOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamController_StopAnalogActionMomentum :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) -> void #foreign steam_api64;
SteamAPI_ISteamController_GetMotionData :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> InputMotionData_t #foreign steam_api64;
SteamAPI_ISteamController_TriggerHapticPulse :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) -> void #foreign steam_api64;
SteamAPI_ISteamController_TriggerRepeatedHapticPulse :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) -> void #foreign steam_api64;
SteamAPI_ISteamController_TriggerVibration :: (self: *ISteamController, controllerHandle: ControllerHandle_t, usLeftSpeed: u16, usRightSpeed: u16) -> void #foreign steam_api64;
SteamAPI_ISteamController_SetLEDColor :: (self: *ISteamController, controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) -> void #foreign steam_api64;
SteamAPI_ISteamController_ShowBindingPanel :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> bool #foreign steam_api64;
SteamAPI_ISteamController_GetInputTypeForHandle :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> ESteamInputType #foreign steam_api64;
SteamAPI_ISteamController_GetControllerForGamepadIndex :: (self: *ISteamController, nIndex: s32) -> ControllerHandle_t #foreign steam_api64;
SteamAPI_ISteamController_GetGamepadIndexForController :: (self: *ISteamController, ulControllerHandle: ControllerHandle_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamController_GetStringForXboxOrigin :: (self: *ISteamController, eOrigin: EXboxOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamController_GetGlyphForXboxOrigin :: (self: *ISteamController, eOrigin: EXboxOrigin) -> *u8 #foreign steam_api64;
SteamAPI_ISteamController_GetActionOriginFromXboxOrigin :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin #foreign steam_api64;
SteamAPI_ISteamController_TranslateActionOrigin :: (self: *ISteamController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin #foreign steam_api64;
SteamAPI_ISteamController_GetControllerBindingRevision :: (self: *ISteamController, controllerHandle: ControllerHandle_t, pMajor: *s32, pMinor: *s32) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamUGC_v020 :: () -> *ISteamUGC #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerUGC_v020 :: () -> *ISteamUGC #foreign steam_api64;

SteamAPI_ISteamUGC_CreateQueryUserUGCRequest :: (self: *ISteamUGC, unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #foreign steam_api64;
SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage :: (self: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #foreign steam_api64;
SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor :: (self: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *u8) -> UGCQueryHandle_t #foreign steam_api64;
SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t #foreign steam_api64;
SteamAPI_ISteamUGC_SendQueryUGCRequest :: (self: *ISteamUGC, handle: UGCQueryHandle_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCResult :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCNumTags :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *u8, cchValueSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCTagDisplayName :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *u8, cchValueSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCPreviewURL :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchURL: *u8, cchURLSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCMetadata :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchMetadata: *u8, cchMetadatasize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCChildren :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCStatistic :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *u8, cchURLSize: uint32, pchOriginalFileName: *u8, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *u8, cchKeySize: uint32, pchValue: *u8, cchValueSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchKey: *u8, pchValue: *u8, cchValueSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetNumSupportedGameVersions :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_GetSupportedGameVersionData :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, versionIndex: uint32, pchGameBranchMin: *u8, pchGameBranchMax: *u8, cchGameBranchSize: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetQueryUGCContentDescriptors :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecDescriptors: *EUGCContentDescriptorID, cMaxEntries: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_ReleaseQueryUGCRequest :: (self: *ISteamUGC, handle: UGCQueryHandle_t) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddRequiredTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddRequiredTagGroup :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddExcludedTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnOnlyIDs :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnKeyValueTags :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnLongDescription :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnMetadata :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnChildren :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnAdditionalPreviews :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnTotalOnly :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetReturnPlaytimeStats :: (self: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetLanguage :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pchLanguage: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetAllowCachedResponse :: (self: *ISteamUGC, handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetAdminQuery :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, bAdminQuery: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetCloudFileNameFilter :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pMatchCloudFileName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetMatchAnyTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetSearchText :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pSearchText: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetRankedByTrendDays :: (self: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetTimeCreatedDateRange :: (self: *ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetTimeUpdatedDateRange :: (self: *ISteamUGC, handle: UGCQueryHandle_t, rtStart: RTime32, rtEnd: RTime32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddRequiredKeyValueTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pKey: *u8, pValue: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_RequestUGCDetails :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_CreateItem :: (self: *ISteamUGC, nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_StartItemUpdate :: (self: *ISteamUGC, nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemTitle :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchTitle: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemDescription :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchDescription: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemUpdateLanguage :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchLanguage: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemMetadata :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchMetaData: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemVisibility :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemTags :: (self: *ISteamUGC, updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t, bAllowAdminTags: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemContent :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszContentFolder: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetItemPreview :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetAllowLegacyUpload :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags :: (self: *ISteamUGC, handle: UGCUpdateHandle_t) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_RemoveItemKeyValueTags :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddItemKeyValueTag :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *u8, pchValue: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddItemPreviewFile :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *u8, type: EItemPreviewType) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddItemPreviewVideo :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszVideoID: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_UpdateItemPreviewFile :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_UpdateItemPreviewVideo :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_RemoveItemPreview :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_AddContentDescriptor :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, descid: EUGCContentDescriptorID) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_RemoveContentDescriptor :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, descid: EUGCContentDescriptorID) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SetRequiredGameVersions :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszGameBranchMin: *u8, pszGameBranchMax: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SubmitItemUpdate :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchChangeNote: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_GetItemUpdateProgress :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus #foreign steam_api64;
SteamAPI_ISteamUGC_SetUserItemVote :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_GetUserItemVote :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_AddItemToFavorites :: (self: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_RemoveItemFromFavorites :: (self: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_SubscribeItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_UnsubscribeItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_GetNumSubscribedItems :: (self: *ISteamUGC) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_GetSubscribedItems :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_GetItemState :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> uint32 #foreign steam_api64;
SteamAPI_ISteamUGC_GetItemInstallInfo :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *u8, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetItemDownloadInfo :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_DownloadItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_BInitWorkshopForGameServer :: (self: *ISteamUGC, unWorkshopDepotID: DepotId_t, pszFolder: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_SuspendDownloads :: (self: *ISteamUGC, bSuspend: bool) -> void #foreign steam_api64;
SteamAPI_ISteamUGC_StartPlaytimeTracking :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_StopPlaytimeTracking :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems :: (self: *ISteamUGC) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_AddDependency :: (self: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_RemoveDependency :: (self: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_AddAppDependency :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_RemoveAppDependency :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_GetAppDependencies :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_DeleteItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_ShowWorkshopEULA :: (self: *ISteamUGC) -> bool #foreign steam_api64;
SteamAPI_ISteamUGC_GetWorkshopEULAStatus :: (self: *ISteamUGC) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamUGC_GetUserContentDescriptorPreferences :: (self: *ISteamUGC, pvecDescriptors: *EUGCContentDescriptorID, cMaxEntries: uint32) -> uint32 #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamHTMLSurface_v005 :: () -> *ISteamHTMLSurface #foreign steam_api64;

SteamAPI_ISteamHTMLSurface_Init :: (self: *ISteamHTMLSurface) -> bool #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_Shutdown :: (self: *ISteamHTMLSurface) -> bool #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_CreateBrowser :: (self: *ISteamHTMLSurface, pchUserAgent: *u8, pchUserCSS: *u8) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_RemoveBrowser :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_LoadURL :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchURL: *u8, pchPostData: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetSize :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_StopLoad :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_Reload :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_GoBack :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_GoForward :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_AddHeader :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchKey: *u8, pchValue: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_ExecuteJavascript :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchScript: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_MouseUp :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_MouseDown :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_MouseDoubleClick :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: ISteamHTMLSurface.EHTMLMouseButton) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_MouseMove :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_MouseWheel :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nDelta: int32) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_KeyDown :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers, bIsSystemKey: bool) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_KeyUp :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_KeyChar :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: ISteamHTMLSurface.EHTMLKeyModifiers) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetHorizontalScroll :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetVerticalScroll :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetKeyFocus :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_ViewSource :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_CopyToClipboard :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_PasteFromClipboard :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_Find :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: *u8, bCurrentlyInFind: bool, bReverse: bool) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_StopFind :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_GetLinkAtPosition :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetCookie :: (self: *ISteamHTMLSurface, pchHostname: *u8, pchKey: *u8, pchValue: *u8, pchPath: *u8, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetPageScaleFactor :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetBackgroundMode :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: float) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_OpenDeveloperTools :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_AllowStartRequest :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_JSDialogResponse :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bResult: bool) -> void #foreign steam_api64;
SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **u8) -> void #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamInventory_v003 :: () -> *ISteamInventory #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerInventory_v003 :: () -> *ISteamInventory #foreign steam_api64;

SteamAPI_ISteamInventory_GetResultStatus :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> EResult #foreign steam_api64;
SteamAPI_ISteamInventory_GetResultItems :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GetResultItemProperty :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *u8, pchValueBuffer: *u8, punValueBufferSizeOut: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GetResultTimestamp :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> uint32 #foreign steam_api64;
SteamAPI_ISteamInventory_CheckResultSteamID :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, steamIDExpected: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_DestroyResult :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> void #foreign steam_api64;
SteamAPI_ISteamInventory_GetAllItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GetItemsByID :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_SerializeResult :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_DeserializeResult :: (self: *ISteamInventory, pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GenerateItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GrantPromoItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_AddPromoItem :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_AddPromoItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_ConsumeItem :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_ExchangeItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_TransferItemQuantity :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_SendItemDropHeartbeat :: (self: *ISteamInventory) -> void #foreign steam_api64;
SteamAPI_ISteamInventory_TriggerItemDrop :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_TradeItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: uint64_steamid, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_LoadItemDefinitions :: (self: *ISteamInventory) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GetItemDefinitionIDs :: (self: *ISteamInventory, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GetItemDefinitionProperty :: (self: *ISteamInventory, iDefinition: SteamItemDef_t, pchPropertyName: *u8, pchValueBuffer: *u8, punValueBufferSizeOut: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs :: (self: *ISteamInventory, steamID: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs :: (self: *ISteamInventory, steamID: uint64_steamid, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_StartPurchase :: (self: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamInventory_RequestPrices :: (self: *ISteamInventory) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamInventory_GetNumItemsWithPrices :: (self: *ISteamInventory) -> uint32 #foreign steam_api64;
SteamAPI_ISteamInventory_GetItemsWithPrices :: (self: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_GetItemPrice :: (self: *ISteamInventory, iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_StartUpdateProperties :: (self: *ISteamInventory) -> SteamInventoryUpdateHandle_t #foreign steam_api64;
SteamAPI_ISteamInventory_RemoveProperty :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_SetPropertyString :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8, pchPropertyValue: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_SetPropertyBool :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8, bValue: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_SetPropertyInt64 :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8, nValue: int64) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_SetPropertyFloat :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *u8, flValue: float) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_SubmitUpdateProperties :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam_api64;
SteamAPI_ISteamInventory_InspectItem :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pchItemToken: *u8) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamTimeline_v001 :: () -> *ISteamTimeline #foreign steam_api64;

SteamAPI_ISteamTimeline_SetTimelineStateDescription :: (self: *ISteamTimeline, pchDescription: *u8, flTimeDelta: float) -> void #foreign steam_api64;
SteamAPI_ISteamTimeline_ClearTimelineStateDescription :: (self: *ISteamTimeline, flTimeDelta: float) -> void #foreign steam_api64;
SteamAPI_ISteamTimeline_AddTimelineEvent :: (self: *ISteamTimeline, pchIcon: *u8, pchTitle: *u8, pchDescription: *u8, unPriority: uint32, flStartOffsetSeconds: float, flDurationSeconds: float, ePossibleClip: ETimelineEventClipPriority) -> void #foreign steam_api64;
SteamAPI_ISteamTimeline_SetTimelineGameMode :: (self: *ISteamTimeline, eMode: ETimelineGameMode) -> void #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamVideo_v007 :: () -> *ISteamVideo #foreign steam_api64;

SteamAPI_ISteamVideo_GetVideoURL :: (self: *ISteamVideo, unVideoAppID: AppId_t) -> void #foreign steam_api64;
SteamAPI_ISteamVideo_IsBroadcasting :: (self: *ISteamVideo, pnNumViewers: *s32) -> bool #foreign steam_api64;
SteamAPI_ISteamVideo_GetOPFSettings :: (self: *ISteamVideo, unVideoAppID: AppId_t) -> void #foreign steam_api64;
SteamAPI_ISteamVideo_GetOPFStringForApp :: (self: *ISteamVideo, unVideoAppID: AppId_t, pchBuffer: *u8, pnBufferSize: *int32) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamParentalSettings_v001 :: () -> *ISteamParentalSettings #foreign steam_api64;

SteamAPI_ISteamParentalSettings_BIsParentalLockEnabled :: (self: *ISteamParentalSettings) -> bool #foreign steam_api64;
SteamAPI_ISteamParentalSettings_BIsParentalLockLocked :: (self: *ISteamParentalSettings) -> bool #foreign steam_api64;
SteamAPI_ISteamParentalSettings_BIsAppBlocked :: (self: *ISteamParentalSettings, nAppID: AppId_t) -> bool #foreign steam_api64;
SteamAPI_ISteamParentalSettings_BIsAppInBlockList :: (self: *ISteamParentalSettings, nAppID: AppId_t) -> bool #foreign steam_api64;
SteamAPI_ISteamParentalSettings_BIsFeatureBlocked :: (self: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool #foreign steam_api64;
SteamAPI_ISteamParentalSettings_BIsFeatureInBlockList :: (self: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamRemotePlay_v002 :: () -> *ISteamRemotePlay #foreign steam_api64;

SteamAPI_ISteamRemotePlay_GetSessionCount :: (self: *ISteamRemotePlay) -> uint32 #foreign steam_api64;
SteamAPI_ISteamRemotePlay_GetSessionID :: (self: *ISteamRemotePlay, iSessionIndex: s32) -> RemotePlaySessionID_t #foreign steam_api64;
SteamAPI_ISteamRemotePlay_GetSessionSteamID :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamRemotePlay_GetSessionClientName :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> *u8 #foreign steam_api64;
SteamAPI_ISteamRemotePlay_GetSessionClientFormFactor :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor #foreign steam_api64;
SteamAPI_ISteamRemotePlay_BGetSessionClientResolution :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t, pnResolutionX: *s32, pnResolutionY: *s32) -> bool #foreign steam_api64;
SteamAPI_ISteamRemotePlay_BStartRemotePlayTogether :: (self: *ISteamRemotePlay, bShowOverlay: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamRemotePlay_BSendRemotePlayTogetherInvite :: (self: *ISteamRemotePlay, steamIDFriend: uint64_steamid) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamNetworkingMessages_SteamAPI_v002 :: () -> *ISteamNetworkingMessages #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerNetworkingMessages_SteamAPI_v002 :: () -> *ISteamNetworkingMessages #foreign steam_api64;

SteamAPI_ISteamNetworkingMessages_SendMessageToUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingMessages_SendMessageToUser :: (self: *ISteamNetworkingMessages, identityRemote: SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult #no_context {
    return SteamAPI_ISteamNetworkingMessages_SendMessageToUser(self, *identityRemote, pubData, cubData, nSendFlags, nRemoteChannel);
}
SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel :: (self: *ISteamNetworkingMessages, nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser :: (self: *ISteamNetworkingMessages, identityRemote: SteamNetworkingIdentity) -> bool #no_context {
    return SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser(self, *identityRemote);
}
SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser :: (self: *ISteamNetworkingMessages, identityRemote: SteamNetworkingIdentity) -> bool #no_context {
    return SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser(self, *identityRemote);
}
SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser :: (self: *ISteamNetworkingMessages, identityRemote: SteamNetworkingIdentity, nLocalChannel: s32) -> bool #no_context {
    return SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser(self, *identityRemote, nLocalChannel);
}
SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetConnectionRealTimeStatus_t) -> ESteamNetworkingConnectionState #foreign steam_api64;
SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo :: (self: *ISteamNetworkingMessages, identityRemote: SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetConnectionRealTimeStatus_t) -> ESteamNetworkingConnectionState #no_context {
    return SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo(self, *identityRemote, pConnectionInfo, pQuickStatus);
}

// A versioned accessor is exported by the library
SteamAPI_SteamNetworkingSockets_SteamAPI_v012 :: () -> *ISteamNetworkingSockets #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerNetworkingSockets_SteamAPI_v012 :: () -> *ISteamNetworkingSockets #foreign steam_api64;

SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP :: (self: *ISteamNetworkingSockets, localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP :: (self: *ISteamNetworkingSockets, localAddress: SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #no_context {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(self, *localAddress, nOptions, pOptions);
}
SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress :: (self: *ISteamNetworkingSockets, address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress :: (self: *ISteamNetworkingSockets, address: SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #no_context {
    return SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(self, *address, nOptions, pOptions);
}
SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P :: (self: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ConnectP2P :: (self: *ISteamNetworkingSockets, identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ConnectP2P :: (self: *ISteamNetworkingSockets, identityRemote: SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #no_context {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2P(self, *identityRemote, nRemoteVirtualPort, nOptions, pOptions);
}
SteamAPI_ISteamNetworkingSockets_AcceptConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CloseConnection :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nReason: s32, pszDebug: *u8, bEnableLinger: bool) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CloseListenSocket :: (self: *ISteamNetworkingSockets, hSocket: HSteamListenSocket) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_SetConnectionUserData :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nUserData: int64) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetConnectionUserData :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection) -> int64 #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_SetConnectionName :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetConnectionName :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *u8, nMaxLen: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_SendMessageToConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_SendMessages :: (self: *ISteamNetworkingSockets, nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetConnectionInfo :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetConnectionRealTimeStatus :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pStatus: *SteamNetConnectionRealTimeStatus_t, nLanes: s32, pLanes: *SteamNetConnectionRealTimeLaneStatus_t) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pszBuf: *u8, cbBuf: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress :: (self: *ISteamNetworkingSockets, hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CreateSocketPair :: (self: *ISteamNetworkingSockets, pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ConfigureConnectionLanes :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, nNumLanes: s32, pLanePriorities: *s32, pLaneWeights: *uint16) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetIdentity :: (self: *ISteamNetworkingSockets, pIdentity: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_InitAuthentication :: (self: *ISteamNetworkingSockets) -> ESteamNetworkingAvailability #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus :: (self: *ISteamNetworkingSockets, pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CreatePollGroup :: (self: *ISteamNetworkingSockets) -> HSteamNetPollGroup #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_DestroyPollGroup :: (self: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup :: (self: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket :: (self: *ISteamNetworkingSockets, pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer :: (self: *ISteamNetworkingSockets, identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer :: (self: *ISteamNetworkingSockets, identityGameServer: SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 #no_context {
    return SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer(self, *identityGameServer, nRemoteVirtualPort, pOutParsedTicket);
}
SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer :: (self: *ISteamNetworkingSockets, identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer :: (self: *ISteamNetworkingSockets, identityTarget: SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #no_context {
    return SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(self, *identityTarget, nRemoteVirtualPort, nOptions, pOptions);
}
SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort :: (self: *ISteamNetworkingSockets) -> uint16 #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID :: (self: *ISteamNetworkingSockets) -> SteamNetworkingPOPID #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress :: (self: *ISteamNetworkingSockets, pRouting: *SteamDatagramHostedAddress) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket :: (self: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin :: (self: *ISteamNetworkingSockets, pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling :: (self: *ISteamNetworkingSockets, pSignaling: *ISteamNetworkingConnectionSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal :: (self: *ISteamNetworkingSockets, pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingSignalingRecvContext) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetCertificateRequest :: (self: *ISteamNetworkingSockets, pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_SetCertificate :: (self: *ISteamNetworkingSockets, pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_ResetIdentity :: (self: *ISteamNetworkingSockets, pIdentity: *SteamNetworkingIdentity) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_RunCallbacks :: (self: *ISteamNetworkingSockets) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_BeginAsyncRequestFakeIP :: (self: *ISteamNetworkingSockets, nNumPorts: s32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetFakeIP :: (self: *ISteamNetworkingSockets, idxFirstPort: s32, pInfo: *SteamNetworkingFakeIPResult_t) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2PFakeIP :: (self: *ISteamNetworkingSockets, idxFakePort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_GetRemoteFakeIPForConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pOutAddr: *SteamNetworkingIPAddr) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingSockets_CreateFakeUDPPort :: (self: *ISteamNetworkingSockets, idxFakeServerPort: s32) -> *ISteamNetworkingFakeUDPPort #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamNetworkingUtils_SteamAPI_v004 :: () -> *ISteamNetworkingUtils #foreign steam_api64;

SteamAPI_ISteamNetworkingUtils_AllocateMessage :: (self: *ISteamNetworkingUtils, cbAllocateBuffer: s32) -> *SteamNetworkingMessage_t #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess :: (self: *ISteamNetworkingUtils) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus :: (self: *ISteamNetworkingUtils, pDetails: *SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation :: (self: *ISteamNetworkingUtils, result: *SteamNetworkPingLocation_t) -> float #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations :: (self: *ISteamNetworkingUtils, location1: *SteamNetworkPingLocation_t, location2: *SteamNetworkPingLocation_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations :: (self: *ISteamNetworkingUtils, location1: SteamNetworkPingLocation_t, location2: SteamNetworkPingLocation_t) -> s32 #no_context {
    return SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations(self, *location1, *location2);
}
SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost :: (self: *ISteamNetworkingUtils, remoteLocation: *SteamNetworkPingLocation_t) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost :: (self: *ISteamNetworkingUtils, remoteLocation: SteamNetworkPingLocation_t) -> s32 #no_context {
    return SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost(self, *remoteLocation);
}
SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString :: (self: *ISteamNetworkingUtils, location: *SteamNetworkPingLocation_t, pszBuf: *u8, cchBufSize: s32) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString :: (self: *ISteamNetworkingUtils, location: SteamNetworkPingLocation_t, pszBuf: *u8, cchBufSize: s32) #no_context {
    SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString(self, *location, pszBuf, cchBufSize);
}
SteamAPI_ISteamNetworkingUtils_ParsePingLocationString :: (self: *ISteamNetworkingUtils, pszString: *u8, result: *SteamNetworkPingLocation_t) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate :: (self: *ISteamNetworkingUtils, flMaxAgeSeconds: float) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter :: (self: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID, pViaRelayPoP: *SteamNetworkingPOPID) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP :: (self: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetPOPCount :: (self: *ISteamNetworkingUtils) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetPOPList :: (self: *ISteamNetworkingUtils, list: *SteamNetworkingPOPID, nListSz: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetLocalTimestamp :: (self: *ISteamNetworkingUtils) -> SteamNetworkingMicroseconds #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction :: (self: *ISteamNetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_IsFakeIPv4 :: (self: *ISteamNetworkingUtils, nIPv4: uint32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetIPv4FakeIPType :: (self: *ISteamNetworkingUtils, nIPv4: uint32) -> ESteamNetworkingFakeIPType #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetRealIdentityForFakeIP :: (self: *ISteamNetworkingUtils, fakeIP: *SteamNetworkingIPAddr, pOutRealIdentity: *SteamNetworkingIdentity) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetRealIdentityForFakeIP :: (self: *ISteamNetworkingUtils, fakeIP: SteamNetworkingIPAddr, pOutRealIdentity: *SteamNetworkingIdentity) -> EResult #no_context {
    return SteamAPI_ISteamNetworkingUtils_GetRealIdentityForFakeIP(self, *fakeIP, pOutRealIdentity);
}
SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32 :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: int32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: float) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: *void) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32 :: (self: *ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: int32) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat :: (self: *ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: float) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString :: (self: *ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetConnectionStatusChanged) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamRelayNetworkStatusChanged) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_FakeIPResult :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetworkingFakeIPResult) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetConfigValue :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64, eDataType: ESteamNetworkingConfigDataType, pArg: *void) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct :: (self: *ISteamNetworkingUtils, opt: *SteamNetworkingConfigValue_t, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct :: (self: *ISteamNetworkingUtils, opt: SteamNetworkingConfigValue_t, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64) -> bool #no_context {
    return SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct(self, *opt, eScopeType, scopeObj);
}
SteamAPI_ISteamNetworkingUtils_GetConfigValue :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: s64, pOutDataType: *ESteamNetworkingConfigDataType, pResult: *void, cbResult: *u64) -> ESteamNetworkingGetConfigValueResult #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, pOutDataType: *ESteamNetworkingConfigDataType, pOutScope: *ESteamNetworkingConfigScope) -> *u8 #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_IterateGenericEditableConfigValues :: (self: *ISteamNetworkingUtils, eCurrent: ESteamNetworkingConfigValue, bEnumerateDevVars: bool) -> ESteamNetworkingConfigValue #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString :: (self: *ISteamNetworkingUtils, addr: *SteamNetworkingIPAddr, buf: *u8, cbBuf: uint32, bWithPort: bool) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString :: (self: *ISteamNetworkingUtils, addr: SteamNetworkingIPAddr, buf: *u8, cbBuf: uint32, bWithPort: bool) #no_context {
    SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString(self, *addr, buf, cbBuf, bWithPort);
}
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString :: (self: *ISteamNetworkingUtils, pAddr: *SteamNetworkingIPAddr, pszStr: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType :: (self: *ISteamNetworkingUtils, addr: *SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType :: (self: *ISteamNetworkingUtils, addr: SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType #no_context {
    return SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType(self, *addr);
}
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString :: (self: *ISteamNetworkingUtils, identity: *SteamNetworkingIdentity, buf: *u8, cbBuf: uint32) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString :: (self: *ISteamNetworkingUtils, identity: SteamNetworkingIdentity, buf: *u8, cbBuf: uint32) #no_context {
    SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString(self, *identity, buf, cbBuf);
}
SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString :: (self: *ISteamNetworkingUtils, pIdentity: *SteamNetworkingIdentity, pszStr: *u8) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServer_v015 :: () -> *ISteamGameServer #foreign steam_api64;

SteamAPI_ISteamGameServer_SetProduct :: (self: *ISteamGameServer, pszProduct: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetGameDescription :: (self: *ISteamGameServer, pszGameDescription: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetModDir :: (self: *ISteamGameServer, pszModDir: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetDedicatedServer :: (self: *ISteamGameServer, bDedicated: bool) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_LogOn :: (self: *ISteamGameServer, pszToken: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_LogOnAnonymous :: (self: *ISteamGameServer) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_LogOff :: (self: *ISteamGameServer) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_BLoggedOn :: (self: *ISteamGameServer) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServer_BSecure :: (self: *ISteamGameServer) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServer_GetSteamID :: (self: *ISteamGameServer) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamGameServer_WasRestartRequested :: (self: *ISteamGameServer) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServer_SetMaxPlayerCount :: (self: *ISteamGameServer, cPlayersMax: s32) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetBotPlayerCount :: (self: *ISteamGameServer, cBotplayers: s32) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetServerName :: (self: *ISteamGameServer, pszServerName: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetMapName :: (self: *ISteamGameServer, pszMapName: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetPasswordProtected :: (self: *ISteamGameServer, bPasswordProtected: bool) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetSpectatorPort :: (self: *ISteamGameServer, unSpectatorPort: uint16) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetSpectatorServerName :: (self: *ISteamGameServer, pszSpectatorServerName: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_ClearAllKeyValues :: (self: *ISteamGameServer) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetKeyValue :: (self: *ISteamGameServer, pKey: *u8, pValue: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetGameTags :: (self: *ISteamGameServer, pchGameTags: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetGameData :: (self: *ISteamGameServer, pchGameData: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetRegion :: (self: *ISteamGameServer, pszRegion: *u8) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_SetAdvertiseServerActive :: (self: *ISteamGameServer, bActive: bool) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_GetAuthSessionTicket :: (self: *ISteamGameServer, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32, pSnid: *SteamNetworkingIdentity) -> HAuthTicket #foreign steam_api64;
SteamAPI_ISteamGameServer_BeginAuthSession :: (self: *ISteamGameServer, pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult #foreign steam_api64;
SteamAPI_ISteamGameServer_EndAuthSession :: (self: *ISteamGameServer, steamID: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_CancelAuthTicket :: (self: *ISteamGameServer, hAuthTicket: HAuthTicket) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_UserHasLicenseForApp :: (self: *ISteamGameServer, steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult #foreign steam_api64;
SteamAPI_ISteamGameServer_RequestUserGroupStatus :: (self: *ISteamGameServer, steamIDUser: uint64_steamid, steamIDGroup: uint64_steamid) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServer_GetGameplayStats :: (self: *ISteamGameServer) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_GetServerReputation :: (self: *ISteamGameServer) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamGameServer_GetPublicIP :: (self: *ISteamGameServer) -> SteamIPAddress_t #foreign steam_api64;
SteamAPI_ISteamGameServer_HandleIncomingPacket :: (self: *ISteamGameServer, pData: *void, cbData: s32, srcIP: uint32, srcPort: uint16) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServer_GetNextOutgoingPacket :: (self: *ISteamGameServer, pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16) -> s32 #foreign steam_api64;
SteamAPI_ISteamGameServer_AssociateWithClan :: (self: *ISteamGameServer, steamIDClan: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility :: (self: *ISteamGameServer, steamIDNewPlayer: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate_DEPRECATED :: (self: *ISteamGameServer, unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection :: (self: *ISteamGameServer) -> uint64_steamid #foreign steam_api64;
SteamAPI_ISteamGameServer_SendUserDisconnect_DEPRECATED :: (self: *ISteamGameServer, steamIDUser: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_ISteamGameServer_BUpdateUserData :: (self: *ISteamGameServer, steamIDUser: uint64_steamid, pchPlayerName: *u8, uScore: uint32) -> bool #foreign steam_api64;

// A versioned accessor is exported by the library
SteamAPI_SteamGameServerStats_v001 :: () -> *ISteamGameServerStats #foreign steam_api64;

SteamAPI_ISteamGameServerStats_RequestUserStats :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;
SteamAPI_ISteamGameServerStats_GetUserStatInt32 :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8, pData: *int32) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_GetUserStatFloat :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8, pData: *float) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_GetUserAchievement :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8, pbAchieved: *bool) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_SetUserStatInt32 :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8, nData: int32) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_SetUserStatFloat :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8, fData: float) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8, flCountThisSession: float, dSessionLength: float64) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_SetUserAchievement :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_ClearUserAchievement :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *u8) -> bool #foreign steam_api64;
SteamAPI_ISteamGameServerStats_StoreUserStats :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid) -> SteamAPICall_t #foreign steam_api64;

// ISteamNetworkingFakeUDPPort
SteamAPI_ISteamNetworkingFakeUDPPort_DestroyFakeUDPPort :: (self: *ISteamNetworkingFakeUDPPort) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingFakeUDPPort_SendMessageToFakeIP :: (self: *ISteamNetworkingFakeUDPPort, remoteAddress: *SteamNetworkingIPAddr, pData: *void, cbData: uint32, nSendFlags: s32) -> EResult #foreign steam_api64;
SteamAPI_ISteamNetworkingFakeUDPPort_SendMessageToFakeIP :: (self: *ISteamNetworkingFakeUDPPort, remoteAddress: SteamNetworkingIPAddr, pData: *void, cbData: uint32, nSendFlags: s32) -> EResult #no_context {
    return SteamAPI_ISteamNetworkingFakeUDPPort_SendMessageToFakeIP(self, *remoteAddress, pData, cbData, nSendFlags);
}
SteamAPI_ISteamNetworkingFakeUDPPort_ReceiveMessages :: (self: *ISteamNetworkingFakeUDPPort, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam_api64;
SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup :: (self: *ISteamNetworkingFakeUDPPort, remoteAddress: *SteamNetworkingIPAddr) -> void #foreign steam_api64;
SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup :: (self: *ISteamNetworkingFakeUDPPort, remoteAddress: SteamNetworkingIPAddr) #no_context {
    SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup(self, *remoteAddress);
}

// SteamIPAddress_t
SteamAPI_SteamIPAddress_t_IsSet :: (self: *SteamIPAddress_t) -> bool #foreign steam_api64;

// MatchMakingKeyValuePair_t
SteamAPI_MatchMakingKeyValuePair_t_Construct :: (self: *MatchMakingKeyValuePair_t) -> void #foreign steam_api64;

// servernetadr_t
SteamAPI_servernetadr_t_Construct :: (self: *servernetadr_t) -> void #foreign steam_api64;
SteamAPI_servernetadr_t_Init :: (self: *servernetadr_t, ip: u32, usQueryPort: uint16, usConnectionPort: uint16) -> void #foreign steam_api64;
SteamAPI_servernetadr_t_GetQueryPort :: (self: *servernetadr_t) -> uint16 #foreign steam_api64;
SteamAPI_servernetadr_t_SetQueryPort :: (self: *servernetadr_t, usPort: uint16) -> void #foreign steam_api64;
SteamAPI_servernetadr_t_GetConnectionPort :: (self: *servernetadr_t) -> uint16 #foreign steam_api64;
SteamAPI_servernetadr_t_SetConnectionPort :: (self: *servernetadr_t, usPort: uint16) -> void #foreign steam_api64;
SteamAPI_servernetadr_t_GetIP :: (self: *servernetadr_t) -> uint32 #foreign steam_api64;
SteamAPI_servernetadr_t_SetIP :: (self: *servernetadr_t, unIP: uint32) -> void #foreign steam_api64;
SteamAPI_servernetadr_t_GetConnectionAddressString :: (self: *servernetadr_t) -> *u8 #foreign steam_api64;
SteamAPI_servernetadr_t_GetQueryAddressString :: (self: *servernetadr_t) -> *u8 #foreign steam_api64;
SteamAPI_servernetadr_t_IsLessThan :: (self: *servernetadr_t, netadr: *servernetadr_t) -> bool #foreign steam_api64;
SteamAPI_servernetadr_t_IsLessThan :: (self: *servernetadr_t, netadr: servernetadr_t) -> bool #no_context {
    return SteamAPI_servernetadr_t_IsLessThan(self, *netadr);
}
SteamAPI_servernetadr_t_Assign :: (self: *servernetadr_t, that: *servernetadr_t) -> void #foreign steam_api64;
SteamAPI_servernetadr_t_Assign :: (self: *servernetadr_t, that: servernetadr_t) #no_context {
    SteamAPI_servernetadr_t_Assign(self, *that);
}

// gameserveritem_t
SteamAPI_gameserveritem_t_Construct :: (self: *gameserveritem_t) -> void #foreign steam_api64;
SteamAPI_gameserveritem_t_GetName :: (self: *gameserveritem_t) -> *u8 #foreign steam_api64;
SteamAPI_gameserveritem_t_SetName :: (self: *gameserveritem_t, pName: *u8) -> void #foreign steam_api64;

// SteamNetworkingIPAddr
SteamAPI_SteamNetworkingIPAddr_Clear :: (self: *SteamNetworkingIPAddr) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_IsIPv6AllZeros :: (self: *SteamNetworkingIPAddr) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_SetIPv6 :: (self: *SteamNetworkingIPAddr, ipv6: *uint8, nPort: uint16) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_SetIPv4 :: (self: *SteamNetworkingIPAddr, nIP: uint32, nPort: uint16) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_IsIPv4 :: (self: *SteamNetworkingIPAddr) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_GetIPv4 :: (self: *SteamNetworkingIPAddr) -> uint32 #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost :: (self: *SteamNetworkingIPAddr, nPort: uint16) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_IsLocalHost :: (self: *SteamNetworkingIPAddr) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_ToString :: (self: *SteamNetworkingIPAddr, buf: *u8, cbBuf: uint32, bWithPort: bool) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_ParseString :: (self: *SteamNetworkingIPAddr, pszStr: *u8) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_IsEqualTo :: (self: *SteamNetworkingIPAddr, x: *SteamNetworkingIPAddr) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_IsEqualTo :: (self: *SteamNetworkingIPAddr, x: SteamNetworkingIPAddr) -> bool #no_context {
    return SteamAPI_SteamNetworkingIPAddr_IsEqualTo(self, *x);
}
SteamAPI_SteamNetworkingIPAddr_GetFakeIPType :: (self: *SteamNetworkingIPAddr) -> ESteamNetworkingFakeIPType #foreign steam_api64;
SteamAPI_SteamNetworkingIPAddr_IsFakeIP :: (self: *SteamNetworkingIPAddr) -> bool #foreign steam_api64;

// SteamNetworkingIdentity
SteamAPI_SteamNetworkingIdentity_Clear :: (self: *SteamNetworkingIdentity) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_IsInvalid :: (self: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetSteamID :: (self: *SteamNetworkingIdentity, steamID: uint64_steamid) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetSteamID :: (self: *SteamNetworkingIdentity) -> uint64_steamid #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetSteamID64 :: (self: *SteamNetworkingIdentity, steamID: uint64) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetSteamID64 :: (self: *SteamNetworkingIdentity) -> uint64 #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetXboxPairwiseID :: (self: *SteamNetworkingIdentity, pszString: *u8) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID :: (self: *SteamNetworkingIdentity) -> *u8 #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetPSNID :: (self: *SteamNetworkingIdentity, id: uint64) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetPSNID :: (self: *SteamNetworkingIdentity) -> uint64 #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetStadiaID :: (self: *SteamNetworkingIdentity, id: uint64) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetStadiaID :: (self: *SteamNetworkingIdentity) -> uint64 #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetIPAddr :: (self: *SteamNetworkingIdentity, addr: *SteamNetworkingIPAddr) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetIPAddr :: (self: *SteamNetworkingIdentity, addr: SteamNetworkingIPAddr) #no_context {
    SteamAPI_SteamNetworkingIdentity_SetIPAddr(self, *addr);
}
SteamAPI_SteamNetworkingIdentity_GetIPAddr :: (self: *SteamNetworkingIdentity) -> *SteamNetworkingIPAddr #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetIPv4Addr :: (self: *SteamNetworkingIdentity, nIPv4: uint32, nPort: uint16) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetIPv4 :: (self: *SteamNetworkingIdentity) -> uint32 #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetFakeIPType :: (self: *SteamNetworkingIdentity) -> ESteamNetworkingFakeIPType #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_IsFakeIP :: (self: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetLocalHost :: (self: *SteamNetworkingIdentity) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_IsLocalHost :: (self: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetGenericString :: (self: *SteamNetworkingIdentity, pszString: *u8) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetGenericString :: (self: *SteamNetworkingIdentity) -> *u8 #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_SetGenericBytes :: (self: *SteamNetworkingIdentity, data: *void, cbLen: uint32) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_GetGenericBytes :: (self: *SteamNetworkingIdentity, cbLen: *s32) -> *uint8 #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_IsEqualTo :: (self: *SteamNetworkingIdentity, x: *SteamNetworkingIdentity) -> bool #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_IsEqualTo :: (self: *SteamNetworkingIdentity, x: SteamNetworkingIdentity) -> bool #no_context {
    return SteamAPI_SteamNetworkingIdentity_IsEqualTo(self, *x);
}
SteamAPI_SteamNetworkingIdentity_ToString :: (self: *SteamNetworkingIdentity, buf: *u8, cbBuf: uint32) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingIdentity_ParseString :: (self: *SteamNetworkingIdentity, pszStr: *u8) -> bool #foreign steam_api64;

// SteamNetworkingMessage_t
SteamAPI_SteamNetworkingMessage_t_Release :: (self: *SteamNetworkingMessage_t) -> void #foreign steam_api64;

// SteamNetworkingConfigValue_t
SteamAPI_SteamNetworkingConfigValue_t_SetInt32 :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: s32) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingConfigValue_t_SetInt64 :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: s64) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingConfigValue_t_SetFloat :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: float) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingConfigValue_t_SetPtr :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: *void) -> void #foreign steam_api64;
SteamAPI_SteamNetworkingConfigValue_t_SetString :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: *u8) -> void #foreign steam_api64;

// SteamDatagramHostedAddress
SteamAPI_SteamDatagramHostedAddress_Clear :: (self: *SteamDatagramHostedAddress) -> void #foreign steam_api64;
SteamAPI_SteamDatagramHostedAddress_GetPopID :: (self: *SteamDatagramHostedAddress) -> SteamNetworkingPOPID #foreign steam_api64;
SteamAPI_SteamDatagramHostedAddress_SetDevAddress :: (self: *SteamDatagramHostedAddress, nIP: uint32, nPort: uint16, popid: SteamNetworkingPOPID) -> void #foreign steam_api64;

#scope_file

steam_api64 :: #library "lib/steam_api64";
