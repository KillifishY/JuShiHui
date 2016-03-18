//
//  NLLink.h
//  newnewle
//
//  Created by tongshunli on 15/4/2.
//  Copyright (c) 2015年 newnewle.com. All rights reserved.
//

#import "AppDelegate.h"
#import "MD5Util.h"
#pragma mark - 所有的连接开头

#define Root_URL @"http://www.newnewle.com/api/3"

//#define Root_URL @"http://101.200.181.241:8080/app_dev.php/api/3"
//#define Root_URL @"http://101.200.189.165/app_dev.php/api/3"

#define HTTP_HEAD @"http://www.newnewle.com"

#pragma mark - 公共参数
/*
    产品类型:pt
    产品标识:pi
    版本号:vn
    渠道:cl
    广告标识符:ai
    mac地址:mac
    设备类型:dt
    设备名:dn
    设备系统版本:sv
    运营商:op
    分辨率:pix
    用户ID:userID
    用户验证:userToken
    时间戳:ct
 */

#define Public_URL [NSString stringWithFormat:@"pt=ios&pi=%@&vn=%@&cl=AppStore&ai=%@&mac=%@&dt=%@&dn=%@&sv=%@&op=%@&pix=%@&userID=%@&userToken=%@&ct=%@",[APP_DELEGATE identification],[APP_DELEGATE versionNumber],[APP_DELEGATE IDFA],[APP_DELEGATE macAddress],[APP_DELEGATE deviceType],[APP_DELEGATE deviceName],[APP_DELEGATE systemVersion],[APP_DELEGATE operators],[APP_DELEGATE resolution],[APP_DELEGATE userID],[APP_DELEGATE verification],[APP_DELEGATE timeStamp]]

#pragma mark - 获取AppStore中应用信息
#define AppStore_URL @"https://itunes.apple.com/cn/app/niu-le-zhuan-zhu-fu-wu-er/id950965415?mt=8"

#pragma mark - 是否启用检查更新
#define Enable_UpDate [Root_URL stringByAppendingFormat:@"/version/check?%@",Public_URL]

#pragma mark - app安装激活
#define App_Install [Root_URL stringByAppendingFormat:@"/version/install?%@",Public_URL]

#pragma mark - app前后台切换
#define App_RunningChange [Root_URL stringByAppendingFormat:@"/version/appRunningType?%@",Public_URL]

#pragma mark - 手机验证
#define CK_URL [Root_URL stringByAppendingFormat:@"/user/check/mobilePhone?%@",Public_URL]

#pragma mark - 注册
#define RT_URL [Root_URL stringByAppendingFormat:@"/user/register?%@",Public_URL]

#pragma mark - 手机号登录
#define MPNTL_URL [Root_URL stringByAppendingFormat:@"/user/login/mobile?%@",Public_URL]

#pragma mark - 更改密码(找回密码)
#define CP_URL [Root_URL stringByAppendingFormat:@"/user/password?%@",Public_URL]

#pragma mark - 用户信息
#define UserInfo_URL(userId) [Root_URL stringByAppendingFormat:@"/user/%@/baseInfo?%@",userId,Public_URL]

#pragma mark - 注册时验证手机是否已注册
#define JYP_URL(phone) [Root_URL stringByAppendingFormat:@"/mobilePhone/isExist?mobilePhone=%@&%@",phone,Public_URL]

#pragma mark - 获取手机(短信)验证码
#define VC_URL(phone) [Root_URL stringByAppendingFormat:@"/user/smsValidCode?mobilePhone=%@&%@",phone,Public_URL]

#pragma mark - 获取手机(图形)验证码
#define VCI_URL(phone) [Root_URL stringByAppendingFormat:@"/valideCode?mobilePhone=%@&%@",phone,Public_URL]

#pragma mark - 第三方登录后通知服务器
#define NS_URL [Root_URL stringByAppendingFormat:@"/user/login/thirdParty?%@",Public_URL]

#pragma mark - 第三方信息注册接口
#define NR_URL [Root_URL stringByAppendingFormat:@"/user/register?%@",Public_URL]

#pragma mark - 个人详细信息(GET)
#define UB_URL(userId) [Root_URL stringByAppendingFormat:@"/user/%@/more?%@",userId,Public_URL]

#pragma mark - 编辑个人信息（POST）
#define BJ_URL(userId, type) [Root_URL stringByAppendingFormat:@"/user/%@/%@?%@",userId,type,Public_URL]

