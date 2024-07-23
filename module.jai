
#load "generated_steam.jai";

#import "Basic";

// for_expansion and some other stuff tactically yoinked from https://github.com/onelivesleft/jai-steam/blob/main/steam_flat.jai
// feel free to delete it

Steam_Callbacks_t :: struct{}
Steam_Callbacks: Steam_Callbacks_t;
for_expansion :: (_: Steam_Callbacks_t, body: Code, flags: For_Flags) #expand {
    steam_pipe := SteamAPI_GetHSteamPipe();
    #insert,scope() steam_message_loop;
}

SteamAPI_CallbackMessage :: struct {
	union {
		m_iCallback : s32;
		callback_id : CallbackID;
		call_result_id : CallResultID;
	}
	union {
		m_hAsyncCall : SteamAPICall_t;
		caller :  SteamAPICall_t;
	}
	data : *void;
	callback : *CallbackMsg_t;
	call_result : *SteamAPICallCompleted_t;
	io_failure : bool;
}

steam_message_loop :: #code {
    #assert flags == 0;
    
    `it: SteamAPI_CallbackMessage;
    `it_index: bool;
    
    SteamAPI_ManualDispatch_RunFrame(steam_pipe);
    
    callback: CallbackMsg_t;
    
    while SteamAPI_ManualDispatch_GetNextCallback(steam_pipe, *callback) {
        defer SteamAPI_ManualDispatch_FreeLastCallback(steam_pipe);
        
        if callback.m_iCallback == xx SteamAPICallCompleted_t.k_iCallback {
            completed_call_result := cast(*SteamAPICallCompleted_t) callback.m_pubParam;
            
            call_result: *void;
            call_result = talloc(completed_call_result.m_cubParam);
            
            io_failure := false;
            
            if SteamAPI_ManualDispatch_GetAPICallResult(steam_pipe, completed_call_result.m_hAsyncCall, call_result, xx completed_call_result.m_cubParam, completed_call_result.m_iCallback, *io_failure) {
                it.m_iCallback = completed_call_result.m_iCallback;
				it.m_hAsyncCall = completed_call_result.m_hAsyncCall;
				it.data = call_result;
				it.callback = *callback;
				it.call_result = completed_call_result;
				it.io_failure = io_failure;
				it_index = true;
				
				#insert body;
            }
        } else {
            it.m_iCallback = callback.m_iCallback;
			it.data = callback.m_pubParam;
			it.callback = *callback;
			it_index = false;

			#insert body;
        }
    }
}


