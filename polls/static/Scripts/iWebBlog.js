//
// iWeb - iWebBlog.js
// Copyright 2007-2008 Apple Inc.
// All rights reserved.
//

function BlogRootURLString(inUrlString)
{var urlString=inUrlString.urlStringByDeletingQueryAndFragment();var index=urlString.search(/\/\d{4}\/\d{1,2}\//);if(index!=-1)
{return urlString.substr(0,index).stringByDeletingLastPathComponent();}
return urlString.substr(0,urlString.lastIndexOf("/"));}
function BlogRootURL(inUrlString)
{return new IWURL(BlogRootURLString(inUrlString));}
function BlogFixupPreviousNext()
{var currentUrl=locationHRef().urlStringByDeletingQueryAndFragment();window.blogFeed=new BlogFeed(BlogRootURLString(locationHRef()),true,function(blogFeed)
{var prevNextLinks=$$(".iWebBlogPrev",".iWebBlogNext");prevNextLinks.each(function(anchor)
{var targetItem=null;if(anchor.hasClassName("iWebBlogPrev"))
{targetItem=blogFeed.itemBefore(currentUrl);}
else if(anchor.hasClassName("iWebBlogNext"))
{targetItem=blogFeed.itemAfter(currentUrl);}
if(targetItem)
{anchor.href=targetItem.absoluteURL.toURLString();anchor.title=targetItem.title;}});});}
function BlogPreviousPage()
{var currentUrlString=locationHRef().urlStringByDeletingQueryAndFragment();var targetUrlString=window.blogFeed.itemBefore(currentUrlString);location.href=targetUrlString;}
function BlogNextPage()
{var currentUrlString=locationHRef().urlStringByDeletingQueryAndFragment();var targetUrlString=window.blogFeed.itemAfter(currentUrlString);location.href=targetUrlString;}
function BlogMainPageItem()
{var blogURLString=BlogRootURLString(locationHRef());if(window.iWebBlogMainPageName===undefined)
{window.iWebBlogMainPageTitle=blogURLString.lastPathComponent();window.iWebBlogMainPageName=window.iWebBlogMainPageTitle+".html";}
blogURLString=blogURLString.stringByAppendingPathComponent(window.iWebBlogMainPageName);return{absoluteURL:new IWURL(blogURLString),title:window.iWebBlogMainPageTitle};}
function BlogArchivePageItem()
{var blogURLString=BlogRootURLString(locationHRef());if(window.iWebBlogArchivePageName===undefined)
{window.iWebBlogArchivePageTitle="Archive";window.iWebBlogArchivePageName=window.iWebBlogArchivePageTitle+".html";}
blogURLString=blogURLString.stringByAppendingPathComponent(window.iWebBlogArchivePageName);return{absoluteURL:new IWURL(blogURLString),title:window.iWebBlogArchivePageTitle};}
var BlogFeed=Class.create({initialize:function(inBlogUrlString,inIsArchive,inCallback)
{this.mBlogURL=new IWURL(inBlogUrlString);this.mIsArchive=inIsArchive;var feedUrlString=inIsArchive?"blog-archive.xml":"blog-main.xml";feedUrlString=inBlogUrlString.stringByAppendingPathComponent(feedUrlString);delete this.mItems;new Ajax.Request(feedUrlString,{method:'get',onSuccess:function(request){this.p_parseFeed(ajaxGetDocumentElement(request));}.bind(this),onComplete:function()
{inCallback(this);}.bind(this)});},p_parseFeed:function(rssDoc)
{this.mDateFormat="EEEE, MMMM d, yyyy";this.mBaseURL=new IWURL();this.mMaximumSummaryItems=10;this.mItems=[];var channel=rssDoc.getElementsByTagName("channel")[0];var dateFormat=BlogFeed.getiWebElementText(channel,"dateFormat");var maximumSummaryItems=BlogFeed.getiWebElementText(channel,"maximumSummaryItems");var baseURLString=BlogFeed.getiWebElementText(channel,"baseURL");if(dateFormat)
this.mDateFormat=dateFormat;if(maximumSummaryItems)
this.mMaximumSummaryItems=maximumSummaryItems;if(baseURLString)
{this.mBaseURL=new IWURL(baseURLString);}
var itemNodes=channel.getElementsByTagName("item");for(var i=0;i<itemNodes.length;++i)
{var itemNode=itemNodes[i];var item;try
{item=new BlogFeed.FeedItem(itemNode);if(this.mBaseURL)
{item.relativeURL=item.absoluteURL.relativize(this.mBaseURL);item.absoluteURL=item.relativeURL.resolve(this.mBlogURL);if(item.commentURL)
{item.relativeCommentURL=item.commentURL.relativize(this.mBaseURL);}}
this.mItems.push(item);}
catch(e)
{debugPrintException(e);}}},itemCount:function()
{if(this.mItems===undefined)
return 0;return this.mItems.length;},itemAtIndex:function(index)
{return this.mItems[index];},dateFormat:function()
{return this.mDateFormat;},maximumItemsToDisplay:function()
{var result=this.itemCount();if(!this.mIsArchive&&(this.mMaximumSummaryItems>0)&&(this.mMaximumSummaryItems<result))
{result=this.mMaximumSummaryItems;}
return result;},dumpFeed:function()
{print("dumping a feed with %s items",this.itemCount());for(var i=0;i<this.itemCount();++i)
{printObject(this.itemAtIndex(i));}},itemAfter:function(urlString)
{var afterIndex=null;var url=new IWURL(urlString);for(var i=0;i<this.mItems.length;++i)
{if(url.isEqual(this.mItems[i].absoluteURL))
{afterIndex=i-1;break;}}
if(afterIndex<0)
return BlogArchivePageItem();else
return this.mItems[afterIndex];},itemBefore:function(urlString)
{var beforeIndex=null;var url=new IWURL(urlString);for(var i=0;i<this.mItems.length;++i)
{if(url.isEqual(this.mItems[i].absoluteURL))
{beforeIndex=i+1;break;}}
if(beforeIndex<this.mItems.length)
return this.mItems[beforeIndex];else
return BlogMainPageItem();}});Object.extend(BlogFeed,{iwebNS:"http://www.apple.com/iweb",getiWebElement:function(itemNode,propertyName)
{return getFirstChildElementByTagNameNS(itemNode,BlogFeed.iwebNS,"iweb",propertyName);},getiWebElementText:function(itemNode,propertyName)
{return getChildElementTextByTagNameNS(itemNode,BlogFeed.iwebNS,"iweb",propertyName);},fixupURL:function(url)
{return url.replace("file://localhost/","file:///");},FeedItem:function(itemNode)
{var child=itemNode.firstChild;while(child)
{if(child.nodeType==Node.ELEMENT_NODE)
{if(child.tagName=='title')
{this.title=getTextFromNode(child);}
else if(child.tagName=='link')
{this.p_linkText=getTextFromNode(child);this.absoluteURL=new IWURL(this.p_linkText);}
else if(child.tagName=='description')
{this.description=getTextFromNode(child);}
else if(child.tagName=='pubDate')
{var dateText=getTextFromNode(child);if(dateText&&dateText.length>0)
this.date=new Date(dateText);}
else if(child.tagName=='iweb:image')
{this.imageUrlString=child.getAttribute("href");this.imageURL=new IWURL(this.imageUrlString);}
else if(child.tagName=='iweb:comment')
{this.commentCount=child.getAttribute("count");this.commentingEnabled=(child.getAttribute("enabled")==1);this.commentURL=new IWURL(child.getAttribute("link"));}
else if(child.tagName=='iweb:badge')
{iWLog("child.tagName='iweb:badge' type='"+child.getAttribute("type")+"'");this.badgeType=child.getAttribute("type");}}
child=child.nextSibling;}
this.title=this.title||"";this.absoluteURL=this.absoluteURL||new IWURL();this.date=this.date||new Date();this.commentingEnabled=this.commentingEnabled||false;this.commentCount=this.commentCount||0;}});function iWebInitSearch()
{try
{setLocale();initSearch();}
catch(e)
{}}
function dynamicallyPopulate()
{var contentXml=getContentXmlURL();if(contentXml==null)
{var baseUrl=String(this.location).urlStringByDeletingQueryAndFragment();contentXml=String(baseUrl).replace(/\.html$/,'.xml');}
var populateDomWithContentFromXML=function(request)
{var contentDoc=ajaxGetDocumentElement(request);$A(contentDoc.getElementsByTagName('textBox')).each(function(textbox){try{dynamicallyPopulateTextBox(textbox);}catch(e){}});$A(contentDoc.getElementsByTagName('image')).each(function(image){try{dynamicallyPopulateImage(image);}catch(e){}});};new Ajax.Request(contentXml,{method:'get',onSuccess:populateDomWithContentFromXML});}
function dynamicallyPopulateTextBox(textBoxElement)
{if(textBoxElement)
{var id=textBoxElement.getAttribute('id');var htmlElement=$(id);if(htmlElement)
{var htmlParent=htmlElement.parentNode;if(textBoxElement.getAttribute('visible')=='yes')
{if(textBoxElement.getAttribute('dynamic')=='yes')
{var content=String(getChildElementTextByTagName(textBoxElement,'richText'));htmlElement.innerHTML=content;htmlParent.innerHTML=htmlElement.outerHTML;}
htmlParent.style.visibility='visible';}}}}
function dynamicallyPopulateImage(imageElement)
{if(imageElement)
{var id=imageElement.getAttribute('id');var htmlElement=$(id);if(htmlElement)
{if(imageElement.getAttribute('visible')=='yes')
{if(imageElement.getAttribute('dynamic')=='yes')
{htmlElement.src=imageElement.getAttribute('src');htmlElement.setStyle({left:imageElement.getAttribute('left'),top:imageElement.getAttribute('top'),width:imageElement.getAttribute('width'),height:imageElement.getAttribute('height')});}
htmlElement.style.visibility='visible';}}}}
function getContentXmlURL()
{var params=locationHRef().toQueryParams();return params['content'];}
var HTMLTextModel=Class.create({initialize:function(node)
{this.indexArray=[];this.nodeArray=[];this.cachedNode=null;this.cachedNodeStart=null;this.cachedNodeEnd=null;this.rootNode=node;this.buildTextModel(node);},buildTextModel:function(node)
{for(var i=0;i<node.childNodes.length;++i)
{var childNode=node.childNodes[i];if(childNode.nodeType==Node.TEXT_NODE)
{this.nodeArray.push(childNode);this.indexArray.push((this.indexArray.length===0?0:this.indexArray[this.indexArray.length-1])+childNode.nodeValue.length);this.length=this.indexArray[this.indexArray.length-1];}
else if(childNode.nodeType==Node.ELEMENT_NODE)
{this.buildTextModel(childNode);}}},nodeIndexForCharacterIndex:function(index)
{var nodeIndex;for(var i=0;i<this.nodeArray.length;++i)
{if(index<this.indexArray[i])
{nodeIndex=i;break;}}
return nodeIndex;},characterAtIndex:function(index)
{if((this.cachedNode==null)||(index<this.cachedNodeStart)||(index>=this.cachedNodeEnd))
{this.cachedNode=null;var nodeIndex=this.nodeIndexForCharacterIndex(index);if(nodeIndex!==undefined)
{this.cachedNode=this.nodeArray[nodeIndex];this.cachedNodeStart=nodeIndex===0?0:this.indexArray[nodeIndex-1];this.cachedNodeEnd=this.cachedNodeStart+this.cachedNode.nodeValue.length;}}
if(this.cachedNode)
{return this.cachedNode.nodeValue.charAt(index-this.cachedNodeStart);}
return"";},truncateAtIndex:function(index,suffix)
{var nodeIndex=this.nodeIndexForCharacterIndex(index);if(nodeIndex!==undefined)
{var node=this.nodeArray[nodeIndex];var subIndex=index-(nodeIndex===0?0:this.indexArray[nodeIndex-1]);node.nodeValue=node.nodeValue.substr(0,subIndex);if(suffix)
{node.nodeValue=node.nodeValue+suffix;}
while(node!=this.rootNode)
{while(node.nextSibling!=null)
{node.parentNode.removeChild(node.nextSibling);}
node=node.parentNode;}}},truncateAroundPosition:function(index,suffix)
{var isWordBreakCharacter=function(oneCharString)
{if(oneCharString==null)
{return false;}
var ch=oneCharString.charCodeAt(0);return(ch==0x0020)||(ch==0x000a)||(ch==0x000d)||(ch==0x00a0)||(ch==0x1680)||(ch>=0x2000&&ch<=0x200b)||(ch==0x202f)||(ch==0x205f)||(ch==0x3000)||(ch==0x2014);};var pos=index;if(pos>=this.length)
{return;}
while(pos>=0)
{if(isWordBreakCharacter(this.characterAtIndex(pos)))
{while(pos>0&&isWordBreakCharacter(this.characterAtIndex(pos)))
{pos--;}
pos++;this.truncateAtIndex(pos,suffix);return;}
pos--;}
this.truncateAtIndex(index,suffix);}});Date.prototype.ampmHour=function()
{var hour=this.getHours();if(hour>=12)hour-=12;if(hour==0)hour=12;return hour;}
Date.abbreviatedMonthNameKeys=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];Date.abbreviatedWeekdayNameKeys=["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];Date.ampmKeys=["AM","PM"];Date.fullMonthNameKeys=["January","February","March","April","May","June","July","August","September","October","November","December"];Date.fullWeekdayNameKeys=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];Date.localizedTableLookup=function(table,index,localizer)
{var string=table[index];if(localizer)
{string=localizer.localizedString(string);}
return string;}
Date.abbreviatedMonthName=function(index,localizer)
{return Date.localizedTableLookup(Date.abbreviatedMonthNameKeys,index,localizer);}
Date.abbreviatedWeekdayName=function(index,localizer)
{return Date.localizedTableLookup(Date.abbreviatedWeekdayNameKeys,index,localizer);}
Date.ampmName=function(index,localizer)
{return Date.localizedTableLookup(Date.ampmKeys,index,localizer);}
Date.fullWeekdayName=function(index,localizer)
{return Date.localizedTableLookup(Date.fullWeekdayNameKeys,index,localizer);}
Date.fullMonthName=function(index,localizer)
{return Date.localizedTableLookup(Date.fullMonthNameKeys,index,localizer);}
var formatConversion={"y1":function(d,localizer){return d.getFullYear();},"y2":function(d,localizer){return("0"+d.getFullYear()).slice(-2);},"y4":function(d,localizer){return("0000"+d.getFullYear()).slice(-4);},"M4":function(d,localizer){return Date.fullMonthName(d.getMonth(),localizer);},"M3":function(d,localizer){return Date.abbreviatedMonthName(d.getMonth(),localizer);},"M2":function(d,localizer){return("0"+(d.getMonth()+1)).slice(-2);},"M1":function(d,localizer){return String(d.getMonth()+1);},"d2":function(d,localizer){return("0"+d.getDate()).slice(-2);},"d1":function(d,localizer){return d.getDate();},"h2":function(d,localizer){return("0"+d.ampmHour()).slice(-2);},"h1":function(d,localizer){return d.ampmHour();},"H2":function(d,localizer){return("0"+d.getHours()).slice(-2);},"H1":function(d,localizer){return d.getHours();},"m2":function(d,localizer){return("0"+d.getMinutes()).slice(-2);},"m1":function(d,localizer){return d.getMinutes();},"s2":function(d,localizer){return("0"+d.getSeconds()).slice(-2);},"s1":function(d,localizer){return d.getSeconds();},"E4":function(d,localizer){return Date.fullWeekdayName(d.getDay(),localizer);},"E3":function(d,localizer){return Date.abbreviatedWeekdayName(d.getDay(),localizer);},"a1":function(d,localizer){return(d.getHours()<12)?Date.ampmName(0,localizer):Date.ampmName(1,localizer);}};Date.prototype.stringWithContextualOrICUDateFormat=function(fullFormat,contextualFormat,localizer)
{var result;var now=new Date();var beginningOfToday=new Date(now.getFullYear(),now.getMonth(),now.getDate());var beginningOfYesterday=new Date(Number(beginningOfToday.getTime())-24*60*60*1000);var beginningOfTomorrow=new Date(Number(beginningOfToday.getTime())+24*60*60*1000);var contextualDate;if((this.getTime()>=beginningOfToday.getTime())&&(this.getTime()<beginningOfTomorrow.getTime()))
{contextualDate=localizer.localizedString("Today");}
else if((this.getTime()>=beginningOfYesterday.getTime())&&(this.getTime()<beginningOfToday.getTime()))
{contextualDate=localizer.localizedString("Yesterday");}
if(contextualDate)
{result=this.stringWithICUDateFormat(contextualFormat,localizer);result=result.replace(/C+/g,contextualDate);}
else
{result=this.stringWithICUDateFormat(fullFormat,localizer);}
return result;}
Date.prototype.stringWithICUDateFormat=function(format,localizer)
{var index=0;var outFormat="";var formatCode="";var formatCount=0;var processingText=false;while(true)
{var ch;if(index>=format.length)
{ch="";}
else
{ch=format.charAt(index++);}
if(ch!=""&&ch==formatCode)
{formatCount++;}
else
{if(formatCode.length>0)
{var formatKey=formatCode+String(formatCount);try
{if(formatConversion[formatKey]!=undefined){outFormat+=formatConversion[formatKey](this,localizer);}}
catch(e)
{print(e);return"";}
formatCode="";formatCount=0;}
if(ch=="")break;if(processingText)
{if(ch=="'")
{processingText=false;}
else
{if(ch=="\"")
{ch=="'"}
outFormat+=ch;}
continue;}
if("GyMdhHmsSEDFwWakKZ".indexOf(ch)>=0)
{formatCode=ch;formatCount=1;}
else if(ch=="'")
{processingText=true;}
else
{outFormat+=ch;}}}
return outFormat;}