#pragma mark - 地址信息
#define Address_URL @"http://www.newnewle.com/bundles/webappindex/data/citiesJson.js"

#pragma mark - 获取地址信息（POST）
#define Get_AddressURL(userId) [Root_URL stringByAppendingFormat:@"user/%@/address?%@",userId,Public_URL]

#pragma makr - 帮助
#define Le_URL [Root_URL stringByAppendingFormat:@"/usage?%@",Public_URL]

#pragma mark - 知识库类型列表
#define KN_URL [Root_URL stringByAppendingFormat:@"/knowledge/typelist?%@",Public_URL]

#pragma mark - 知识库列表
#define KN_UReL [Root_URL stringByAppendingFormat:@"/knowledge/list/@?%@",,Public_URL]

#pragma mark - 知识库详情


#pragma mark - 我的收藏

#define MyCollection_URL [Root_URL stringByAppendingFormat:@"/user/%@/favorites?type=%d&%@",[APP_DELEGATE userID],(int)_index,Public_URL]

/*
//还未使用
 #pragma mark - 抽奖
 #define Lottery_URL(pageNumber,pageSize) [Root_URL stringByAppendingFormat:@"/lottery?pageNo=%d&pageSize=%d%@",pageNumber,pageSize,Public_URL]

 #pragma mark - 基友圈
 #define JY_URL(pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/api/2/focus/article/list?start=%d&offset=%d&%@",pageNo,pageSize,Public_URL]

 #pragma mark - 主页9个标签列表
 #define Admin_URL(typeNumber,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/api/2/article/filter?type=%d&pageNo=%d&pageSize=%d&%@",typeNumber,pageNo,pageSize,Public_URL]

 #pragma mark - 分享列表(需要修改)
 #define ShareList_URL(messageID,Number,Size) [Root_URL stringByAppendingFormat:@"/api/2/article/%@/share/list?&pageNo=%d&pageSize=%d&%@",messageID,Number,Size, Public_URL]

 */
#pragma mark - 主页全部列表
#define HomeAll_URL(startTime,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/contents?startTime=%d&pageNo=%d&pageSize=%d&%@",startTime,pageNo,pageSize,Public_URL]

#pragma mark - 主页关注列表
#define HomeFocus_URL(startTime,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/contents/recommendList?startTime=%d&pageNo=%d&pageSize=%d&%@",startTime,pageNo,pageSize,Public_URL]

#pragma mark - 主页最新列表
#define HomeNew_URL(startTime,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/contents/newList?startTime=%ld&pageNo=%d&pageSize=%d&%@",startTime,pageNo,pageSize,Public_URL]

#pragma mark - 主页搜索
#define Search_URL(keyword,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/article/search?keyword=%@&pageNo=%d&pageSize=%d&%@",keyword,pageNo,pageSize,Public_URL]

#pragma mark - 标签搜索
#define TagSearch_URL(keyword,parentID,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/tag/search?keyword=%@&parentID=%d&pageNo=%d&pageSize=%d&%@",keyword,parentID,pageNo,pageSize,Public_URL]

#pragma mark - 标签结构列表
#define TagStructureList_URL [Root_URL stringByAppendingFormat:@"/tag/structureList?%@",Public_URL]


#pragma mark - 记录点赞列表
#define RecordPraise_URL(messageID,Number,Size) [Root_URL stringByAppendingFormat:@"/record/%@/praise/list?startID=%d&limit=%d&%@",messageID,Number,Size, Public_URL]

#pragma mark - 帖子点赞列表
#define Praise_URL(messageID,Number,Size) [Root_URL stringByAppendingFormat:@"/article/%@/praise/list?startID=%d&limit=%d&%@",messageID,Number,Size, Public_URL]

#pragma mark - 资讯点赞列表
#define InformationPraise_URL(messageID,Number,Size) [Root_URL stringByAppendingFormat:@"/information/%@/praise/list?startID=%d&limit=%d&%@",messageID,Number,Size, Public_URL]


#pragma mark - 评论列表
#define Comment_URL(messageID,Number,Size,includeStart) [Root_URL stringByAppendingFormat:@"/article/%@/comment/list?&startID=%d&limit=%d&offset=%@&%@",messageID,Number,Size,includeStart, Public_URL]

#pragma mark - 收藏
#define ArticleCollect_URL(articleID) [Root_URL stringByAppendingFormat:@"/favorites/article/%@?%@",articleID,Public_URL]