CallbackID :: enum s32 {
    MusicPlayerWantsPlay_t :: 4105;
    RemoteStoragePublishedFileSubscribed_t :: 1321;
    MusicPlayerWantsLooped_t :: 4110;
    MusicPlayerRemoteWillActivate_t :: 4101;
    PSNGameBootInviteResult_t :: 515;
    DeleteItemResult_t :: 3417;
    MusicPlayerSelectsQueueEntry_t :: 4012;
    SteamInventoryEligiblePromoItemDefIDs_t :: 4703;
    UserStatsStored_t :: 1102;
    SteamServersConnected_t :: 101;
    LobbyChatMsg_t :: 507;
    IPCFailure_t :: 117;
    ScreenshotReady_t :: 2301;
    RemoteStorageUpdateUserPublishedItemVoteResult_t :: 1324;
    GSGameplayStats_t :: 207;
    LeaderboardScoreUploaded_t :: 1106;
    GSClientApprove_t :: 201;
    MusicPlayerWantsVolume_t :: 4011;
    RemoteStorageAppSyncedClient_t :: 1301;
    RemoteStorageEnumerateWorkshopFilesResult_t :: 1319;
    MusicPlayerWillQuit_t :: 4104;
    SteamNetworkingMessagesSessionFailed_t :: 1252;
    AddAppDependencyResult_t :: 3414;
    HTML_StatusText_t :: 4523;
    MusicPlayerWantsPause_t :: 4106;
    SteamUGCQueryCompleted_t :: 3401;
    SearchForGameResultCallback_t :: 5202;
    LobbyMatchList_t :: 510;
    RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: 1328;
    HTML_BrowserReady_t :: 4501;
    RemoteStoragePublishFileResult_t :: 1309;
    GetAuthSessionTicketResponse_t :: 163;
    DownloadItemResult_t :: 3406;
    SteamRelayNetworkStatus_t :: 1281;
    EncryptedAppTicketResponse_t :: 154;
    SteamRemotePlaySessionConnected_t :: 5701;
    GSStatsStored_t :: 1801;
    VolumeHasChanged_t :: 4002;
    RemoteStoragePublishedFileUpdated_t :: 1330;
    LicensesUpdated_t :: 125;
    HTML_HorizontalScroll_t :: 4511;
    ClanOfficerListResponse_t :: 335;
    StartPlaytimeTrackingResult_t :: 3410;
    LeaderboardScoresDownloaded_t :: 1105;
    RequestPlayersForGameFinalResultCallback_t :: 5213;
    RemoteStorageEnumerateUserSharedWorkshopFilesResult_t :: 1326;
    CreateItemResult_t :: 3403;
    NewUrlLaunchParameters_t :: 1014;
    HTML_StartRequest_t :: 4503;
    DurationControl_t :: 167;
    FriendsEnumerateFollowingList_t :: 346;
    FileDetailsResult_t :: 1023;
    GSClientKick_t :: 203;
    UnreadChatMessagesChanged_t :: 348;
    NumberOfCurrentPlayers_t :: 1107;
    JoinClanChatRoomCompletionResult_t :: 342;
    RemoteStoragePublishFileProgress_t :: 1329;
    GSClientGroupStatus_t :: 208;
    JoinPartyCallback_t :: 5301;
    MusicPlayerSelectsPlaylistEntry_t :: 4013;
    GamepadTextInputDismissed_t :: 714;
    HTML_FileOpenDialog_t :: 4516;
    RemoteStorageSubscribePublishedFileResult_t :: 1313;
    MusicPlayerRemoteWillDeactivate_t :: 4102;
    SteamUGCRequestUGCDetailsResult_t :: 3402;
    HTML_ShowToolTip_t :: 4524;
    AssociateWithClanResult_t :: 210;
    RemoteStorageDeletePublishedFileResult_t :: 1311;
    ItemInstalled_t :: 3405;
    HTML_NewWindow_t :: 4521;
    HTML_OpenLinkInNewTab_t :: 4507;
    MarketEligibilityResponse_t :: 166;
    CheckFileSignature_t :: 705;
    SteamInventoryStartPurchaseResult_t :: 4704;
    GameLobbyJoinRequested_t :: 333;
    MusicPlayerWantsPlayPrevious_t :: 4107;
    RemoteStorageEnumerateUserPublishedFilesResult_t :: 1312;
    GameConnectedChatJoin_t :: 339;
    SteamNetConnectionStatusChangedCallback_t :: 1221;
    GameConnectedChatLeave_t :: 340;
    AvailableBeaconLocationsUpdated_t :: 5305;
    SubmitItemUpdateResult_t :: 3404;
    ReservationNotificationCallback_t :: 5303;
    HTTPRequestHeadersReceived_t :: 2102;
    RemoteStorageFileReadAsyncComplete_t :: 1332;
    GSReputation_t :: 209;
    DownloadClanActivityCountsResult_t :: 341;
    SetPersonaNameResponse_t :: 347;
    RequestPlayersForGameProgressCallback_t :: 5211;
    SocketStatusCallback_t :: 1201;
    RemoteStorageAppSyncProgress_t :: 1303;
    SteamInventoryFullUpdate_t :: 4701;
    HTML_FinishedRequest_t :: 4506;
    SearchForGameProgressCallback_t :: 5201;
    RemoteStoragePublishedFileDeleted_t :: 1323;
    ActiveBeaconsUpdated_t :: 5306;
    StopPlaytimeTrackingResult_t :: 3411;
    HTML_JSAlert_t :: 4514;
    SubmitPlayerResultResultCallback_t :: 5214;
    ChangeNumOpenSlotsCallback_t :: 5304;
    FavoritesListAccountsUpdated_t :: 516;
    GSStatsReceived_t :: 1800;
    UserStatsUnloaded_t :: 1108;
    HTML_NeedsPaint_t :: 4502;
    GSPolicyResponse_t :: 115;
    LowBatteryPower_t :: 702;
    LeaderboardUGCSet_t :: 1111;
    RemoteStorageAppSyncedServer_t :: 1302;
    FriendsIsFollowing_t :: 345;
    HTML_SearchResults_t :: 4509;
    SteamInventoryDefinitionUpdate_t :: 4702;
    UserAchievementIconFetched_t :: 1109;
    RemoteStorageUserVoteDetails_t :: 1325;
    GlobalStatsReceived_t :: 1112;
    HTML_HideToolTip_t :: 4526;
    GetOPFSettingsResult_t :: 4624;
    ComputeNewPlayerCompatibilityResult_t :: 211;
    P2PSessionConnectFail_t :: 1203;
    SteamServersDisconnected_t :: 103;
    RemoteStorageUnsubscribePublishedFileResult_t :: 1315;
    ScreenshotRequested_t :: 2302;
    RegisterActivationCodeResponse_t :: 1008;
    UserFavoriteItemsListChanged_t :: 3407;
    HTTPRequestCompleted_t :: 2101;
    DlcInstalled_t :: 1005;
    HTML_URLChanged_t :: 4505;
    GetAppDependenciesResult_t :: 3416;
    HTML_CanGoBackAndForward_t :: 4510;
    LobbyKicked_t :: 512;
    RemoteStorageGetPublishedFileDetailsResult_t :: 1318;
    FriendsGetFollowerCount_t :: 344;
    RemoteStoragePublishedFileUnsubscribed_t :: 1322;
    LobbyCreated_t :: 513;
    LobbyEnter_t :: 504;
    SteamInventoryResultReady_t :: 4700;
    RemoteStorageUpdatePublishedFileResult_t :: 1316;
    PlaybackStatusHasChanged_t :: 4001;
    SteamInventoryRequestPricesResult_t :: 4705;
    PersonaStateChange_t :: 304;
    SteamShutdown_t :: 704;
    GameRichPresenceJoinRequested_t :: 337;
    RemoteStorageFileWriteAsyncComplete_t :: 1331;
    HTML_UpdateToolTip_t :: 4525;
    MusicPlayerWantsPlayingRepeatStatus_t :: 4114;
    SteamNetworkingMessagesSessionRequest_t :: 1251;
    MusicPlayerWantsPlayNext_t :: 4108;
    ValidateAuthTicketResponse_t :: 143;
    LobbyInvite_t :: 503;
    RemoveAppDependencyResult_t :: 3415;
    SteamRemotePlaySessionDisconnected_t :: 5702;
    UserAchievementStored_t :: 1103;
    MicroTxnAuthorizationResponse_t :: 152;
    MusicPlayerRemoteToFront_t :: 4103;
    LobbyGameCreated_t :: 509;
    TimedTrialStatus_t :: 1030;
    RemoveUGCDependencyResult_t :: 3413;
    GameOverlayActivated_t :: 331;
    HTML_ChangedTitle_t :: 4508;
    GameConnectedFriendChatMsg_t :: 343;
    FriendRichPresenceUpdate_t :: 336;
    RequestPlayersForGameResultCallback_t :: 5212;
    LobbyChatUpdate_t :: 506;
    CreateBeaconCallback_t :: 5302;
    HTML_CloseBrowser_t :: 4504;
    UserStatsReceived_t :: 1101;
    HTML_VerticalScroll_t :: 4512;
    GSClientAchievementStatus_t :: 206;
    SteamAppUninstalled_t :: 3902;
    OverlayBrowserProtocolNavigation_t :: 349;
    LobbyDataUpdate_t :: 505;
    SteamAPICallCompleted_t :: 703;
    RemoteStorageAppSyncStatusCheck_t :: 1305;
    LeaderboardFindResult_t :: 1104;
    AvatarImageLoaded_t :: 334;
    HTTPRequestDataReceived_t :: 2103;
    P2PSessionRequest_t :: 1202;
    SetUserItemVoteResult_t :: 3408;
    SteamServerConnectFailure_t :: 102;
    SteamParentalSettingsChanged_t :: 5001;
    RemoteStorageEnumerateUserSubscribedFilesResult_t :: 1314;
    GameWebCallback_t :: 164;
    MusicPlayerWantsShuffled_t :: 4109;
    SteamAppInstalled_t :: 3901;
    GlobalAchievementPercentagesReady_t :: 1110;
    AppProofOfPurchaseKeyResponse_t :: 1021;
    IPCountry_t :: 701;
    GameServerChangeRequested_t :: 332;
    RemoteStorageGetPublishedItemVoteDetailsResult_t :: 1320;
    FavoritesListChanged_t :: 502;
    GSClientDeny_t :: 202;
    RemoteStorageDownloadUGCResult_t :: 1317;
    GetUserItemVoteResult_t :: 3409;
    GameConnectedClanChatMsg_t :: 338;
    RemoteStorageSetUserPublishedFileActionResult_t :: 1327;
    RemoteStorageFileShareResult_t :: 1307;
    HTML_BrowserRestarted_t :: 4527;
    StoreAuthURLResponse_t :: 165;
    ClientGameServerDeny_t :: 113;
    HTML_JSConfirm_t :: 4515;
    HTML_SetCursor_t :: 4522;
    GetVideoURLResult_t :: 4611;
    EndGameResultCallback_t :: 5215;
    HTML_LinkAtPosition_t :: 4513;
    AddUGCDependencyResult_t :: 3412;
    SteamNetAuthenticationStatus_t :: 1222;
}

