;
/* module-key = 'com.atlassian.jira.plugins.jira-editor-plugin:plugins', location = 'js/plugins/markup-plugin.js' */
require(["jira/editor/customizer"],function(a){a.customizeSettings(function(b){if(b.plugins.indexOf("textpattern")===-1){b.plugins.push("textpattern")}b.textpattern_patterns=b.textpattern_patterns||[];Array.prototype.push.apply(b.textpattern_patterns,[{start:"1. ",cmd:"InsertOrderedList"},{start:"# ",cmd:"InsertOrderedList"},{start:"* ",cmd:"InsertUnorderedList"},{start:"- ",cmd:"InsertUnorderedList"}])})});;