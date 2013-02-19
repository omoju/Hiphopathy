//
// iWeb - BlogSummary.js
// Copyright 2006-2008 Apple Inc.
// All rights reserved.
//

var BlogSummaryWidget=Class.create(JSONFeedRendererWidget,{widgetIdentifier:"com-apple-iweb-widget-blogSummary",initialize:function($super,instanceID,widgetPath,sharedPath,sitePath,preferences,runningInApp)
{if(instanceID)
{$super(instanceID,widgetPath,sharedPath,sitePath,preferences,runningInApp);this.contentID="summary-content";this.itemTemplateID="item-template";this.itemID="item";this.separatorTemplateID="separator-template";this.selectState=null;this.sfrShadow=null;this.disableShadows=isEarlyWebKitVersion;this.styleThreeMaximumWidth=0.65;this.debugBorders=(location.href.indexOf("summaryBorders")!=-1);this.debugCompiledHtml=(location.href.indexOf("summaryCompiledHtml")!=-1);this.debugFinalHtml=(location.href.indexOf("summaryFinalHtml")!=-1);this.debugTrace=(location.href.indexOf("summaryTrace")!=-1);if(this.debugTrace)trace=print;if(this.privateInitialize)
{this.privateInitialize();}
document.blogSummaryWidget=this;this.initializingPreferences=true;this.initializeDefaultPreferences({"htmlTemplate":"","excerpt-length":"100","extraSpace":0,"headerOnTop":false,"imageSize":"25","imageSizeOverride":"","imagePosition":"Left","imageOutside":false,"imageVisibility":true,"rss-for-archive":false,"photoProportions":"Landscape"});delete this.initializingPreferences;this.dotMacAccount=this.preferenceForKey("dotMacAccount")||"";this.updateTemplate();this.applyUpgrades();this.fetchAndRenderRSS();}},sizeDidChange:function()
{this.invalidateFeedItems("sizeDidChange");},onload:function($super)
{$super();this.changedPreferenceForKey("htmlTemplate");this.changedPreferenceForKey("sfr-stroke");this.changedPreferenceForKey("sfr-reflection");this.changedPreferenceForKey("sfr-shadow");},changedPreferenceForKey:function($super,key)
{try
{if(this.initializingPreferences)
{return;}
if(this.privateChangedPreferenceForKey)
{this.privateChangedPreferenceForKey(key);}
if(key=="htmlTemplate")
{this.updateTemplate();}
if(key=="rss-for-archive")
{this.fetchAndRenderRSS();}
if(key=="photoProportions")
{this.invalidateFeedItems(key);}}
catch(e)
{debugPrintException(e);}
$super(key);},applyUpgrades:function()
{var upgrades=this.preferenceForKey("upgrades");if(upgrades===undefined)
{upgrades={};}
if((!upgrades["styleThreeWidthScale"]))
{if(this.imagePlacementStyle()==3)
{var oldImageSize=this.preferenceForKey("imageSize");var newImageSize=Math.floor(oldImageSize/this.styleThreeMaximumWidth);this.setPreferenceForKey(newImageSize,"imageSize",false);trace("Upgrading image size from %s to %s",oldImageSize,newImageSize);}
upgrades["styleThreeWidthScale"]=true;this.setPreferenceForKey(upgrades,"upgrades",false);}},updateTemplate:function()
{var html=this.preferenceForKey("htmlTemplate");html=html.replace(/<div class=["']clear:[ ]*both;?['"] ?\/>/g,"<div style='clear:both'></div>");html=html.replace(/<div style=["']clear:[ ]*both;?['"] ?\/>/g,"<div style='clear:both'></div>");if(html=="")
{var markup;if(this.preferenceForKey("rss-for-archive"))
markup=BlogSummaryShared.defaultArchiveMarkup;else
markup=BlogSummaryShared.defaultSummaryMarkup;trace("** brand-new widget html being compiled from source markup");if(markup)
{html=BlogSummaryShared.compileMarkup(markup);}}
if(html)
{if(html.indexOf("<span class='bl-localized'>")==-1)
{if(html.indexOf("Read more...")!=-1)
html=html.replace(/Read more\.\.\./g,"<span class='bl-localized'>Read more...</span>");else if(html.indexOf("More...")!=-1)
html=html.replace(/More\.\.\./g,"<span class='bl-localized'>More...</span>");}
var contentDiv=this.getElementById(this.contentID);if(contentDiv)
{if(this.debugCompiledHtml)print("\n\n%s\n\n",html);html=html.replace(/\$WIDGET_ID/g,this.instanceID);contentDiv.innerHTML=html;this.resetRenderingState=true;this.invalidateFeedItems("updateTemplate");optOutOfCSSBackgroundPNGFix(contentDiv);}}},commentCountText:function(count,enabled)
{if(count==0)
{if(enabled)
{return this.localizedString("No Comments");}
else
{return"";}}
else if(count==1)
{return this.localizedString("1 Comment");}
else
{return String.stringWithFormat(this.localizedString("%s Comments"),count);}},replaceLinkTargets:function(node,replaceArray)
{var byteToPercentEscapeValue=function(ch)
{ch=ch&0xFF;var hiChar="0123456789ABCDEF".charAt(ch/16);var loChar="0123456789ABCDEF".charAt(ch%16);return"%"+hiChar+loChar;};var sanitizeUrlStringForIE6=function(s)
{var result="";for(var i=0;i<s.length;++i)
{var ch=s.charCodeAt(i);if(ch<128)
result+=s.charAt(i);else
result+=byteToPercentEscapeValue(ch);}
return result;};var links=$(node).select('a');for(var j=0;j<links.length;++j)
{var linkTarget=links[j].getAttribute("href");if(linkTarget&&linkTarget.length>0)
{for(var i=0;i<replaceArray.length;++i)
{linkTarget=linkTarget.replace(replaceArray[i][0],replaceArray[i][1]);}
if(linkTarget)
{if(windowsInternetExplorer&&effectiveBrowserVersion<7)
{linkTarget=sanitizeUrlStringForIE6(linkTarget);}
links[j].setAttribute("href",linkTarget);}}}},renderCommentCount:function(itemNode,index,enabled,count)
{var commentCountText=this.commentCountText(count,enabled);var spans=itemNode.select(".bl-value-comment-count");$A(spans).each(function(node)
{node.update(commentCountText);});var commentFieldNode=this.getElementById("comment-field",index);if(commentFieldNode)
{commentFieldNode.style.display=(commentCountText.length===0)?"none":"";}},applyLocalization:function(parent)
{var localizedSpans=$(parent).select(".bl-localized");localizedSpans.each(function(span)
{var key=getTextFromNode(span);span.update(this.localizedString(key));}.bind(this));},imagePlacementStyle:function()
{var result;var headerOnTop=this.preferenceForKey("headerOnTop");var imageOutside=this.preferenceForKey("imageOutside");var imagePosition=this.preferenceForKey("imagePosition");var imageSizeOverride=this.preferenceForKey("imageSizeOverride");var settings=[imagePosition,imageOutside,headerOnTop,imageSizeOverride!=''];if(settings.isEqual(['Left',false,true,false]))
result=1;else if(settings.isEqual(['Left',false,false,false]))
result=2;else if(settings.isEqual(['Left',true,false,false]))
result=3;else if(settings.isEqual(['Right',false,false,false]))
result=4;else if(settings.isEqual(['Left',false,true,true]))
result=5;return result;},renderFeedItems:function()
{trace('renderFeedItems(%s)',arguments[0]);if(this.pendingRender)
{clearTimeout(this.pendingRender);this.pendingRender=null;}
if(this.onloadReceived==false)
{this.invalidateFeedItems();return;}
if(this.blogFeed.itemCount()===0)
{trace(' exit: no items');return;}
if(this.resetRenderingState)
{this.lastRerenderImageSettings=[];this.lastRedoLayoutSettings=[];this.resetRenderingState=false;}
var itemTemplateNode=this.getElementById(this.itemTemplateID);var separatorTemplateNode=this.getElementById(this.separatorTemplateID);if(itemTemplateNode===null)
{trace(' exit: no template');return;}
var parentNode=itemTemplateNode.parentNode;var shouldDisableLinks=this.enableSubSelection;var excerptLength=this.preferenceForKey("excerpt-length");var imageSize=this.preferenceForKey("imageSize");var imageSizeOverride=this.preferenceForKey("imageSizeOverride");var imagePosition=this.preferenceForKey("imagePosition");var showPhotosOption=this.preferenceForKey("imageVisibility");var extraSpace=this.preferenceForKey("extraSpace");var imageOutside=this.preferenceForKey("imageOutside");var headerOnTop=this.preferenceForKey("headerOnTop");var photoProportions=this.preferenceForKey("photoProportions");var isArchive=this.preferenceForKey("rss-for-archive");var sfrShadowText=this.preferenceForKey("sfr-shadow");var sfrReflectionText=this.preferenceForKey("sfr-reflection");var sfrStrokeText=this.preferenceForKey("sfr-stroke");var showImages=showPhotosOption&&(excerptLength!==0);var imagePlacementStyle=this.imagePlacementStyle();if(this.preferences&&this.preferences.postNotification)
this.preferences.postNotification("BLWidgetIsSafeToDrawNotification",0);if(this.runningInApp&&((this.lastImagePlacementStyle!==undefined)&&(this.lastImagePlacementStyle!=imagePlacementStyle)))
{var tempLastImagePlacementStyle=this.lastImagePlacementStyle;this.lastImagePlacementStyle=imagePlacementStyle;if(imagePlacementStyle==3)
{imageSize=Math.min(Math.ceil(imageSize/this.styleThreeMaximumWidth),100);this.setPreferenceForKey(imageSize,"imageSize",false);return;}
else if(tempLastImagePlacementStyle==3)
{imageSize=Math.max(10,Math.ceil(imageSize*this.styleThreeMaximumWidth));this.setPreferenceForKey(imageSize,"imageSize",false);return;}}
this.lastImagePlacementStyle=imagePlacementStyle;if((imagePlacementStyle==3)&&!showImages)
{imageOutside=false;imagePlacementStyle=2;}
if(this.imagePlacementStyle()==3)
{var oldImageSize=imageSize;imageSize=Math.min(Math.max(10,Math.ceil(imageSize*this.styleThreeMaximumWidth)),100);trace("imageSize is %s but using %s because this is style 3",oldImageSize,imageSize);}
if(imageSizeOverride!=="")
{imageSize=Number(imageSizeOverride);}
var paddingLeft=0;var paddingRight=0;var contentDiv=this.getElementById(this.contentID);if(this.debugBorders)contentDiv.style.border="1px solid orange";var node=this.getElementById("image");if(node)
{while((node!==null)&&(node!==contentDiv))
{if(node.style)
{paddingLeft+=parseFloat(node.style.paddingLeft||0);paddingRight+=parseFloat(node.style.paddingRight||0);}
node=node.parentNode;}}
var imageWidth=imageSize/100.0*($(parentNode).getWidth()-(paddingLeft+paddingRight));if(imageSizeOverride!==""&&this.sfrStroke)
{var strokeExtra=this.sfrStroke.strokeExtra();imageWidth-=(strokeExtra.left+strokeExtra.right);}
if(this.preferences&&this.preferences.postNotification)
{this.preferences.postNotification("BLBlogSummaryWidgetThumbnailWidthNotification",imageWidth);}
var rerenderImageSettings=[extraSpace,showImages,imageWidth,imagePosition,imageOutside,headerOnTop,sfrShadowText,sfrReflectionText,sfrStrokeText,photoProportions];var redoLayoutSettings=[imagePosition,extraSpace,imageOutside,imageWidth,headerOnTop,sfrStrokeText,showImages];var rerenderImage=(this.lastRerenderImageSettings===undefined||(rerenderImageSettings.isEqual(this.lastRerenderImageSettings)==false));var redoLayout=(this.lastRedoLayoutSettings===undefined||(redoLayoutSettings.isEqual(this.lastRedoLayoutSettings)==false));this.lastRerenderImageSettings=rerenderImageSettings;this.lastRedoLayoutSettings=redoLayoutSettings;var maxItems=this.blogFeed.maximumItemsToDisplay();for(var i=0;i<maxItems;++i)
{var item=this.blogFeed.itemAtIndex(i);var itemNode=this.getElementById(this.itemID,i);if(itemNode===null)
{itemNode=itemTemplateNode.cloneNode(true);itemNode.id=this.getInstanceId(this.itemID);adjustNodeIds(itemNode,i);var divClearBoth=document.createElement("div");divClearBoth.style.clear="both";parentNode.insertBefore(divClearBoth,itemTemplateNode);parentNode.insertBefore(itemNode,itemTemplateNode);}
if(shouldDisableLinks)
{disableLinks(itemNode);}
if(!item.dateString)
{if(item.date)
{item.dateString=item.date.stringWithICUDateFormat(this.blogFeed.dateFormat(),this);}}
substituteSpans(itemNode,{"bl-value-title":["html",item.title||""],"bl-value-date":["text",item.dateString],"bl-value-excerpt":["html",this.summaryExcerpt(item.description||"",excerptLength)]});if(this.runningInApp)
{this.renderCommentCount(itemNode,i,item.commentingEnabled,item.commentCount);this.replaceLinkTargets(itemNode,[[/\$link\$/g,item.relativeURL.toURLString()],[/\$comment-link\$/g,item.relativeCommentURL.toURLString()]]);}
else
{var linkReplacer=function(item,itemNode)
{var itemCommentLink=item.relativeURL.toURLString()+"#comment_layer";this.replaceLinkTargets(itemNode,[[/\$link\$/g,item.relativeURL.toURLString()],[/\$comment-link\$/g,itemCommentLink]]);}.bind(this,item,itemNode);if(this.dotMacAccount!="")
{this.fetchCommentCountInfoForItem(item,i,itemNode,linkReplacer);}
else
{linkReplacer();}}
var isEquivalentToEmpty=function(s)
{return(s===undefined)||(s===null)||(s==="");}
var entryHasImage=(!isEquivalentToEmpty(item.imageUrlString));var badgeType=item.badgeType;var imgDiv=$(this.getElementById("image",i));var imgGroupDiv=$(this.getElementById("image-group",i));var headerNode=$(this.getElementById("header",i));if(headerNode)
{if(headerOnTop)
{imgDiv.parentNode.insertBefore(headerNode,imgDiv);}
else
{imgDiv.parentNode.insertBefore(headerNode,imgDiv.nextSibling);}}
if(imgDiv)
{if(showImages)
{if(rerenderImage)
{this.rerenderImage(imgGroupDiv,imgDiv,item.imageUrlString,entryHasImage,photoProportions,imageWidth,this.addBadge.bind(this,badgeType,imgDiv));}}
if(redoLayout)
{$(imgDiv).setStyle({cssFloat:imagePosition});$(itemNode).setStyle({cssFloat:"none"});var strokeWidth=0;var strokeHeight=0;if(this.sfrStroke)
{var strokeExtra=null;if(this.sfrStroke.strokeExtra)
{strokeExtra=this.sfrStroke.strokeExtra();}
if(strokeExtra)
{strokeWidth=(strokeExtra.left+strokeExtra.right);strokeHeight=(strokeExtra.top+strokeExtra.bottom);}}
if(imageOutside)
{if(imagePosition=="Left")
{var leftInset=(imageWidth+extraSpace+strokeWidth);if((windowsInternetExplorer&&effectiveBrowserVersion<7)||isFirefox)
leftInset+=paddingLeft;var marginLeft=-1*leftInset;$(imgDiv).setStyle({marginLeft:px(marginLeft),marginRight:0,paddingBottom:0,paddingLeft:0,paddingRight:0});if(this.debugBorders)imgDiv.style.border="1px solid blue";if(windowsInternetExplorer&&effectiveBrowserVersion<7)
itemNode.style.paddingLeft=0;else
itemNode.style.paddingLeft=px(imageWidth+extraSpace+strokeWidth+paddingLeft);itemNode.style.paddingRight=0;if(this.debugBorders)itemNode.style.border="1px solid red";itemNode.style.width=px(depx(this.div().style.width)-leftInset-paddingLeft-paddingRight);$(itemNode).setStyle({cssFloat:"right"});}
else if(imagePosition=="Right")
{$(imgDiv).setStyle({marginLeft:0,marginRight:px(-1*(imageWidth+extraSpace)),paddingBottom:0,paddingLeft:0,paddingRight:0});$(itemNode).setStyle({paddingLeft:0,paddingRight:px(imageWidth+extraSpace),width:""});}}
else
{if(imagePosition=="Left")
{$(imgDiv).setStyle({marginLeft:0,marginRight:0,paddingBottom:px(extraSpace+strokeHeight),paddingLeft:0,paddingRight:px(extraSpace+strokeWidth)});$(itemNode).setStyle({paddingLeft:0,paddingRight:0,width:""})}
else if(imagePosition=="Right")
{$(imgDiv).setStyle({marginLeft:0,marginRight:0,paddingBottom:px(extraSpace+strokeHeight),paddingLeft:px(extraSpace),paddingRight:px(strokeWidth)});$(itemNode).setStyle({paddingLeft:0,paddingRight:0,width:""});}}}
if(showImages&&entryHasImage)
{if(imgDiv.style.display!="")
{imgDiv.style.display="";}}
else
{if(imgDiv.style.display!="none")
imgDiv.style.display="none";itemNode.style.paddingLeft=0;itemNode.style.paddingRight=0;}}
var newSep=null;if(separatorTemplateNode&&(i<this.blogFeed.itemCount()-1))
{newSep=this.getElementById(this.separatorTemplateID,i);if(newSep==null)
{newSep=separatorTemplateNode.cloneNode(true);adjustNodeIds(newSep,i);parentNode.insertBefore(newSep,itemTemplateNode);}}
this.applyLocalization(itemNode);itemNode.style.display="";if(newSep)
{newSep.style.display="";}}
var index=maxItems;while(true)
{if(index>0)
{var sep=this.getElementById(this.separatorTemplateID,index-1);if(sep)
{sep.parentNode.removeChild(sep);}}
var node=this.getElementById(this.itemID,index);if(node===null)
{break;}
node.parentNode.removeChild(node);index++;}
var pusherSpan=$("pusher");if(pusherSpan==null)
{pusherSpan=document.createElement("span");pusherSpan.innerHTML="&nbsp;";pusherSpan.id="pusher";itemTemplateNode.parentNode.insertBefore(pusherSpan,null);}
pusherSpan.style.display=(imagePlacementStyle==3)?"":"none";if(windowsInternetExplorer)
{fixAllIEPNGs(transparentGifURL());setTimeout(fixupIEPNGBGsInTree.bind(null,contentDiv,true),1);if(effectiveBrowserVersion>=8)
{joltLater(this.div());}}
if(this.privateSummaryDidRender)
{this.privateSummaryDidRender();}
if(this.debugFinalHtml)
{setTimeout(function()
{print(contentDiv.outerHTML);},5000);this.debugFinalHtml=false;}
trace(" exit: done",this.blogFeed.itemCount(),"items");},fetchAndRenderRSS:function()
{var isArchiveWidget=this.preferenceForKey("rss-for-archive");this.blogFeed=new BlogFeed(BlogRootURLString(location.href),isArchiveWidget,function()
{this.invalidateFeedItems("renderSummaryFromRSS");}.bind(this));},fetchCommentCountInfoForItem:function(item,index,itemNode,postRenderCallback)
{var commentSummaryURL=item.absoluteURL.toURLString()+"?wsc=summary.js&ts="+new Date().getTime();var renderItemCommentSummary=function(request)
{if(request.responseText)
{var r=request.responseText.match(/.*= ((true)|(false));.*\n.*= (\d+)/);if(r)
{var enabled=(r[1]=="true");var count=Number(r[4]);this.renderCommentCount(itemNode,index,enabled,count);}}
postRenderCallback();}.bind(this);new Ajax.Request(commentSummaryURL,{method:'get',onComplete:renderItemCommentSummary});},addBadge:function(badgeType,imageDiv)
{if(badgeType=="movie"||badgeType=="audio")
{var cropDiv=imageDiv.down('.crop');var kBadgeHeight=16.0;var blackBarElem=new Element('div',{className:'badge-fill'});blackBarElem.setStyle({backgroundColor:'black',opacity:0.75,position:'absolute',left:0,bottom:0,width:px(cropDiv.offsetWidth),height:px(kBadgeHeight)});cropDiv.appendChild(blackBarElem);var badgeImageFilename=((badgeType=="movie")?"Overlay-Movie.png":"Overlay-Audio.png");var badgeSrc=this.widgetPath+"/"+badgeImageFilename;var badgeElem=new Element('img',{className:'badge-overlay',src:badgeSrc});badgeElem.setStyle({position:'absolute',bottom:0,left:0});if(windowsInternetExplorer)
{badgeElem.setStyle(" filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+IEConvertURLForPNGFix(badgeSrc)+" ', sizingMethod='scale');");badgeElem.writeAttribute(badgeSrc,transparentGifURL());}
cropDiv.appendChild(badgeElem);}}});