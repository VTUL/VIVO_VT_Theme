<#-- $This file is distributed under the terms of the license in /doc/license.txt$  -->


<#-- 
<@widget name="login" include="assets" />
        With release 1.6, the home page no longer uses the "browse by" class group/classes display. 
        If you prefer to use the "browse by" display, replace the import statement below with the
        following include statement:
        
            <#include "browse-classgroups.ftl">
            
        Also ensure that the homePage.geoFocusMaps flag in the runtime.properties file is commented
        out.
-->
<#import "lib-home-page.ftl" as lh>

<!DOCTYPE html>
<html lang="en">
    <head>
        <#include "head.ftl">
        <#if geoFocusMapsEnabled >
            <#include "geoFocusMapScripts.ftl">
        </#if>
        <script type="text/javascript" src="${urls.base}/js/homePageUtils.js?version=x"></script>
    </head>
    
    <body class="${bodyClasses!}" onload="${bodyOnload!}">
        <div id="mask"></div>
    <#-- supplies the faculty count to the js function that generates a random row number for the search query -->
        <@lh.facultyMemberCount  vClassGroups! />
        <#include "identity.ftl">

        <#include "menu.ftl">

        <section id="intro" role="region">
            <h2>${i18n().intro_title}</h2>

            <p>${i18n().intro_para1}</p>
            <p>${i18n().intro_para2}</p>

            <section id="search-home" role="region">
                <h3>${i18n().intro_searchvivo} <span class="search-filter-selected">filteredSearch</span></h3>
        
                <fieldset>
                    <form id="search-homepage" action="${urls.search}" name="search-home" role="search" method="post" > 
                        <div id="search-home-field">
                            <input type="text" name="querytext" class="search-homepage" value="" autocapitalize="off" />
                            <input type="submit" value="${i18n().search_button}" class="search" />
                            <input type="hidden" name="classgroup"  value="" autocapitalize="off" />
                        </div>
                
                        <a class="filter-search filter-default" href="#" title="${i18n().intro_filtersearch}">
                            <span class="displace">${i18n().intro_filtersearch}</span>
                        </a>
                
                        <ul id="filter-search-nav">
                            <li><a class="active" href="">${i18n().all_capitalized}</a></li>
                            <@lh.allClassGroupNames vClassGroups! />  
                        </ul>
                    </form>
                </fieldset>
            </section> <!-- #search-home -->
        </section> <!-- #intro -->
        
<!--        LT @ widget name="login" / GT -->    
        <section id="login" role="region">
            <h2> Current Data sources </h2>
            <p>    20170115 Faculty and Publications from EFARS<br/>
                   20170125 Grants approved by OVPR</p>
            <h2> Proposed Next Data Sets</h2>
            <p>    20170315 CollabVT data refreshed with:<br/>
                   20170312 Faculty and Publications from EFARS<br/>
                   20170209 Grants approved by OVPR</p>
                
            <input id="login" class="green button" type="button" onclick="location.href='http://guides.lib.vt.edu/CollabVT/managemydata';" value="Manage my data" />
        </section> <!-- #login -->
        <!-- List of research classes: e.g., articles, books, collections, conference papers -->
        <@lh.researchClasses />
                
        <!-- List of four randomly selected faculty members -->
        <@lh.facultyMbrHtml />

        <!-- List of randomly selected academic departments -->
        <@lh.academicDeptsHtml />

        <#if geoFocusMapsEnabled >
            <!-- Map display of researchers' areas of geographic focus. Must be enabled in runtime.properties -->
            <@lh.geographicFocusHtml />
        </#if>
        
        <!-- Statistical information relating to property groups and their classes; displayed horizontally, not vertically-->
        <@lh.allClassGroups vClassGroups! />

        <#include "footer.ftl">
        <#-- builds a json object that is used by js to render the academic departments section -->
        <@lh.listAcademicDepartments />
    <script>       
        var i18nStrings = {
            researcherString: '${i18n().researcher}',
            researchersString: '${i18n().researchers}',
            currentlyNoResearchers: '${i18n().currently_no_researchers}',
            countriesAndRegions: '${i18n().countries_and_regions}',
            countriesString: '${i18n().countries}',
            regionsString: '${i18n().regions}',
            statesString: '${i18n().map_states_string}',
            stateString: '${i18n().map_state_string}',
            statewideLocations: '${i18n().statewide_locations}',
            researchersInString: '${i18n().researchers_in}',
            inString: '${i18n().in}',
            noFacultyFound: '${i18n().no_faculty_found}',
            placeholderImage: '${i18n().placeholder_image}',
            viewAllFaculty: '${i18n().view_all_faculty}',
            viewAllString: '${i18n().view_all}',
            viewAllDepartments: '${i18n().view_all_departments}',
            noDepartmentsFound: '${i18n().no_departments_found}'
        };
        // set the 'limmit search' text and alignment
        if  ( $('input.search-homepage').css('text-align') == "right" ) {       
             $('input.search-homepage').attr("value","${i18n().limit_search} \u2192");
        }  
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jsrender/0.9.90/jsrender.min.js"></script>

    <!-- ///////////////////////////////////////////// -->
    <!-- UNIVERSAL ACCESS TEMPLATES -->
    <!-- ///////////////////////////////////////////// -->
    <script id="uaImg" type="text/x-jsrender">
      <img {{props attrs}}{{:key}}="{{:prop}}"{{/props}} />
    </script>
    <script id="uaText" type="text/x-jsrender">
      <span {{props attrs}}{{:key}}="{{:prop}}"{{/props}}>{{:text}}</span>
    </script>
    <script id="uaButton" type="x-jsrender">
      <button {{props attrs}}{{:key}}="{{:prop}}"{{/props}}>
          {{for items}}
              {{if content.el === "img"}}
                  {{include content tmpl="#uaImg"/}}
              {{else}}
                  {{include content tmpl="#uaText"/}}
              {{/if}}
          {{/for}}
      </button>
    </script>
    <script id="uaLink" type="x-jsrender">
      <a {{props attrs}}{{:key}}="{{:prop}}"{{/props}}>
          {{for items}}
              {{if content.el === "img"}}
                  {{include content tmpl="#uaImg"/}}
              {{else}}
                  {{include content tmpl="#uaText"/}}
              {{/if}}
          {{/for}}
      </a>
    </script>
    <script id="uaMenu" type="x-jsrender">
      {{for items}}
      <li {{props attrs}}{{:key}}="{{:prop}}"{{/props}}>
          {{if content.el === "a"}}
              {{include content tmpl="#uaLink" /}}
          {{else}}
              {{include content tmpl="#uaButton" /}}
          {{/if}}
      </li>
      {{/for}}
    </script>

    <script type="text/javascript">

      $.ajax({
        url: "${urls.theme}/js/uaMenu.json"
      }).done(function(data){
      $("#uaRender").html($.templates("#uaMenu").render(data));
      })


    </script>
    </body>
</html>