#pragma mark - 记录收藏
#define RecordCollect_URL(articleID) [Root_URL stringByAppendingFormat:@"/favorites/record/%@?%@",articleID,Public_URL]

#pragma mark - 资讯收藏
#define InformationCollect_URL(articleID) [Root_URL stringByAppendingFormat:@"/favorites/information/%@?%@",articleID,Public_URL]

#pragma mark - 我的收藏
#define MyCollect_URL(userID,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/user/%@/favorites?pageNo=%d&pageSize=%d&%@",userID,pageNo,pageSize,Public_URL]

#pragma mark - 大众圈
#define AAL_URL(pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/article/list?pageNo=%d&pageSize=%d&%@",pageNo,pageSize,Public_URL]

#pragma mark - 某人帖子列表
//#define UAL_URL(userID,start,offset,type) [Root_URL stringByAppendingFormat:@"/user/%@/article/list?startID=%d&limit=%d&type=%d&%@",userID,start,offset,type,Public_URL]

#define UAL_URL(userID,start,offset,type) [Root_URL stringByAppendingFormat:@"/user/%@/article/list?pageNo=%d&pageSize=%d&type=%d&%@",userID,start,offset,type,Public_URL]

#pragma mark - 帖子详情
#define Home_Detail_URL(articleID,Random) [Root_URL stringByAppendingFormat:@"/article/%@/redirect?rt=%ld&%@",articleID,Random,Public_URL]

#pragma mark - 帖子数据
#define Article_Data_URL(articleID) [Root_URL stringByAppendingFormat:@"/article/%@?%@",articleID,Public_URL]

#pragma mark - 记录详情
#define Record_Detail_URL(articleID,Random) [NSString stringWithFormat:@"http://www.newnewle.com/static/recordArticle.html?id=%@&rt=%ld&%@",articleID,Random,Public_URL]

#pragma mark - 帖子数据
#define RecordList_Data_URL(recordID) [Root_URL stringByAppendingFormat:@"/recordCollection/%@?%@",recordID,Public_URL]

#pragma mark - 记录帖子数据
#define Record_Data_URL(recordID) [Root_URL stringByAppendingFormat:@"/record/%@?%@",recordID,Public_URL]


#pragma mark - 记录时间轴页面
#define Home_Record_URL(articleID,Random) [NSString stringWithFormat:@"http://www.newnewle.com/static/record.html?id=%@&rt=%ld&%@",articleID,Random,Public_URL]

#pragma mark - 记录列表
#define Record_List_URL(userID) [Root_URL stringByAppendingFormat:@"/articleFolder/%@/list?%@",userID,Public_URL]

#pragma mark - 获取标签列表,搜索标签，
#define TAGL_URL(NUM,SIZE,RANDOM) [Root_URL stringByAppendingFormat:@"/tag/list?%@&pageNo=%d&pageSize=%d&random=%@", Public_URL,NUM,SIZE,RANDOM]

#pragma mark - 关注人的列表
#define FOCUS_LIST_URL(pageNO,pageSize) [Root_URL stringByAppendingFormat:@"/user/focus/list?%@&pageNo=%d&pageSize=%d", Public_URL,pageNO,pageSize]

#pragma mark - @好友列表
#define FOCUS_Frinds_URL [Root_URL stringByAppendingFormat:@"/user/focus/list?%@", Public_URL]

#pragma mark - 粉丝列表
#define FANS_LIST_URL(pageNO,pageSize) [Root_URL stringByAppendingFormat:@"/user/fans/list?%@&pageNo=%d&pageSize=%d", Public_URL,pageNO,pageSize]

#pragma mark - 获取系统通知信息
#define NOTIFITY_URL(type,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/notification/list?%@&type=%@&pageNo=%d&pageSize=%@", Public_URL,type,pageNo,pageSize]

#pragma mark - 创建帖子接口
#define ART_URL [Root_URL stringByAppendingFormat:@"/article?%@",Public_URL]

#pragma mark - 创建纪录接口
#define Great_Record_URL [Root_URL stringByAppendingFormat:@"/record?%@",Public_URL]

#pragma mark - 关注的人帖子列表
#define FAL_URL [Root_URL stringByAppendingFormat:@"/focus/article/list?%@",Public_URL]

#pragma mark - 群帖子列表
#define GAL_URL(groupId) [Root_URL stringByAppendingFormat:@"/groups/user/%@/article/list?%@",groupId, Public_URL]

#pragma mark - 帖子信息
#define AI_URL(ID) [Root_URL stringByAppendingFormat:@"/article/%@?%@",ID, Public_URL]

