<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for scripts loaded at the end of the body element -->

${scripts.add('<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>')}
${scripts.add('<script type="text/javascript" src="${urls.theme}/js/one.min.js"></script>')}

${scripts.add('<script type="text/javascript" src="https://cdn.jsdelivr.net/qtip2/3.0.3/basic/jquery.qtip.min.js"></script>')}

${scripts.list()}

<#include "googleAnalytics.ftl">