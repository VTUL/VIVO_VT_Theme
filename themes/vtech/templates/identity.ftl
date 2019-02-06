<div class="header">

<!-- ///////////////////////////////////////////// -->
<!-- EYEBROW -->
<!-- ///////////////////////////////////////////// -->
  <div class="row vt-one-preHeader">



    <nav role="navigation">
        <ul id="header-nav" role="list">
            <#include "languageSelector.ftl">
            <li role="listitem"><a href="${urls.index}" title="${i18n().identity_index}">${i18n().identity_index}</a></li>
            <#if user.loggedIn>
                <#-- COMMENTING OUT THE EDIT PAGE LINK FOR RELEASE 1.5. WE NEED TO IMPLEMENT THIS IN A MORE 
                     USER FRIENDLY WAY. PERHAPS INCLUDE A LINK ON THE PAGES THEMSELVES AND DISPLAY IF THE
                     USER IS A SITE ADMIN. tlw72
                     
                     <#if (page??) && (page?is_hash || page?is_hash_ex) && (page.URLToEditPage??) >
                        <li role="listitem"><a href="${page.URLToEditPage}" title="${i18n().identity_edit}">${i18n().identity_edit}</a></li>
                     </#if>
                -->
                <#if user.hasSiteAdminAccess>
                    <li role="listitem"><a href="${urls.siteAdmin}" title="${i18n().identity_admin}">${i18n().identity_admin}</a></li>
                </#if>
                    <li>
                        <ul class="dropdown">
                            <li id="user-menu"><a href="#" title="${i18n().identity_user}">${user.loginName}</a>
                                <ul class="sub_menu">
                                     <#if user.hasProfile>
                                         <li role="listitem"><a href="${user.profileUrl}" title="${i18n().identity_myprofile}">${i18n().identity_myprofile}</a></li>
                                     </#if>
                                     <#if urls.myAccount??>
                                         <li role="listitem"><a href="${urls.myAccount}" title="${i18n().identity_myaccount}">${i18n().identity_myaccount}</a></li>
                                     </#if>
                                     <li role="listitem"><a href="${urls.logout}" title="${i18n().menu_logout}">${i18n().menu_logout}</a></li>
                                </ul>
                            </li>
                         </ul>
                     </li>
                ${scripts.add('<script type="text/javascript" src="${urls.base}/js/userMenu/userMenuUtils.js"></script>')}
            <#else>
<#--
                <li role="listitem"><a class="log-out" title="${i18n().menu_loginfull}" href="${urls.login}">${i18n().menu_login}</a></li>