#pragma mark - 聊天获取用户信息
#define NI_URL(imID) [Root_URL stringByAppendingFormat:@"/user/byIMID/%@?%@",imID, Public_URL]

#pragma mark - 删除评论
#define DeleteComment(commentID) [Root_URL stringByAppendingFormat:@"/comment/%@?%@",commentID, Public_URL]

#pragma mark - 文章点赞
#define PraiseOn(articleID) [Root_URL stringByAppendingFormat:@"/article/%@/praise?%@",articleID,Public_URL]

#pragma mark - 用户取消文章点赞
#define PraiseOff(articleID) [Root_URL stringByAppendingFormat:@"/article/%@/praise?%@",articleID,Public_URL]

#pragma mark - 资讯点赞
#define InformationPraiseOn(articleID) [Root_URL stringByAppendingFormat:@"/information/%@/praise?%@",articleID,Public_URL]

#pragma mark - 记录点赞
#define RecordPraiseOn(articleID) [Root_URL stringByAppendingFormat:@"/record/%@/praise?%@",articleID,Public_URL]

#pragma mark - 评论点赞
#define commentPraise(articleID) [Root_URL stringByAppendingFormat:@"/comment/%@/praise?%@",articleID,Public_URL]

#pragma mark - 取消评论点赞
#define commentDelePraise(articleID) [Root_URL stringByAppendingFormat:@"/comment/%@/praise?%@",articleID,Public_URL]

#pragma mark - 用户评论
#define CommentAdd(articleID) [Root_URL stringByAppendingFormat:@"/article/%@/comment?%@",articleID, Public_URL]

#pragma mark - 子记录评论
#define RecordCommentAdd(articleID) [Root_URL stringByAppendingFormat:@"/record/%@/comment?%@",articleID, Public_URL]

#pragma mark - 资讯评论
#define InformationCommentAdd(articleID) [Root_URL stringByAppendingFormat:@"/information/%@/comment?%@",articleID, Public_URL]

#pragma mark - 用户分享
#define ShareAdd(articleID) [Root_URL stringByAppendingFormat:@"/article/%@/share?%@",articleID, Public_URL]

#pragma mark - 推送注册关联
#define PushToMe [Root_URL stringByAppendingFormat:@"/user/%@/pushID?%@",[APP_DELEGATE userID],Public_URL]

#pragma mark - 举报文章
#define Report_URL(messageID) [Root_URL stringByAppendingFormat:@"/article/%@/alarm?%@",messageID,Public_URL]

#pragma mark - 举报记录
#define Report_Record_URL(RecordID) [Root_URL stringByAppendingFormat:@"/record/%@/alarm?%@",RecordID,Public_URL]

#pragma mark - 屏蔽某人
#define Shield_URL [Root_URL stringByAppendingFormat:@"/user/black?%@",Public_URL]

#pragma mark - 解除屏蔽
#define RShield_URL(userID) [Root_URL stringByAppendingFormat:@"/user/black/%@?%@",userID,Public_URL]

#pragma mark - 屏蔽人列表
#define ShieldList_URL [Root_URL stringByAppendingFormat:@"/user/black/list?%@", Public_URL]


#pragma mark - 关注某人
#define ADD_FANS_URL [Root_URL stringByAppendingFormat:@"/user/focus?%@", Public_URL]

#pragma mark - 取消关注某人
#define DEL_DANS_URL(userid) [Root_URL stringByAppendingFormat:@"/user/focus/%@?%@",userid, Public_URL]

#pragma mark - 扭蛋列表
#define NuiDanList_URL [Root_URL stringByAppendingFormat:@"/gacha/list?%@", Public_URL]

#pragma mark - 扭蛋获得的奖品
#define NuiDanOver_URL(gachaID) [Root_URL stringByAppendingFormat:@"/gacha/%@?%@",gachaID, Public_URL]

#pragma mark - 扭蛋奖品列表
#define AwardList_URL(awardID) [Root_URL stringByAppendingFormat:@"/gacha/%@/award/list?%@",awardID, Public_URL]

#pragma mark - 积分扭蛋
#define GachaExchage_URL(gachaID) [Root_URL stringByAppendingFormat:@"/gacha/%@/exchangeGachaLimit?%@",gachaID, Public_URL]


#pragma mark - 上传通讯录
#define POST_MAIL_LIST [Root_URL stringByAppendingFormat:@"/user/contacters?%@", Public_URL]

