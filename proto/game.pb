
û6
proto/game.protoGame"ž
Player
seat (Rseat
player (	Rplayer
info (	Rinfo
status (Rstatus
	is_online (RisOnline
total_score (R
totalScore"Ï
Unit
room_id (RroomId
room_status (R
roomStatus
player (	Rplayer
owner (	Rowner
	game_type (RgameType
app_id (RappId
	room_uuid (	RroomUuid
st (Rst"
Card
card (Rcard"2
Dice
dice1 (Rdice1
dice2 (Rdice2"‰
Prompt
	action_id (RactionId
prompt (Rprompt%
ref_card (2
.Game.CardRrefCard#
op_card (2
.Game.CardRopCard"\
CardTip
card (2
.Game.CardRcard
points (Rpoints
rest_cnt (RrestCnt",
ActionRequest
	action_id (RactionId"ú
ActionResponse
card (2
.Game.CardRcard
player (	Rplayer+
active_card (2
.Game.CardR
activeCard
active_type (R
activeType!
trigger_seat (RtriggerSeat
win_flag (	RwinFlag$
prompt (2.Game.PromptRprompt"w
CreateRoomRequest
room_id (RroomId
owner (	Rowner
kwargs (	Rkwargs
	room_uuid (	RroomUuid"(
CreateRoomResponse
code (Rcode"Ê
DealResponse
dealer_uuid (	R
dealerUuid
dice (2
.Game.DiceRdice.
cards_in_hand (2
.Game.CardRcardsInHand$
prompt (2.Game.PromptRprompt#
current_round (RcurrentRound"
DiscardTipsResponse/
tip (2.Game.DiscardTipsResponse.TipRtipU
Tip-
discard_card (2
.Game.CardRdiscardCard
tip (2.Game.CardTipRtip"0
DiscardRequest
card (2
.Game.CardRcard"o
DiscardResponse
card (2
.Game.CardRcard
player (	Rplayer$
prompt (2.Game.PromptRprompt"—
DismissRoomWebRequest
room_id (RroomId
	game_type (RgameType
app_id (RappId
owner (	Rowner
	room_uuid (	RroomUuid"
DismissRoomWebResponse
code (Rcode
room_id (RroomId
	game_type (RgameType
app_id (RappId
owner (	Rowner"
DismissRoomRequest"=
DismissRoomResponse
code (Rcode
flag (Rflag"6
DrawNiaoListResponse
card (2
.Game.CardRcard"l
DrawResponse
card (2
.Game.CardRcard
player (	Rplayer$
prompt (2.Game.PromptRprompt"l
EnterRoomOtherResponse
code (Rcode
player (	Rplayer
seat (Rseat
info (	Rinfo"
EnterRoomWebResponse
code (Rcode
room_id (RroomId
player (	Rplayer
	game_type (RgameType
app_id (RappId"W
EnterRoomRequest
room_id (RroomId
player (	Rplayer
info (	Rinfo"Ò
EnterRoomResponse
code (Rcode
room_id (RroomId
owner (	Rowner
kwargs (	Rkwargs

rest_cards (R	restCards$
player (2.Game.PlayerRplayer

owner_info (	R	ownerInfo"
ExchangeBroadcastResponse"\
ExchangeInResponse
dice (Rdice
card (2
.Game.CardRcard
seat (Rseat"4
ExchangeOutRequest
card (2
.Game.CardRcard")
ExchangeOutResponse
seat (Rseat".
ExistRoomWebRequest
room_id (RroomId"*
ExistRoomWebResponse
flag (Rflag"Ž
ExitRoomWebResponse
code (Rcode
room_id (RroomId
player (	Rplayer
	game_type (RgameType
app_id (RappId"
ExitRoomRequest">
ExitRoomResponse
code (Rcode
player (	Rplayer"
HeartbeatRequest"
HeartbeatResponse"
KickSuitBroadcastResponse"%
KickSuitRequest
suit (Rsuit"Œ
KickSuitResponseB
player_suit (2!.Game.KickSuitResponse.PlayerSuitR
playerSuit4

PlayerSuit
seat (Rseat
suit (Rsuit"8
LoadBalanceWebResponse
unit (2
.Game.UnitRunit">
LoadMinusWebResponse
addr (	Raddr
port (Rport"=
LoadPlusWebResponse
addr (	Raddr
port (Rport"F
OnlineStatusResponse
player (	Rplayer
status (Rstatus"'
PlayerVoteRequest
flag (Rflag"@
PlayerVoteResponse
flag (Rflag
player (	Rplayer"6
PromptResponse$
prompt (2.Game.PromptRprompt"8
ReadyHandTipsResponse
tip (2.Game.CardTipRtip"
ReadyRequest"'
ReadyResponse
player (	Rplayer"ß
ReconnectResponse
room_id (RroomId
kwargs (	Rkwargs

owner_uuid (	R	ownerUuid
room_status (R
roomStatus#
current_round (RcurrentRound
dealer_seat (R
dealerSeat
active_seat (R
activeSeat!
discard_seat (RdiscardSeat

rest_cards	 (R	restCards'
	card_draw
 (2
.Game.CardRcardDraw6
player (2.Game.ReconnectResponse.PlayerRplayer
code (Rcode

owner_info (	R	ownerInfo
	max_cards (RmaxCardsþ
Player
seat (Rseat
player (	Rplayer
info (	Rinfo
status (Rstatus
	is_online (RisOnline
score (Rscore.
cards_in_hand (2
.Game.CardRcardsInHand/
cards_discard (2
.Game.CardRcardsDiscardG

group_card	 (2(.Game.ReconnectResponse.Player.GroupCardR	groupCard
deposit
 (Rdeposit
	kick_suit (RkickSuit-
exchange_out (2
.Game.CardRexchangeOut+
exchange_in (2
.Game.CardR
exchangeIn#
exchange_dice (RexchangeDice#
exchange_seat (RexchangeSeatb
	GroupCard
card (2
.Game.CardRcard!
trigger_seat (RtriggerSeat
type (	Rtype"§
RefundWebResponse
code (Rcode
room_id (RroomId
	game_type (RgameType
app_id (RappId
owner (	Rowner
	room_uuid (	RroomUuid"˜
RunningWebResponse
sessions (Rsessions
players (Rplayers%
tables_initial (RtablesInitial%
tables_playing (RtablesPlaying"ç
SettleForRoomResponse
flag (RflagG
player_data (2&.Game.SettleForRoomResponse.PlayerDataR
playerDatað

PlayerData
player (	Rplayer
seat (Rseat
total_score (R
totalScore
	top_score (RtopScore"
win_total_cnt (RwinTotalCnt 
win_draw_cnt (R
winDrawCnt&
win_discard_cnt (RwinDiscardCnt
pao_cnt (RpaoCnt
is_owner	 (RisOwner,
kong_concealed_cnt
 (RkongConcealedCnt(
kong_exposed_cnt (RkongExposedCnt"š
SettleForRoundResponseH
player_data (2'.Game.SettleForRoundResponse.PlayerDataR
playerData¨
WinModel
type (RtypeA
model (2+.Game.SettleForRoundResponse.WinModel.ModelRmodel
points (Rpoints-
Model
name (	Rname
cnt (Rcnt/
KongCnt
name (	Rname
cnt (RcntÙ

PlayerData
player (	Rplayer+
cards_group (2
.Game.CardR
cardsGroup.
cards_in_hand (2
.Game.CardRcardsInHand%
win_card (2
.Game.CardRwinCard
score (Rscore
total (RtotalB
	win_model (2%.Game.SettleForRoundResponse.WinModelRwinModel?
kong_cnt (2$.Game.SettleForRoundResponse.KongCntRkongCnt"*
SpeakerRequest
content (	Rcontent"C
SpeakerResponse
player (	Rplayer
content (	Rcontent"o
SponsorVoteResponse
room_id (RroomId
sponsor (	Rsponsor%
expire_seconds (RexpireSeconds":
SynchroniseCardsResponse
card (2
.Game.CardRcardbproto3