-->
                <li role="listitem"><a href="http://guides.lib.vt.edu/CollabVT/managemydata" title="Help" > Manage my data</a></li>
            </#if>
        </ul>
    </nav>



    <div class="vt-universal-access">
      <button onclick="accessToggle()" class="vt-access-toggle" aria-labelledby="vt_universal_access_label">
        <img alt="" src="https://www.assets.cms.vt.edu/images/accessibility_icon_white.svg" class="vt-access-toggle-icon vt-transparent-bg" focusable="false" aria-hidden="true"/>
        <span class="sr-only">Universal Access Toggle</span>
      </button>
      <div role="tooltip" id="vt_universal_access_label" class="vt-universal-access-label">Universal Access</div>
      <div role="dialog" id="vt_access_dialog" aria-labelledby="access_dialog_label" aria-describedby="access_dialog_label" aria-modal="true" class="vt-access-dialog-wrapper" aria-hidden="true">
        <div class="vt-access-dialog">
          <button onclick="accessToggle()" class="vt-access-dialog-close" tabindex="-1" aria-label="Close Universal Access dialog">
            <span class="far fa-times" focusable="false" aria-hidden="true"></span>
            <span class="sr-only">Close Universal Access dialog</span>
          </button>
          <span id="vt_access_dialog_label" class="vt-access-dialog-label">Universal Access Options</span>
          <ul id="uaRender" class="vt-access-options">
          </ul>
        </div> <!-- end vt-access-dialog -->
      </div> <!-- end vt_access_dialog -->
    </div> <!-- end vt-universal-access -->


    <nav class="vt-actions-header" aria-label="Actions and Audiences">
      <ul id="vt_common" role="group" aria-label="Actions">
        <li class="vt-common-item"><a class="vt-common-link" href="https://vt.edu/apply.html">Apply</a></li>
        <li class="vt-common-item"><a class="vt-common-link" href="https://vt.edu/visit.html">Visit</a></li>
        <li class="vt-common-item"><a class="vt-common-link" href="https://webapps.es.vt.edu/givingto/gift">Give</a></li>
        <li class="vt-common-item"><a class="vt-common-link" href="http://www.hokiegear.com/?_s=bm-storefront&utm_source=vt_edu&utm_medium=referral">Shop</a></li>
      </ul>
      <div class="vt-resources-for-wrapper" role="group" aria-label="Audiences">
        <button id="vt_header_resources_toggle" class="vt-resources-toggle" aria-haspopup="true" aria-controls="vt_header_resources_options" aria-expanded="false">
          <span class="vt-resources-toggle-text">Resources for</span>
          <span class="far fa-chevron-down" aria-hidden="true" focusable="false" role="img"></span>
        </button>
        <ul id="vt_header_resources_options" role="menu" class="vt-resources-options closed" aria-labelledby="header_resources_toggle" aria-hidden="true">
          <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/admissions.html">Future Students</a></li>
          <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/resources/current-students.html">Current Students</a></li>
          <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/resources/parents-and-families.html">Parents and Families</a></li>
          <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/resources/faculty-and-staff.html">Faculty and Staff</a></li>
          <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://alumni.vt.edu">Alumni</a></li>
          <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/link.html">Industry and Partners</a></li>
        </ul>
      </div>
    </nav> <!-- end vt-actions-header -->
  </div> <!-- end vt-one-preHeader -->
<!-- ///////////////////////////////////////////// -->
<!-- END EYEBROW -->
<!-- ///////////////////////////////////////////// -->