#pragma mark - 好友推荐
#define RecommendFocus_LIST(token,tags) [Root_URL stringByAppendingFormat:@"/user/recommendFocus?%@&randomToken=%@&userTags=%@", Public_URL, token, tags]//[Root_URL stringByAppendingFormat:@"/api/2/user/recommendFocus?%@&randomToken=%@&userTags=%@", Public_URL, token, tags]

///api/2/user/{userID}/focus/patch
#pragma mark - 批量关注人
#define PATCH_FOCUS [Root_URL stringByAppendingFormat:@"/user/focus/patch?%@", Public_URL]
//活动页面接口
#pragma mark - 轮播视图
#define Cycleplay_URL [Root_URL stringByAppendingFormat:@"/recommend/slide/list?%@", Public_URL]

#pragma mark - 活动信息列表
#define ActivityList_URL(pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/activity/list?%@&pageNo=%d&pageSize=%d",Public_URL,pageNo,pageSize]

#pragma mark - 活动讨论信息列表
#define ActivityDiscussList_URL(ActivityID,startID,size) [Root_URL stringByAppendingFormat:@"/activity/%@/comment/list?%@&startID=%d&limit=%d",ActivityID,Public_URL,startID,size]

#pragma mark - 活动详情
#define ActivityDetail_URL(ActivityID) [Root_URL stringByAppendingFormat:@"/activity/%@?%@",ActivityID,Public_URL]

#pragma mark - 活动帖列表
#define ActivityArticleList_URL(ActivityID,pageNo,pageSize) [Root_URL stringByAppendingFormat:@"/activity/%@/article/list?%@&pageNo=%d&pageSize=%d",ActivityID,Public_URL,pageNo,pageSize]

#pragma mark - 活动投票项列表
#define ActivityVoteList_URL(ActivityID) [Root_URL stringByAppendingFormat:@"/activity/%@/voteList?%@",ActivityID,Public_URL]

#pragma mark - 新建活动讨论
#define ADDActivityDiscuss_URL(ActivityID) [Root_URL stringByAppendingFormat:@"/activity/%@/comment?%@",ActivityID,Public_URL]

#pragma mark - 删除活动讨论
#define DElActivityDiscuss_URL(ActivityID,CommentID) [Root_URL stringByAppendingFormat:@"/activity/%@/comment/%@?%@",ActivityID,CommentID,Public_URL]

#pragma mark - 举报活动讨论
#define ReportActivityDiscuss_URL(ActivityID,CommentID) [Root_URL stringByAppendingFormat:@"/activity/%@/comment/%@/alarm?%@",ActivityID,CommentID,Public_URL]

#pragma mark - 新增活动投票
#define ADDActivityVote_URL(ActivityID) [Root_URL stringByAppendingFormat:@"/activity/%@/voteList?%@",ActivityID,Public_URL]

#pragma mark - 删除活动投票
#define DELActivityVote_URL(ActivityID,ItemID) [Root_URL stringByAppendingFormat:@"/activity/%@/voteList/%@?%@",ActivityID,ItemID,Public_URL]

#pragma mark - 扭蛋主页
#define Tosion_URL [Root_URL stringByAppendingFormat:@"/?%@",Public_URL]

//芒果广告是否显示
#define MangGuoIsShow [Root_URL stringByAppendingFormat:@"/ad/bottombar/isShow?%@", Public_URL]

#pragma mark - 芒果广告ID
#define AMGID @"88134ed9679e4225b22a3ed762e4631a"//@"bb0bf739cd8f4bbabb74bbaa9d2768bf"//

#pragma mark - 分享成功后回调接口
#define Share_URL [Root_URL stringByAppendingFormat:@"/shareBack?%@",Public_URL]

#pragma mark - 设置手机号
#define SetPhone_URL [Root_URL stringByAppendingFormat:@"/user/mobilePhone?%@",Public_URL]

#pragma mark - 我的奖品
#define MyAward [Root_URL stringByAppendingFormat:@"/myaward?%@",Public_URL]

#pragma mark - 获取分享文案接口
#define SHARE_COPY [Root_URL stringByAppendingFormat:@"/share/template?%@", Public_URL]

#pragma mark - 获取帖子分享文案接口
#define Article_Share(ID,scene) [Root_URL stringByAppendingFormat:@"/article/%@/shareTemplate?%@&scene=%d",ID, Public_URL, scene]

