
�6
proto/game.protoGame"�
Player
seat (
player (	Rplayer
info (	Rinfo
status (
	is_online (
total_score (
totalScore"�
Unit
room_id (
room_status (
roomStatus
player (	Rplayer
owner (	Rowner
	game_type (
app_id (
	room_uuid (	RroomUuid
st (
Card
card (Rcard"2
Dice
dice1 (
dice2 (
Prompt
	action_id (
prompt (
ref_card (2
.Game.CardRrefCard#
op_card (2
.Game.CardRopCard"\
CardTip
card (2
.Game.CardRcard
points (Rpoints
rest_cnt (RrestCnt",

	action_id (
ActionResponse
card (2
.Game.CardRcard
player (	Rplayer+
active_card (2
.Game.CardR
activeCard
active_type (
activeType!
trigger_seat (
win_flag (	RwinFlag$
prompt (2.Game.PromptRprompt"w
CreateRoomRequest
room_id (
owner (	Rowner
kwargs (	Rkwargs
	room_uuid (	RroomUuid"(
CreateRoomResponse
code (
DealResponse
dealer_uuid (	R
dealerUuid
dice (2
.Game.DiceRdice.

.Game.CardRcardsInHand$
prompt (2.Game.PromptRprompt#

DiscardTipsResponse/
tip (2.Game.DiscardTipsResponse.TipRtipU
Tip-
discard_card (2
.Game.CardRdiscardCard
tip (2
DiscardRequest
card (2
.Game.CardRcard"o
DiscardResponse
card (2
.Game.CardRcard
player (	Rplayer$
prompt (2.Game.PromptRprompt"�
DismissRoomWebRequest
room_id (
	game_type (
app_id (
owner (	Rowner
	room_uuid (	RroomUuid"�
DismissRoomWebResponse
code (
room_id (
	game_type (
app_id (
owner (	Rowner"
DismissRoomRequest"=
DismissRoomResponse
code (
flag (
DrawNiaoListResponse
card (2
.Game.CardRcard"l
DrawResponse
card (2
.Game.CardRcard
player (	Rplayer$
prompt (2.Game.PromptRprompt"l
EnterRoomOtherResponse
code (
player (	Rplayer
seat (
info (	Rinfo"�
EnterRoomWebResponse
code (
room_id (
player (	Rplayer
	game_type (
app_id (
EnterRoomRequest
room_id (
player (	Rplayer
info (	Rinfo"�
EnterRoomResponse
code (
room_id (
owner (	Rowner
kwargs (	Rkwargs

rest_cards (
player (2.Game.PlayerRplayer

owner_info (	R	ownerInfo"
ExchangeBroadcastResponse"\
ExchangeInResponse
dice (
card (2
.Game.CardRcard
seat (
ExchangeOutRequest
card (2
.Game.CardRcard")
ExchangeOutResponse
seat (
ExistRoomWebRequest
room_id (
ExistRoomWebResponse
flag (Rflag"�
ExitRoomWebResponse
code (
room_id (
player (	Rplayer
	game_type (
app_id (
ExitRoomRequest">
ExitRoomResponse
code (
player (	Rplayer"
HeartbeatRequest"
HeartbeatResponse"
KickSuitBroadcastResponse"%
KickSuitRequest
suit (
KickSuitResponseB
player_suit (2!.Game.KickSuitResponse.PlayerSuitR
playerSuit4

PlayerSuit
seat (
suit (
LoadBalanceWebResponse
unit (2
.Game.UnitRunit">
LoadMinusWebResponse
addr (	Raddr
port (
LoadPlusWebResponse
addr (	Raddr
port (
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
tip (2
ReadyRequest"'

player (	Rplayer"�
ReconnectResponse
room_id (
kwargs (	Rkwargs

owner_uuid (	R	ownerUuid
room_status (
roomStatus#

dealer_seat (R
dealerSeat
active_seat (R
activeSeat!
discard_seat (RdiscardSeat

rest_cards	 (
	card_draw
 (2
.Game.CardRcardDraw6
player (2.Game.ReconnectResponse.PlayerRplayer
code (

owner_info
	max_cards (
Player
seat (
player (	Rplayer
info (	Rinfo
status (
	is_online (
score (Rscore.

.Game.CardRcardsInHand/

.Game.CardRcardsDiscardG

group_card	 (2(.Game.ReconnectResponse.Player.GroupCardR	groupCard
deposit
 (Rdeposit
	kick_suit (RkickSuit-
exchange_out (2
.Game.CardRexchangeOut+
exchange_in
.Game.CardR
exchangeIn#


	GroupCard
card (2
.Game.CardRcard!
trigger_seat (RtriggerSeat
type (	Rtype"�
RefundWebResponse
code (
room_id (
	game_type (
app_id (
owner (	Rowner
	room_uuid (	RroomUuid"�
RunningWebResponse
sessions (
players (
tables_initial (
tables_playing (
SettleForRoomResponse
flag (
player_data (2&.Game.SettleForRoomResponse.PlayerDataR
playerData�

PlayerData
player (	Rplayer
seat (
total_score (R
totalScore
	top_score (RtopScore"

win_draw_cnt (
winDrawCnt&
win_discard_cnt (
pao_cnt (
is_owner	 (
kong_concealed_cnt
 (
kong_exposed_cnt (
SettleForRoundResponseH
player_data (2'.Game.SettleForRoundResponse.PlayerDataR
playerData�
WinModel
type (RtypeA
model (2+.Game.SettleForRoundResponse.WinModel.ModelRmodel
points (Rpoints-
Model
name (	Rname
cnt (Rcnt/
KongCnt
name (	Rname
cnt (Rcnt�

PlayerData
player (	Rplayer+
cards_group (2
.Game.CardR
cardsGroup.

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
room_id (
sponsor (	Rsponsor%
expire_seconds (
SynchroniseCardsResponse
card (2
.Game.CardRcardbproto3