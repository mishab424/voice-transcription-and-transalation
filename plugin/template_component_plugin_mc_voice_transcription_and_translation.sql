prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.8'
,p_default_workspace_id=>64998819436736334533
,p_default_application_id=>44195
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MISHABDEMODEV'
);
end;
/
 
prompt APPLICATION 44195 - Voice Recgonaisation plugin
--
-- Application Export:
--   Application:     44195
--   Name:            Voice Recgonaisation plugin
--   Date and Time:   06:49 Thursday September 25, 2025
--   Exported By:     730218104019MUHAMMEDMISHAB@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 88880804853051560922
--   Manifest End
--   Version:         24.2.8
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/template_component/mc_voice_transcription_and_translation
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(88880804853051560922)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '')
,p_name=>'MC_VOICE_TRANSCRIPTION_AND_TRANSLATION'
,p_display_name=>'voice_transcription_and_translation'
,p_supported_component_types=>'PARTIAL'
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if APEX$IS_LAZY_LOADING/}',
'  <div></div>',
'{else/}',
'  <!DOCTYPE html>',
'<html lang="en">',
'<head>',
'  <meta charset="UTF-8">',
'  <title>Voice to Translator</title>',
'<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">',
'<style>',
'.chat-input {',
'    display: flex;',
'    align-items: center;',
'    padding: 10px 12px;',
'    border-top: 1px solid #ddd;',
'    background: #fff;',
'}',
'.chat-input textarea,audio {',
'    flex: 1;',
'    border: none;',
'    resize: none;',
'    padding: 12px;',
'    font-size: 14px;',
'    border-radius: 20px;',
'    background-color: #f1f1f1;',
'    outline: none;',
'    box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);',
'    transition: background-color 0.2s ease;',
'    height: 44px;',
'}',
'.chat-input textarea:focus {',
'    background-color: #e6f7ff;',
'}',
'.chat-input #send-btn,#saveRecordingBtn,#savefile-btn {',
'    margin-left: 10px;',
'    background: #4CAF50;',
'    color: #fff;',
'    border: none;',
'    padding: 10px 16px;',
'    border-radius: 20px;',
'    cursor: pointer;',
'    font-size: 14px;',
'    font-weight: bold;',
'    transition: background-color 0.3s ease, transform 0.2s ease;',
'}',
'',
'.chat-input button:hover {',
'    background-color: #45a049;',
'    transform: translateY(-1px);',
'}',
' .mic-button.listening {',
'      background-color: #dc3545;',
'}',
'',
'.wave-container {',
'    display: flex;',
'    align-items: end;',
'    gap: 4px;',
'    height: 30px;',
'    display: none;',
'}',
'.wave-container .bar {',
'    width: 6px;',
'    height: 10px;',
'    background: #007bff;',
'    border-radius: 3px;',
'    animation: wave 1s infinite ease-in-out;',
'}',
'.wave-container .bar:nth-child(2) { animation-delay: 0.1s; }',
'.wave-container .bar:nth-child(3) { animation-delay: 0.2s; }',
'.wave-container .bar:nth-child(4) { animation-delay: 0.3s; }',
'.wave-container .bar:nth-child(5) { animation-delay: 0.4s; }',
'@keyframes wave {',
'    0%, 100% { height: 10px; }',
'    50% { height: 30px; }',
'}',
'.label {',
'    font-weight: bold;',
'    margin-top: 10px;',
'    align-self: flex-start;',
'}',
'.mic-icon-btn,.icon-button ,.attach-btn{',
'  background: none;',
'  border: none;',
'  padding: 8px;',
'  color: #333;',
'  font-size: 22px;',
'  cursor: pointer;',
'  transition: color 0.2s ease, transform 0.2s ease;',
'}',
'.mic-icon-btn:hover {',
'  color: #007bff; ',
'  transform: scale(1.1);',
'}',
'.mic-icon-btn:active {',
'  transform: scale(0.95);',
'}',
'',
'</style>',
'',
'</head>',
'<body>',
'  <div class="speech-container">',
'    <button id="btn-speech" class="mic-icon-btn" title="Speak & Transalate" type="button"><i class="fa-solid fa-microphone"></i></button>',
'    <div class="wave-container" id="voice-wave">',
'      <div class="bar"></div>',
'      <div class="bar"></div>',
'      <div class="bar"></div>',
'      <div class="bar"></div>',
'      <div class="bar"></div>',
'    </div>',
'    </div>',
'',
unistr('    <div class="label" style="display:none;">\D83C\DF99\FE0F Spoken Text:</div>'),
'    <textarea id="speech-output" readonly class="speech-box" placeholder="Your speech will appear here..." style="display:none;"></textarea>',
'',
unistr('    <div class="label" style="display:none;">\D83C\DF0D Translated Text:</div>'),
'    <textarea id="translated-output" readonly class="speech-box" placeholder="Translation will appear here..." style="display:none;"></textarea>',
'  </div>',
'',
unistr('  <!-- \D83D\DD39 Dynamic mapping -->'),
'  <div id="speech-target" data-item-name="#SPEECH_TEXT_ITEM_NAME#"></div>',
'  <div id="translate-target" data-item-name="#TRANSLATED_TEXT_ITEM_NAME#"></div>',
'  <div id="speech-lang" data-item-name="#SPEAKING_LANGUAGE#"></div>       <!-- Speech recognition language -->',
'  <div id="translation-lang" data-item-name="#TRANSALATION_LANGUAGE#"></div>     <!-- Translation target language -->',
'',
'<script>',
'  var recognition;',
'  var recognizing = false;',
'',
unistr('  // \2705 Helper to fetch data-item-name'),
'  function getTargetItemName(divId) {',
'    const el = document.getElementById(divId);',
'    return el ? el.dataset.itemName : null;',
'  }',
'',
unistr('  // \2705 Async Translate Function'),
'  async function translateText(text, targetLang) {',
'    try {',
'      const url = `https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=${targetLang}&dt=t&q=${encodeURIComponent(text)}`;',
'      const res = await fetch(url);',
'      if (!res.ok) throw new Error(`HTTP error! Status: ${res.status}`);',
'      const data = await res.json();',
'      if (Array.isArray(data) && data[0] && Array.isArray(data[0][0])) {',
'        return data[0].map(sentence => sentence[0]).join(" ");',
'      } else {',
'        throw new Error("Unexpected response format");',
'      }',
'    } catch (error) {',
unistr('      console.error("\274C Translation failed:", error.message);'),
unistr('      return "\274C Error during translation.";'),
'    }',
'  }',
'',
'  document.addEventListener("DOMContentLoaded", function () {',
unistr('    // \D83D\DD39 Read languages dynamically'),
'    const speechLang = getTargetItemName("speech-lang") || "auto";',
'    const translationLang = getTargetItemName("translation-lang") || "en";',
'',
unistr('    // \2705 Browser support'),
'    if (!(''webkitSpeechRecognition'' in window)) {',
unistr('      alert("\274C Your browser does not support Speech Recognition. Use Google Chrome.");'),
'      return;',
'    }',
'',
'    recognition = new webkitSpeechRecognition();',
'    recognition.continuous = false;',
'    recognition.interimResults = false;',
'    recognition.lang = speechLang;   // <-- dynamic speech language',
'',
'    recognition.onstart = function () {',
'      recognizing = true;',
'    //   document.getElementById("btn-speech").classList.add("listening");',
unistr('    //   document.getElementById("btn-speech").innerText = "\D83D\DED1 Listening...";'),
'    //   document.getElementById("voice-wave").style.display = "flex";',
'        document.getElementById("btn-speech").classList.add("listening");',
unistr('        document.getElementById("btn-speech").innerHTML = "\D83D\DFE5";'),
'        document.getElementById("voice-wave").style.display = "flex";',
'    };',
'',
'    recognition.onend = function () {',
'      recognizing = false;',
'    //   document.getElementById("btn-speech").classList.remove("listening");',
unistr('    //   document.getElementById("btn-speech").innerText = "\D83C\DFA4 Start Speaking";'),
'    //   document.getElementById("voice-wave").style.display = "none";',
'        document.getElementById("btn-speech").classList.remove("listening");',
'        document.getElementById("btn-speech").innerHTML = ''<i class="fa-solid fa-microphone"></i>'';',
'        document.getElementById("voice-wave").style.display = "none";',
'    };',
'',
'    recognition.onerror = function (event) {',
unistr('      console.error("\274C Speech error:", event.error);'),
'      alert("Speech error: " + event.error);',
'    };',
'',
'    recognition.onresult = async function (event) {',
'      var transcript = "";',
'      for (var i = event.resultIndex; i < event.results.length; ++i) {',
'        transcript += event.results[i][0].transcript;',
'      }',
'',
'      // Raw text',
'      document.getElementById("speech-output").value = transcript;',
'      const speechItem = getTargetItemName("speech-target");',
'      if (apex.item && speechItem) apex.item(speechItem).setValue(transcript);',
'',
'      // Translation',
'      document.getElementById("translated-output").value = "Translating...";',
'      const translateItem = getTargetItemName("translate-target");',
'      if (apex.item && translateItem) apex.item(translateItem).setValue("Translating...");',
'',
'      const translatedText = await translateText(transcript, translationLang); // <-- dynamic target',
'      document.getElementById("translated-output").value = translatedText;',
'      if (apex.item && translateItem) apex.item(translateItem).setValue(translatedText);',
'',
unistr('      // \2705 Print to console'),
unistr('    console.log("\D83C\DF99\FE0F Recognized Speech:", transcript);'),
unistr('    console.log("\D83C\DF0D Translated Text:", translatedText);'),
'    };',
'',
'    document.getElementById("btn-speech").addEventListener("click", function () {',
'      if (!recognition) return;',
'      if (recognizing) recognition.stop();',
'      else recognition.start();',
'    });',
'  });',
'</script>',
'</body>',
'</html>',
'',
'{endif/}'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_standard_attributes=>'REGION_TEMPLATE'
,p_substitute_attributes=>true
,p_version_scn=>15655969634181
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(88880805345878560953)
,p_plugin_id=>wwv_flow_imp.id(88880804853051560922)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'SPEAKING_LANGUAGE'
,p_prompt=>'Speaking Language'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(88880805751636560958)
,p_plugin_id=>wwv_flow_imp.id(88880804853051560922)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'SPEECH_TEXT_ITEM_NAME'
,p_prompt=>'Speech Text Item Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(88880806141860560958)
,p_plugin_id=>wwv_flow_imp.id(88880804853051560922)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'TRANSALATION_LANGUAGE'
,p_prompt=>'Transalation Language'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(88880806561709560959)
,p_plugin_id=>wwv_flow_imp.id(88880804853051560922)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'TRANSLATED_TEXT_ITEM_NAME'
,p_prompt=>'Translated Text Item Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