#pragma mark - 获取记录分享文案接口
#define Record_Share(ID, scene) [Root_URL stringByAppendingFormat:@"/record/%@/shareTemplate?%@&scene=%d",ID, Public_URL, scene]

#pragma mark - 获取资讯分享文案接口
#define Information_Share(ID) [Root_URL stringByAppendingFormat:@"/information/%@/shareTemplate?%@", ID,Public_URL]

#pragma mark - 帖子分享回调
#define Article_ShareBack(ID) [Root_URL stringByAppendingFormat:@"/article/%@/shareback?%@",ID, Public_URL]

#pragma mark - 记录分享回调
#define Record_ShareBack(ID) [Root_URL stringByAppendingFormat:@"/record/%@/shareback?%@",ID, Public_URL]

#pragma mark - 资讯分享回调
#define Information_ShareBack(ID) [Root_URL stringByAppendingFormat:@"/information/%@/shareback?%@", ID,Public_URL]

#pragma mark - 活动分享回调
#define Activity_ShareBack(ID) [Root_URL stringByAppendingFormat:@"/activity/%@/shareback?%@", ID,Public_URL]

#pragma mark - 上传用户当前经纬度
#define POST_COOR(userID) [Root_URL stringByAppendingFormat:@"/user/%@/location?%@", userID, Public_URL]

#pragma mark - 扭蛋奖品列表
#define MyAward_URL(gachaID) [Root_URL stringByAppendingFormat:@"/gacha/%@/award/list?%@", gachaID, Public_URL]

#pragma mark - 我的扭蛋奖品列表
#define MY_GACHA_URL [Root_URL stringByAppendingFormat:@"/user/award/list?%@", Public_URL]

#pragma mark - 分享扭蛋
#define ShareGacha_URL(gachaID) [Root_URL stringByAppendingFormat:@"/share/gacha/%@?%@",gachaID,Public_URL]

#pragma mark - 删除文章
#define DeleteMessage_URL(messageID) [Root_URL stringByAppendingFormat:@"/article/%@?%@",messageID,Public_URL]

#pragma mark - 删除记录
#define Delete_Record_URL(messageID) [Root_URL stringByAppendingFormat:@"/record/%@?%@",messageID,Public_URL]

#pragma mark - 获取广告引导信息
#define GUIDE_URL [Root_URL stringByAppendingFormat:@"/ad/guide/list?%@",Public_URL]

#pragma mark - 预约接口
#define PreRegister(gachaID) [Root_URL stringByAppendingFormat:@"/gacha/preRegister/%@?%@",gachaID,Public_URL]


#pragma mark - 删除通知信息
#define DELE_NOTI(ID) [Root_URL stringByAppendingFormat:@"/notification/%d?%@", ID, Public_URL]

#pragma mark - 反馈
#define FEED_BACK [Root_URL stringByAppendingFormat:@"/user/feedback?%@", Public_URL]


#pragma mark - 扭蛋分享内容模板
#define Gacha_Share_Content(gachaID) [Root_URL stringByAppendingFormat:@"/share/gacha/%@/template?%@", gachaID, Public_URL]

#pragma mark - 活动分享模板
#define Activity_Share_Content(activityID) [Root_URL stringByAppendingFormat:@"/share/activity/%@/template?%@", activityID, Public_URL]

#pragma mark - 每次APP启动调用接口
#define APP_START [Root_URL stringByAppendingFormat:@"/app/launchlog?%@", Public_URL]

#pragma nark - APP第一次启动调用接口
#define APP_FRIST_START [Root_URL stringByAppendingFormat:@"/app/startlog?%@", Public_URL]

#pragma mark - 获取发记录推荐标签
#define GET_Record_TAG(page,size) [Root_URL stringByAppendingFormat:@"/tag/list?pageNo=%d&pageSize=%d&%@", page, size, Public_URL]

#pragma mark - 获取推荐用户
#define GET_USER(page, size) [Root_URL stringByAppendingFormat:@"/recommend/user/list?pageNo=%d&pageSize=%d&%@", page, size, Public_URL]

#pragma mark - 设置用户地址
#define Set_userAddress(userID) [Root_URL stringByAppendingFormat:@"/user/%@/address?%@",userID, Public_URL]

#pragma mark - 全局搜索
#define SEARCH_global(keyword) [Root_URL stringByAppendingFormat:@"/global/search?keyword=%@&%@", keyword, Public_URL]

