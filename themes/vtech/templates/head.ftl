<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<meta charset="utf-8" />
<!-- Google Chrome Frame open source plug-in brings Google Chrome's open web technologies and speedy JavaScript engine to Internet Explorer-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>${(title?html)!}</title>

<#-- VIVO OpenSocial Extension by UCSF -->
<#if openSocial??>
    <#if openSocial.visible>
        <#-- Required to add these BEFORE stylesheets.flt and headScripts.ftl are processed -->
        ${stylesheets.add('<link rel="stylesheet" href="${urls.theme}/css/openSocial/gadgets.css" />')}			
        ${headScripts.add('<script type="text/javascript" src="${openSocial.containerJavascriptSrc}"></script>',
                          '<script type="text/javascript" language="javascript">${openSocial.gadgetJavascript}</script>',
                          '<script type="text/javascript" src="${urls.base}/js/openSocial/orng.js"></script>')}
    </#if>	
</#if>	


<#include "stylesheets.ftl">
<link rel="stylesheet" href="${urls.theme}/css/screen.css" />


<script src="https://www.assets.cms.vt.edu/js/popper/archives/1.12.9/popper.min.js"></script>

<script src="https://www.assets.cms.vt.edu/bootstrap/archives/4.0.0/dist/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet" href="//www.assets.cms.vt.edu/font-awesome/archives-pro/5.0.9/svg-with-js/css/fa-svg-with-js.css"/>

<script src="//www.assets.cms.vt.edu/font-awesome/archives-pro/5.0.9/svg-with-js/js/fontawesome-all.min.js"></script>

<!-- bootstrap responsive tabs -->
<script src="https://www.assets.cms.vt.edu/bootstrap/bootstrap-responsive-tabs/js/responsive-tabs.js"></script>

<link type="text/css" rel="stylesheet" href="${urls.theme}/css/root.css"/>




<#include "headScripts.ftl">

<!--[if (gte IE 6)&(lte IE 8)]>
<script type="text/javascript" src="${urls.base}/js/selectivizr.js"></script>
<![endif]-->

<#-- Inject head content specified in the controller. Currently this is used only to generate an rdf link on 
an individual profile page. -->
${headContent!}

<link rel="shortcut icon" type="image/x-icon" href="${urls.base}/favicon.ico">