local T = bm.PACKET_DATA_TYPE
PROTOCOL_FORMAT_DICT = {}
PROTOCOL_FORMAT_DICT[0x4000] = {fmt={{name = "msg_data", type = T.STRING}}}--登陆错误
PROTOCOL_FORMAT_DICT[0x4001] = {fmt={{name = "msg_data", type = T.STRING}}}--刷新用户列表
PROTOCOL_FORMAT_DICT[0x4002] = {fmt={{name = "msg_data", type = T.STRING}}}--广播玩家发牌

PROTOCOL_FORMAT_DICT[0x1004] = {fmt={
{name = "uid", type = T.INT},
{name = "type", type = T.INT},
}}
PROTOCOL_FORMAT_DICT[0x4003] = {fmt={{name = "msg_data", type = T.STRING}}}--广播抢庄结果
PROTOCOL_FORMAT_DICT[0x4004] = {fmt={{name = "msg_data", type = T.STRING}}}--广播游戏结果
PROTOCOL_FORMAT_DICT[0x4005] = {fmt={{name = "msg_data", type = T.STRING}}}--广播组局结果
PROTOCOL_FORMAT_DICT[0x4006] = {fmt={{name = "msg_data", type = T.STRING}}}--广播账号准备
PROTOCOL_FORMAT_DICT[0x4007] = {fmt={{name = "msg_data", type = T.STRING}}}--广播账号抢庄
PROTOCOL_FORMAT_DICT[0x4008] = {fmt={{name = "msg_data", type = T.STRING}}}--广播账号选择倍数
PROTOCOL_FORMAT_DICT[0x4009] = {fmt={{name = "msg_data", type = T.STRING}}}--广播解散房间失败
PROTOCOL_FORMAT_DICT[0x400a] = {fmt={{name = "msg_data", type = T.STRING}}}--广播刷新解散列表
PROTOCOL_FORMAT_DICT[0x400b] = {fmt={{name = "msg_data", type = T.STRING}}}--请求弹出对话框
PROTOCOL_FORMAT_DICT[0x400c] = {fmt={{name = "msg_data", type = T.STRING}}}--请求删除对话框