#pragma mark - 用户搜索
#define USER_SEARCH(keyword, pageNum, pageSize) [Root_URL stringByAppendingFormat:@"/user/search?keyword=%@&pageNo=%d&pageSize=%d&%@", keyword, pageNum, pageSize, Public_URL]
#pragma mark - 活动搜索
#define SEARCH_Activity(keyword, pageNum, pageSize) [Root_URL stringByAppendingFormat:@"/activity/search?keyword=%@&pageNo=%d&pageSize=%d&%@", keyword, pageNum, pageSize, Public_URL]


#pragma mark - 心愿列表
#define DL_URL [Root_URL stringByAppendingFormat:@"/wish/list?%@",Public_URL]


#pragma mark - 心愿详情
#define DD_URL(DID) [Root_URL stringByAppendingFormat:@"/wish/%@?%@", DID, Public_URL]


#pragma mark - 支持心愿
#define SD_URL(DID) [Root_URL stringByAppendingFormat:@"/wish/%@/support?%@", DID, Public_URL]


#pragma mark - 获取启动图
#define Pic_Start [Root_URL stringByAppendingFormat:@"/system/launchimage?%@&ct=ios&vn=%@", Public_URL,[APP_DELEGATE versionNumber]]


#pragma mark - 发送小纸条
#define Send_Paper [Root_URL stringByAppendingFormat:@"/note/add?%@", Public_URL]


#pragma mark - 活动详情参与活动按钮
#define Activity_Participate(activityID) [Root_URL stringByAppendingFormat:@"/activity/%d/intoParticipateActivityPage?%@", activityID, Public_URL]

#pragma mark - 纸条列表
#define Paper_List [Root_URL stringByAppendingFormat:@"/note/list?%@", Public_URL]


#pragma mark - 推荐帖子
#define  Recommend_The_Post(num,size) [Root_URL stringByAppendingFormat:@"/article/list/recommend?%@&pageNo=%d&pageSize=%d", Public_URL, num, size]


#pragma mark - 获取用户的地址信息
#define User_Address [Root_URL stringByAppendingFormat:@"/user/%@/address?%@", [APP_DELEGATE userID], Public_URL]

#pragma mark - 用户退出登录 参数：logoutType: 1 被顶掉  ，2  主动退出
#define USER_LOGIN_OUT [Root_URL stringByAppendingFormat:@"/user/loginout?%@", Public_URL]



#pragma mark - 积分兑换链接

#pragma mark - 积分兑换奖品列表
#define Integral_Prize_List(startID, limit) [Root_URL stringByAppendingFormat:@"/pointsAward/list?%@&startID=%d&limit=%d", Public_URL, startID, limit]

//兑换详情
#define Prize_Detail(prizeID) [Root_URL stringByAppendingFormat:@"/pointsAward/%d?%@", prizeID, Public_URL]

#pragma mark - 兑换接口
#define Integral_exchange(prizeID) [Root_URL stringByAppendingFormat:@"/pointsAward/%d/exchange?%@", prizeID, Public_URL]

#pragma mark - 兑换记录
#define Score_Sell_List(userID) [Root_URL stringByAppendingFormat:@"/user/%d/pointsAward/exchange/list?%@", userID, Public_URL]

#pragma mark - 兑换个人数据
#define Points_User(UserID) [Root_URL stringByAppendingFormat:@"/user/%@/points?%@", UserID, Public_URL]


#pragma mark - 福利拍卖

#pragma mark - 拍卖列表
#define Auction_List [Root_URL stringByAppendingFormat:@"/auction/list?%@", Public_URL]

#pragma mark - 拍卖品详情
#define Auction_Detail(auctionID)  [Root_URL stringByAppendingFormat:@"/auction/%d?%@", auctionID, Public_URL]

#pragma mark - 拍卖提醒
#define Auction_Remind(auctionID) [Root_URL stringByAppendingFormat:@"/auction/remind/%d?%@", auctionID, Public_URL]

#pragma mark - 刷新出价列表
#define Reload_Price(auctionID)  [Root_URL stringByAppendingFormat:@"/auction/reloadPrice/%d?%@", auctionID, Public_URL]

#pragma mark - 立即出价
#define Auction_Pay(auctionID)  [Root_URL stringByAppendingFormat:@"/auction/pay/%d?%@", auctionID, Public_URL]


#pragma mark - 我的拍卖列表
#define Auction_My_List  [Root_URL stringByAppendingFormat:@"/auction/mylist?%@", Public_URL]