<!-- ///////////////////////////////////////////// -->
<!-- HEADER -->
<!-- ///////////////////////////////////////////// -->
  <div class="row vt-one-headerRow">
    <header class="col header-col" role="banner">
      <div id="vt_logo">
        <a class="vt-logo-link" href="https://vt.edu"><img alt="VT Virginia Tech" src="https://www.assets.cms.vt.edu/images/logo-maroon-whiteBG.svg"/></a>
      </div>




      <!-- ///////////////////////////////////////////// -->
      <!-- MAIN NAVIGATION -->
      <!-- ///////////////////////////////////////////// -->
      <nav class="col" id="vt_nav" aria-label="Site Menu">
        <div class="linkWrapper">
          <button class="vt-nav-toggle" aria-controls="vt_main_nav" aria-expanded="false" onclick="javascript:navToggle();">
            <span class="vt-nav-toggleLabel">Menu</span>
            <span class="far fa-bars menu-open" aria-hidden="true" focusable="false" role="img"></span>
            <span class="far fa-times menu-close d-none" aria-hidden="true" focusable="false" role="img"></span>
          </button>
        </div>
        <div id="vt_offcanvas_nav" role="group" aria-label="Main Menu Drawer" aria-hidden="true" tabindex="-1">
          <ol id="vt_parent_org" class="vt-parent-org" aria-label="Parent Organization and Current Site">
            <li class="vt-currentSiteTitle">
                <a class="vt-currentSiteTitle-link" href="/" tabindex="-1">Virginia Tech</a>
            </li>
          </ol>

          <ul id="vt_main_nav" role="presentation" aria-label="Pages in Site">

            
            <#list menu.items as item>
              <li class="nav-item"><div class="link-wrapper"><a href="{item.url}" tabindex="-1" title="${item.linkText} ${i18n().menu_item}">${item.linkText}</a></div></li> 
            </#list>
          </ul>

          <ul class="vt-actions-nav" role="menu" aria-label="Actions">
            <li class="vt-common-item"><a class="vt-common-link" href="https://vt.edu/apply.html">Apply</a></li>
            <li class="vt-common-item"><a class="vt-common-link" href="https://vt.edu/visit.html">Visit</a></li>
            <li class="vt-common-item"><a class="vt-common-link" href="https://webapps.es.vt.edu/givingto/gift">Give</a></li>
            <li class="vt-common-item"><a class="vt-common-link" href="http://www.hokiegear.com/?_s=bm-storefront&utm_source=vt_edu&utm_medium=referral">Shop</a></li>
          </ul>
          <div class="vt-resources-for-wrapper d-md-none">
            <div class="vt-nav-resources-wrapper" aria-label="Audiences">
              <div class="vt-resources-link-wrapper">
                <button id="vt_nav_resources_toggle" class="fold-icon vt-resources-toggle" aria-controls="vt_nav_resources_options" aria-expanded="true">
                  <span class="vt-nav-resources-title">Resources for</span>
                  <span class="far fa-times" focusable="false"></span>
                </button>
              </div>
              <ul id="vt_nav_resources_options" role="group" class="vt-resources-options open" aria-labelledby="vt_nav_resources_toggle">
                <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/admissions.html">Future Students</a></li>
                <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/resources/current-students.html">Current Students</a></li>
                <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/resources/parents-and-families.html">Parents and Families</a></li>
                <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/resources/faculty-and-staff.html">Faculty and Staff</a></li>
                <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://alumni.vt.edu">Alumni</a></li>
                <li role="none presentation" class="vt-resources-item"><a role="menuitem" tabindex="-1" class="vt-resources-item-link" href="https://vt.edu/resources/industry-and-partners.html">Industry and Partners</a></li>
              </ul>
            </div>
          </div>


          </div>
          </nav><!-- end vt_nav -->
          <!-- ///////////////////////////////////////////// -->
          <!-- END MAIN NAVIGATION -->
          <!-- ///////////////////////////////////////////// -->




      <!-- ///////////////////////////////////////////// -->
      <!-- SEARCH -->
      <!-- ///////////////////////////////////////////// -->
      <div class="col" id="vt_header_search" role="search">
        <div class="linkWrapper">
          <button class="vt-search-toggle" aria-controls="vt_header_search_form" aria-expanded="false" onclick="javascript:searchToggle();">
            <span class="vt-search-toggleLabel">Search</span>
            <span class="far fa-search search-open" aria-hidden="true" focusable="false" role="img"></span>
            <span class="far fa-times search-close d-none" aria-hidden="true" focusable="false" role="img"></span>
          </button>
        </div>
        <div class="vt-search-wrapper">
          <form id="vt_header_search_form" role="group" aria-label="Search Drawer" action="//search.vt.edu/query" method="get" name="vtsearchform" autocomplete="off">
            <div class="vt-searchbox-input-wrapper">
                <label for="vt_search_box" class="vt-search-searchboxLabel">Search</label>
                <input type="search" maxlength="100" value="" name="q" id="vt_search_box" class="vt-search-box"/>
              <button id="vt_go_button" type="submit" class="vt-search-button">
                <span>Submit</span>
              </button>
            </div>
          </form>
          <div class="d-none" data-name="siteURL" data-value="vt.edu"></div>
        </div> <!-- end vt-search-wrapper -->
      <!-- ///////////////////////////////////////////// -->
      <!-- END SEARCH -->
      <!-- ///////////////////////////////////////////// -->



</div> <!-- end vt_header_search -->
</header>
</div> <!-- end vt-one-headerRow -->
<!-- ///////////////////////////////////////////// -->
<!-- END HEADER -->
<!-- ///////////////////////////////////////////// -->

</div>