CallResultID :: enum s32 {
    ChangeNumOpenSlotsCallback_t :: 5304;
    LeaderboardScoresDownloaded_t :: 1105;
    GSStatsReceived_t :: 1800;
    CreateItemResult_t :: 3403;
    DeleteItemResult_t :: 3417;
    DurationControl_t :: 167;
    RemoveUGCDependencyResult_t :: 3413;
    FriendsEnumerateFollowingList_t :: 346;
    FileDetailsResult_t :: 1023;
    LeaderboardUGCSet_t :: 1111;
    FriendsIsFollowing_t :: 345;
    NumberOfCurrentPlayers_t :: 1107;
    CreateBeaconCallback_t :: 5302;
    SteamInventoryEligiblePromoItemDefIDs_t :: 4703;
    JoinClanChatRoomCompletionResult_t :: 342;
    RemoteStoragePublishFileProgress_t :: 1329;
    UserStatsReceived_t :: 1101;
    JoinPartyCallback_t :: 5301;
    RemoteStorageUpdateUserPublishedItemVoteResult_t :: 1324;
    LeaderboardScoreUploaded_t :: 1106;
    RemoteStorageSubscribePublishedFileResult_t :: 1313;
    GlobalStatsReceived_t :: 1112;
    SteamUGCRequestUGCDetailsResult_t :: 3402;
    AssociateWithClanResult_t :: 210;
    ComputeNewPlayerCompatibilityResult_t :: 211;
    RemoteStorageDeletePublishedFileResult_t :: 1311;
    RemoteStorageEnumerateWorkshopFilesResult_t :: 1319;
    RemoteStorageUnsubscribePublishedFileResult_t :: 1315;
    MarketEligibilityResponse_t :: 166;
    AddAppDependencyResult_t :: 3414;
    UserFavoriteItemsListChanged_t :: 3407;
    CheckFileSignature_t :: 705;
    SteamInventoryStartPurchaseResult_t :: 4704;
    LeaderboardFindResult_t :: 1104;
    RemoteStorageEnumerateUserPublishedFilesResult_t :: 1312;
    GetAppDependenciesResult_t :: 3416;
    SteamUGCQueryCompleted_t :: 3401;
    RemoteStorageGetPublishedFileDetailsResult_t :: 1318;
    SetUserItemVoteResult_t :: 3408;
    LobbyMatchList_t :: 510;
    RemoteStorageEnumerateUserSubscribedFilesResult_t :: 1314;
    FriendsGetFollowerCount_t :: 344;
    RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: 1328;
    LobbyCreated_t :: 513;
    SubmitItemUpdateResult_t :: 3404;
    RemoteStorageFileReadAsyncComplete_t :: 1332;
    GlobalAchievementPercentagesReady_t :: 1110;
    LobbyEnter_t :: 504;
    DownloadClanActivityCountsResult_t :: 341;
    RemoteStorageGetPublishedItemVoteDetailsResult_t :: 1320;
    RemoteStorageUpdatePublishedFileResult_t :: 1316;
    SetPersonaNameResponse_t :: 347;
    RemoteStorageDownloadUGCResult_t :: 1317;
    HTML_BrowserReady_t :: 4501;
    SteamInventoryRequestPricesResult_t :: 4705;
    EncryptedAppTicketResponse_t :: 154;
    GetUserItemVoteResult_t :: 3409;
    GSReputation_t :: 209;
    RemoteStorageFileWriteAsyncComplete_t :: 1331;
    RemoteStorageSetUserPublishedFileActionResult_t :: 1327;
    RemoteStorageFileShareResult_t :: 1307;
    StoreAuthURLResponse_t :: 165;
    GSStatsStored_t :: 1801;
    StopPlaytimeTrackingResult_t :: 3411;
    RemoveAppDependencyResult_t :: 3415;
    ClanOfficerListResponse_t :: 335;
    AddUGCDependencyResult_t :: 3412;
    StartPlaytimeTrackingResult_t :: 3410;
}