#pragma mark - 获取支付订单数据
#define Get_Order_Info(ID) [Root_URL stringByAppendingFormat:@"/auction/sendpayinfo/%d?%@", ID, Public_URL]

#pragma mark - 资源列表
#define Resource_List(ResourceID)  [Root_URL stringByAppendingFormat:@"/resource/list/%@?%@",ResourceID, Public_URL]

#pragma mark - 资源类型列表
#define Resource_Type_List()  [Root_URL stringByAppendingFormat:@"/resource/typelist?%@", Public_URL]

#pragma mark - 资源详情
#define Resource_Detail(ResourceID)  [Root_URL stringByAppendingFormat:@"/resource/detail/%@?%@",ResourceID, Public_URL]

#pragma mark - 资源搜索
#define Resource_Search(keyword)  [Root_URL stringByAppendingFormat:@"/resource/seaerchResource?keyword=%@&%@",keyword, Public_URL]

#pragma mark - 资讯列表
#define Information_List(pageNum,pageSize)  [Root_URL stringByAppendingFormat:@"/information/list?pageNo=%d&pageSize=%d&%@", pageNum,pageSize,Public_URL]

#pragma mark - 资讯详情
#define Information_Detail(informationID,random)  [NSString stringWithFormat:@"http://www.newnewle.com/static/information.html?id=%@&rt=%ld&%@",informationID,random,Public_URL]

#pragma mark - 资讯详情数据
#define Information_Data_Url(informationID)  [Root_URL stringByAppendingFormat:@"/information/%@?%@", informationID,Public_URL]

#pragma mark - 资讯搜索
#define Information_Search(keyword)  [Root_URL stringByAppendingFormat:@"/information/search?keyword=%@&%@",keyword, Public_URL]

#pragma mark - 视频类别列表
#define Video_List  [Root_URL stringByAppendingFormat:@"/video/typelist?%@", Public_URL]

#pragma mark - 视频列表
#define Video_Detail_List(videoID)  [Root_URL stringByAppendingFormat:@"/video/list/%@?%@",videoID, Public_URL]

#pragma mark - 视频详情
#define Video_Detail(VideoID)  [Root_URL stringByAppendingFormat:@"/video/detail/%@?%@",VideoID, Public_URL]

#pragma mark - 签到
//http://www.newnewle.com/app_dev.php/api/3/signin/check?logtime=1449472741&dt=test&userID=1000001&userToken=9a1ec5d894b22cb51ae3ee36b6173774&cl=test&pt=android&mac=test&vn=test&sv=test
#pragma mark - 检查签到
#define Check_signin [Root_URL stringByAppendingFormat:@"/signin/check?%@", Public_URL]

#pragma mark - 今日签到
#define Send_signin [Root_URL stringByAppendingFormat:@"/signin/send?%@", Public_URL]

#pragma mark - 获取签到积分
#define Send_SendScore [Root_URL stringByAppendingFormat:@"/signin/sendscore?%@", Public_URL]

#pragma mark - 补签
#define Remedy_signin  [Root_URL stringByAppendingFormat:@"/signin/remedy?%@", Public_URL]

#pragma mark - 忘记密码（设置密码）
#define Forget_Password [Root_URL stringByAppendingFormat:@"/resetPassword?%@", Public_URL]

#pragma mark - 修改密码
#define Change_Password(userID) [Root_URL stringByAppendingFormat:@"/user/%@/password?%@", userID, Public_URL]

#pragma mark - 绑定手机号
#define Binding_MobilePhone(userId) [Root_URL stringByAppendingFormat:@"/user/%@/mobilePhone?%@", userId, Public_URL]

#pragma mark - 邀请

#pragma mark - 获取邀请码
#define Get_InviteCode(userId) [Root_URL stringByAppendingFormat:@"/user/%@/inviteCode?%@", userId, Public_URL]

#pragma mark - 填邀请码领积分
#define Send_InviteCode(userId) [Root_URL stringByAppendingFormat:@"/user/%@/invitedCode?%@", userId, Public_URL]


#pragma mark - 发现滚动广告
#define AD_SlideAdList(type) [Root_URL stringByAppendingFormat:@"/ad/slideAdList?column=%d&%@",type, Public_URL]

#pragma mark - 获取用户通知消息未读数
#define User_Notify_Unread(userId) [Root_URL stringByAppendingFormat:@"/notification/%@/unread?%@", userId, Public_URL]


#import <Foundation/Foundation.h>

@interface NLLink : NSObject

+ (NSString *)makeMyMd5;

@end
