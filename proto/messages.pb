
™*
proto/messages.protoMessages"æ

PlayerInfo
userID (
nickName (	
pic (	
sex (
exp (
level (
gold (
diamond (
recharge	 (
viplevel
 (
vipgifts (
	roomcard1 (
	roomcard2 (
	roomcard3 (
ceateroomid (
sign (

signreward (
signlasttime (
chestreward (
spreadid ("&
CheckVersionRequest
channel (	"ê
CheckVersionResponse

archivesNo (
code (
cost (	1
down (2#.Messages.CheckVersionResponse.Down
server_unixtime (V
Down
code (	
res (	
restart (
version (	
	versionId (	"X
LoginAccountRequest
channel (	
username (	
passwd (	
openid (	"R
LoginAccountResponse
result (
uid (
secret (	
token (	" 
EnterPlaceRequest
uid ("N
EnterPlaceResponse
result ((

playerInfo (2.Messages.PlayerInfo"
Card
card ("<
CreateTableRequest

max_rounds (

table_conf (	"_
CreateTableResponse
result (
table_id (
	server_ip (	
server_port (	"5
TableEnterRequest
table_id (
player ("^
TableEnterResponse
result (
table_id (
	server_ip (	
server_port (	"B
EnterTableRequest
tableid (
player (
info (	"Ž
EnterTableResponse
result (
owner (

owner_info (	
kwargs (	

rest_cards (3
player (2#.Messages.EnterTableResponse.Playerl
Player
seat (
player (
info (	
status (
	is_online (
total_score ("#
ExitTableRequest
tableid ("3
ExitTableResponse
result (
player ("&
DismissTableRequest
tableid ("4
DismissTableResponse
result (
flag ("
VoteRequest
flag ("<
VoteResponse
result (
flag (
player ("U
EnterTableOtherResponse
result (
player (
info (	
seat ("
ReadyRequest"
ReadyResponse
player (".
DiscardRequest
card (2.Messages.Card"?
DiscardResponse
card (2.Messages.Card
player ("C
ActionRequest
	action_id (
bi_card (2.Messages.Card"¯
ActionResponse
card (2.Messages.Card
bi_card (2.Messages.Card
player (#
active_card (2.Messages.Card
active_type (
trigger_seat ("E
DealResponse
banker (%
cards_in_hand (2.Messages.Card"<
DrawResponse
card (2.Messages.Card
player ("
WinFlag
flag (	">
	CardGroup#
cards_group (2.Messages.Card
huxi ("ë
SettleForRoundResponse
win_type (%
win_card (2.Messages.CardGroup#
win_flag (2.Messages.WinFlag

final_huxi (
tun (
	final_tun (
fan ("

cards_rest (2.Messages.Card@
player_data	 (2+.Messages.SettleForRoundResponse.PlayerDataL

PlayerData
player (
score (
total (
win_type ("¤
SettleForRoomResponse
flag (?
player_data (2*.Messages.SettleForRoomResponse.PlayerData»

PlayerData
player (
seat (
total_score (
	top_score (
win_total_cnt (
win_draw_cnt (
win_discard_cnt (
pao_cnt (
is_owner	 ("6
OnlineStatusResponse
player (
status ("š
ReconnectResponse
table_id (
kwargs (	
owner (
room_status (
current_round (
dealer (
active_seat (
discard_seat (
	draw_seat	 (

rest_cards
 (
	show_card (2
player (2".Messages.ReconnectResponse.Player

owner_info (	ê
Player
seat (
player (
info (	
status (
	is_online (
total_score (%
cards_in_hand (2.Messages.Card%
cards_discard (2.Messages.Card"

cards_pong	 (2.Messages.Card"

cards_chow
 (2.Messages.Card!
	cards_wei (2.Messages.Card 
cards_ti (2.Messages.Card!
	cards_pao (2.Messages.Card"Ò
PromptResponse
op_card (2.Messages.Card/
prompt (2.Messages.PromptResponse.Promptn
Prompt
	action_id (
prompt ( 
ref_card (2.Messages.Card
bi_card (2.Messages.Card"P
SponsorVoteResponse
table_id (
sponsor (
expire_seconds ("#
CutPromptResponse
player ("!
CutConfirmRequest
flag ("N
CutConfirmResponse
player (
position (
expire_seconds (""
SyncCutRequest
position ("#
SyncCutResponse
position ("=
LiangResponse
card (2.Messages.Card
player ("j
SyncHuxiResponse/
score (2 .Messages.SyncHuxiResponse.Score%
Score
player (
huxi ("
FinishCutRequest"%
FinishCutResponse
position ("T
ChatRequest
voiceUrl (	
	voiceTime (
customId (
faceId ("e
ChatResponse
voiceUrl (	
	voiceTime (
customId (
faceId (
player ("
LiuJuResponse"[
SSCreateTableRequest
table_id (
owner (
kwargs (	

table_uuid ("%
SSCreateTableResponse
code ("F
SSEnterTableResponse
code (
table_id (
player ("E
SSExitTableResponse
code (
table_id (
player ("G
SSDismissTableResponse
code (
table_id (
owner ("U
SSRefundResponse
code (
table_id (
owner (

table_uuid (