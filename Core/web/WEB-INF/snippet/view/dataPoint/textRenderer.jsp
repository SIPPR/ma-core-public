<%--
    Copyright (C) 2006-2011 Serotonin Software Technologies Inc. All rights reserved.
    @author Matthew Lohbihler
--%>
<%@ include file="/WEB-INF/jsp/include/tech.jsp" %>
<div>
  <table>
    <tr><td colspan="3">
      <span class="smallTitle"><fmt:message key="pointEdit.text.props"/></span>
      <tag:help id="textRenderers"/>
    </td></tr>
    
    <tr>
      <td class="formLabelRequired"><fmt:message key="pointEdit.text.type"/></td>
      <td class="formField">
        <input id="textRendererSelect" />
      </td>
    </tr>
    
    <tbody id="suffixRow">
      <tr>
        <td class="formLabel"><fmt:message key="pointEdit.text.suffix"/></td>
        <td class="formField"><input id="suffix" type="text"/></td>
      </tr>
    </tbody>
    <tbody id="formatRow" style="display:none;">
      <tr>
        <td class="formLabelRequired"><fmt:message key="pointEdit.text.format"/></td>
        <td class="formField">
          <input id="textRendererTimeFormat" type="text"/>
          <div id="datetimeFormatHelpDiv"><tag:help id="datetimeFormats"/></div>
        </td>
      </tr>
     </tbody>
    <tbody id="conversionExponentRow">
       <tr>
        <td class="formLabel"><fmt:message key="pointEdit.text.conversionExponent"/></td>
        <td class="formField"><input id="conversionExponent" type="text"/></td>
      </tr>
    </tbody>
    
      <tbody id="binaryValuesRow" style="display:none;">
      <tr>
        <td class="formLabelRequired"><fmt:message key="pointEdit.text.zero"/></td>
        <td class="formField">
          <table cellspacing="0" cellpadding="0">
            <tr>
              <td valign="top"><input id="zeroLabel" type="text"/></td>
              <td width="10"></td>
              <td valign="top" align="center">
                <div dojoType="dijit.ColorPalette" palette="3x4" id="zeroColour"></div>
                <a href="#" onclick="textRendererEditor.handlerBinaryZeroColour(null); return false;">(<fmt:message key="pointEdit.text.default"/>)</a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class="formLabelRequired"><fmt:message key="pointEdit.text.one"/></td>
        <td class="formField">
          <table cellspacing="0" cellpadding="0">
            <tr>
              <td valign="top"><input id="oneLabel" type="text"/></td>
              <td width="10"></td>
              <td valign="top" align="center">
                <div dojoType="dijit.ColorPalette" palette="3x4" id="oneColour"></div>
                <a href="#" onclick="textRendererEditor.handlerBinaryOneColour(null); return false;">(<fmt:message key="pointEdit.text.default"/>)</a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </tbody>
    <tbody id="multistateValuesRow" style="display:none;">
      <tr>
        <td colspan="2">
          <table>
            <tr>
              <th><fmt:message key="pointEdit.text.key"/></th>
              <th><fmt:message key="pointEdit.text.text"/></th>
              <th><fmt:message key="pointEdit.text.colour"/></th>
              <td></td>
            </tr>
            <tr>
              <td valign="top"><input type="text" id="textRendererMultistateKey" value="" class="formVeryShort"/></td>
              <td valign="top"><input type="text" id="textRendererMultistateText" value="" class="formShort"/></td>
              <td valign="top" align="center">
                <div dojoType="dijit.ColorPalette" palette="3x4" id="textRendererMultistateColour"></div>
                <a href="#" onclick="textRendererEditor.handlerMultistateColour(null); return false;">(<fmt:message key="pointEdit.text.default"/>)</a>
              </td>
              <td valign="top">
                <tag:img png="add" title="common.add" onclick="return textRendererEditor.addMultistateValue();"/>
              </td>
            </tr>
            <tbody id="textRendererMultistateTable"></tbody>
          </table>
        </td>
      </tr>
    </tbody>  
    
    
    
    
    <tbody id="textRendererAnalog" style="display:none;">
      <tr>
        <td class="formLabelRequired"><fmt:message key="pointEdit.text.format"/></td>
        <td class="formField">
          <input id="textRendererAnalogFormat" type="text"/>
          <tag:help id="numberFormats"/>
        </td>
      </tr>
      <tr>
        <td class="formLabel"><fmt:message key="pointEdit.text.suffix"/></td>
        <td class="formField"><input id="textRendererAnalogSuffix" type="text"/></td>
      </tr>
    </tbody>
    

    <tbody id="textRendererNone" style="display:none;">
    </tbody>
    <tbody id="textRendererPlain" style="display:none;">
      <tr>
        <td class="formLabel"><fmt:message key="pointEdit.text.suffix"/></td>
        <td class="formField"><input id="textRendererPlainSuffix" type="text"/></td>
      </tr>
    </tbody>
    <tbody id="rangeValuesRow" style="display:none;">
      <tr>
        <td class="formLabelRequired"><fmt:message key="pointEdit.text.format"/></td>
        <td class="formField"><input id="textRendererRangeFormat" type="text"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <table>
            <tr>
              <th><fmt:message key="pointEdit.text.from"/></th>
              <th><fmt:message key="pointEdit.text.to"/></th>
              <th><fmt:message key="pointEdit.text.text"/></th>
              <th><fmt:message key="pointEdit.text.colour"/></th>
              <td></td>
            </tr>
            <tr>
              <td valign="top"><input type="text" id="textRendererRangeFrom" value="" class="formVeryShort"/></td>
              <td valign="top"><input type="text" id="textRendererRangeTo" value="" class="formVeryShort"/></td>
              <td valign="top"><input type="text" id="textRendererRangeText" value=""/></td>
              <td valign="top" align="center">
                <div dojoType="dijit.ColorPalette" palette="3x4" id="textRendererRangeColour"></div>
                <a href="#" onclick="textRendererEditor.handlerRangeColour(null); return false;">(<fmt:message key="pointEdit.text.default"/>)</a>
              </td>
              <td valign="top">
                <tag:img png="add" title="common.add" onclick="return textRendererEditor.addRangeValue();"/>
              </td>
            </tr>
            <tbody id="textRendererRangeTable"></tbody>
          </table>
        </td>
      </tr>
    </tbody>
    <tbody id="textRendererTime" style="display:none;">
      <tr>
        <td class="formLabelRequired"><fmt:message key="pointEdit.text.format"/></td>
        <td class="formField">
          <input id="textRendererTimeFormat" type="text"/>
          <tag:help id="datetimeFormats"/>
        </td>
      </tr>
      <tr>
        <td class="formLabel"><fmt:message key="pointEdit.text.conversionExponent"/></td>
        <td class="formField"><input id="textRendererTimeConversionExponent" type="text"/></td>
      </tr>
    </tbody>
  </table>
</div>

<script type="text/javascript">
  dojo.require("dijit.ColorPalette");
  dojo.require("dijit.form.Select");

  var textRendererSelect = new dijit.form.Select({
      name: 'textRendererSelect',
  },"textRendererSelect");
  
  textRendererSelect.watch("value",textRendererChanged);
  
  /**
   * On Select change re-render view
   */
  function textRendererChanged(name,oldValue,value){
      if (value == "textRendererAnalog"){
    	  hide("datetimeFormatHelpDiv");
          show("suffixRow");
          show("formatRow");
          hide("rangeValuesRow");
          hide("conversionExponentRow");
          hide("multistateValuesRow");
          hide("binaryValuesRow");
      }else if (value == "textRendererBinary"){
    	  hide("datetimeFormatHelpDiv");
    	  show("binaryValuesRow");
    	  hide("suffixRow");
          hide("formatRow");
          hide("rangeValuesRow");
          hide("conversionExponentRow");
          hide("multistateValuesRow");
      }else if (value == "textRendererMultistate"){
    	  hide("datetimeFormatHelpDiv");
          hide("suffixRow");
          hide("formatRow");
          hide("rangeValuesRow");
          hide("conversionExponentRow");
          show("multistateValuesRow");
          hide("binaryValuesRow");
      }else if (value == "textRendererNone"){
    	  hide("datetimeFormatHelpDiv");
          hide("suffixRow");
          hide("formatRow");
          hide("rangeValuesRow");
          hide("conversionExponentRow");
          hide("multistateValuesRow");
          hide("binaryValuesRow");
      }else if (value == "textRendererPlain"){
    	  hide("datetimeFormatHelpDiv");
    	  show("suffixRow");
          hide("formatRow");
          hide("rangeValuesRow");
          hide("conversionExponentRow");
          hide("multistateValuesRow");
          hide("binaryValuesRow");
      }else if (value == "textRendererRange"){
    	  hide("datetimeFormatHelpDiv");
    	  show("formatRow");
    	  hide("suffixRow");
    	  show("rangeValuesRow");
          hide("conversionExponentRow");
          hide("multistateValuesRow");
          hide("binaryValuesRow");
      }else if (value == "textRendererTime"){
    	  show("datetimeFormatHelpDiv");
          hide("suffixRow");
          show("formatRow");
          hide("rangeValuesRow");
          show("conversionExponentRow");
          hide("multistateValuesRow");
          hide("binaryValuesRow");
      }else{
          alert("Unknown text renderer: " + vo.textRenderer.typeName);
      }
  }
  
  /*
   * Set the page values from the current data point VO
   */
  function setTextRenderer(vo){
      
      //Clear and Setup the Chart Renderer Options
      DataPointDwr.getTextRendererOptions(vo.pointLocator.dataTypeId,function (response){
          var options = [];
          for(var i=0; i<response.data.options.length; i++){
              options.push({
                  label: mangoMsg[response.data.options[i].nameKey],
                  value: response.data.options[i].name,
              })
          }
          textRendererSelect.options = [];
          textRendererSelect.addOption(options);
          
          if(vo.textRenderer != null){
              textRendererSelect.set('value',vo.textRenderer.typeName);

              if (vo.textRenderer.typeName == "textRendererAnalog"){
            	  dojo.byId("format").value = vo.textRenderer.format;
                  dojo.byId("suffix").value = vo.textRenderer.suffix;
              }else if (vo.textRenderer.typeName == "textRendererBinary"){
            	  dojo.byId("zeroLabel").value = vo.textRenderer.zeroLabel;
            	  dijit.byId("zeroColour").selectedColour = vo.textRenderer.zeroColour;
            	  dojo.byId("oneLabel").value = vo.textRenderer.oneLabel;
            	  dijit.byId("oneColour").selectedColour = vo.textRenderer.oneColour;
              }else if (vo.textRenderer.typeName == "textRendererMultistate"){
            	  setMultistateValues(vo.textRenderer.multistateValues);
              }else if (vo.textRenderer.typeName == "textRendererNone"){
            	  //Nothing
              }else if (vo.textRenderer.typeName == "textRendererPlain"){
            	  dojo.byId("suffix").value = vo.textRenderer.suffix;
              }else if (vo.textRenderer.typeName == "textRendererRange"){
            	  dojo.byId("format").value = vo.textRenderer.format;
            	  setRangeValues(vo.textRenderer.rangeValues);
              }else if (vo.textRenderer.typeName == "textRendererTime"){
            	  dojo.byId("format").value = vo.textRenderer.format;
            	  dojo.byId("conversionExponent").value = vo.textRenderer.conversionExponent;
              }else{
                  alert("Unknown text renderer: " + vo.textRenderer.typeName);
              }
          }//Not null
      });
  }

  /*
   * Get the values from the page and put into current data point VO
   */
  function getTextRenderer(vo){
      if(vo.textRenderer != null){
          textRendererSelect.set('value',vo.textRenderer.typeName);

          if (vo.textRenderer.typeName == "textRendererAnalog"){
              dojo.byId("format").value = vo.textRenderer.format;
              dojo.byId("suffix").value = vo.textRenderer.suffix;
          }else if (vo.textRenderer.typeName == "textRendererBinary"){
              dojo.byId("zeroLabel").value = vo.textRenderer.zeroLabel;
              dijit.byId("zeroColour").selectedColour = vo.textRenderer.zeroColour;
              dojo.byId("oneLabel").value = vo.textRenderer.oneLabel;
              dijit.byId("oneColour").selectedColour = vo.textRenderer.oneColour;
          }else if (vo.textRenderer.typeName == "textRendererMultistate"){
              setMultistateValues(vo.textRenderer.multistateValues);
          }else if (vo.textRenderer.typeName == "textRendererNone"){
              //Nothing
          }else if (vo.textRenderer.typeName == "textRendererPlain"){
              vo.textRenderer.suffix = dojo.byId("suffix").value;
          }else if (vo.textRenderer.typeName == "textRendererRange"){
              dojo.byId("format").value = vo.textRenderer.format;
              setRangeValues(vo.textRenderer.rangeValues);
          }else if (vo.textRenderer.typeName == "textRendererTime"){
              dojo.byId("format").value = vo.textRenderer.format;
              dojo.byId("conversionExponent").value = vo.textRenderer.conversionExponent;
          }else{
              alert("Unknown text renderer: " + vo.textRenderer.typeName);
          }
      }//Not null
  }
  
  function TextRendererEditor() {
      var currentTextRenderer;
      var multistateValues = new Array();
      var rangeValues = new Array();
      
      this.init = function() {
          // Colour handler events
          dijit.byId("textRendererRangeColour").onChange = this.handlerRangeColour;
          dijit.byId("textRendererMultistateColour").onChange = this.handlerMultistateColour;
          dijit.byId("textRendererBinaryZeroColour").onChange = this.handlerBinaryZeroColour;
          dijit.byId("textRendererBinaryOneColour").onChange = this.handlerBinaryOneColour;
          
          // Figure out which fields to populate with data.
          <c:choose>
            <c:when test='${form.textRenderer.typeName == "textRendererAnalog"}'>
              $set("textRendererAnalogFormat", "${sst:dquotEncode(form.textRenderer.format)}");
              $set("textRendererAnalogSuffix", "${sst:dquotEncode(form.textRenderer.suffix)}");
            </c:when>
            <c:when test='${form.textRenderer.typeName == "textRendererBinary"}'>
              $set("textRendererBinaryZero", "${sst:dquotEncode(form.textRenderer.zeroLabel)}");
              textRendererEditor.handlerBinaryZeroColour("${sst:dquotEncode(form.textRenderer.zeroColour)}");
              $set("textRendererBinaryOne", "${sst:dquotEncode(form.textRenderer.oneLabel)}");
              textRendererEditor.handlerBinaryOneColour("${sst:dquotEncode(form.textRenderer.oneColour)}");
            </c:when>
            <c:when test='${form.textRenderer.typeName == "textRendererMultistate"}'>
              <c:forEach items="${form.textRenderer.multistateValues}" var="msValue">
                textRendererEditor.addMultistateValue("${sst:dquotEncode(msValue.key)}",
                		"${sst:dquotEncode(msValue.text)}", "${sst:dquotEncode(msValue.colour)}");
              </c:forEach>
            </c:when>
            <c:when test='${form.textRenderer.typeName == "textRendererNone"}'>
            </c:when>
            <c:when test='${form.textRenderer.typeName == "textRendererPlain"}'>
              $set("textRendererPlainSuffix", "${sst:dquotEncode(form.textRenderer.suffix)}");
            </c:when>
            <c:when test='${form.textRenderer.typeName == "textRendererRange"}'>
              $set("textRendererRangeFormat", "${sst:dquotEncode(form.textRenderer.format)}");
              <c:forEach items="${form.textRenderer.rangeValues}" var="rgValue">
                textRendererEditor.addRangeValue("${rgValue.from}", "${rgValue.to}", "${sst:dquotEncode(rgValue.text)}",
                        "${sst:dquotEncode(rgValue.colour)}");
              </c:forEach>
            </c:when>
            <c:when test='${form.textRenderer.typeName == "textRendererTime"}'>
              $set("textRendererTimeFormat", "${sst:dquotEncode(form.textRenderer.format)}");
              $set("textRendererTimeConversionExponent", "${sst:dquotEncode(form.textRenderer.conversionExponent)}");
            </c:when>
            <c:otherwise>
              dojo.debug("Unknown text renderer: ${form.textRenderer.typeName}");
            </c:otherwise>
          </c:choose>
          
          textRendererEditor.change();
      }
  
      this.change = function() {
          if (currentTextRenderer)
              hide($(currentTextRenderer));
          currentTextRenderer = $("textRendererSelect").value
          show($(currentTextRenderer));
      };
      
      this.save = function(callback) {
          var typeName = $get("textRendererSelect");
          if (typeName == "textRendererAnalog")
              DataPointEditDwr.setAnalogTextRenderer($get("textRendererAnalogFormat"),
                      $get("textRendererAnalogSuffix"), callback);
          else if (typeName == "textRendererBinary")
              DataPointEditDwr.setBinaryTextRenderer($get("textRendererBinaryZero"), 
                      dijit.byId("textRendererBinaryZeroColour").selectedColour, $get("textRendererBinaryOne"),
                      dijit.byId("textRendererBinaryOneColour").selectedColour, callback);
          else if (typeName == "textRendererMultistate")
              DataPointEditDwr.setMultistateRenderer(multistateValues, callback);
          else if (typeName == "textRendererNone")
              DataPointEditDwr.setNoneRenderer(callback);
          else if (typeName == "textRendererPlain")
              DataPointEditDwr.setPlainRenderer($get("textRendererPlainSuffix"), callback);
          else if (typeName == "textRendererRange")
              DataPointEditDwr.setRangeRenderer($get("textRendererRangeFormat"), rangeValues, callback);
          else if (typeName == "textRendererTime")
              DataPointEditDwr.setTimeTextRenderer($get("textRendererTimeFormat"),
                      $get("textRendererTimeConversionExponent"), callback);
          else
              callback();
      };
      
      //
      // List objects
      this.MultistateValue = function() {
          this.key;
          this.text;
          this.colour;
      };
      
      this.RangeValue = function() {
          this.from;
          this.to;
          this.text;
          this.colour;
      };
      
      //
      // Multistate list manipulation
      this.addMultistateValue = function(theKey, text, colour) {
          if (!theKey)
              theKey = $get("textRendererMultistateKey");
          var theNumericKey = parseInt(theKey);
          if (isNaN(theNumericKey)) {
              alert("<fmt:message key="pointEdit.text.errorParsingKey"/>");
              return false;
          }
          for (var i=multistateValues.length-1; i>=0; i--) {
              if (multistateValues[i].key == theNumericKey) {
                  alert("<fmt:message key="pointEdit.text.listContainsKey"/> "+ theNumericKey);
                  return false;
              }
          }
          
          var theValue = new this.MultistateValue();
          theValue.key = theNumericKey;
          if (text)
              theValue.text = text;
          else
              theValue.text = $get("textRendererMultistateText");
          if (colour)
              theValue.colour = colour;
          else
              theValue.colour = dijit.byId("textRendererMultistateColour").selectedColour;
          multistateValues[multistateValues.length] = theValue;
          this.sortMultistateValues();
          this.refreshMultistateList();
          $set("textRendererMultistateKey", theNumericKey+1);
          
          return false;
      };
      
      this.removeMultistateValue = function(theValue) {
          for (var i=multistateValues.length-1; i>=0; i--) {
              if (multistateValues[i].key == theValue)
                  multistateValues.splice(i, 1);
          }
          this.refreshMultistateList();
          return false;
      };
      
      this.sortMultistateValues = function() {
          multistateValues.sort( function(a,b) { return a.key-b.key; } );
      };
      
      this.refreshMultistateList = function() {
          dwr.util.removeAllRows("textRendererMultistateTable");
          dwr.util.addRows("textRendererMultistateTable", multistateValues, [
                  function(data) { return data.key; },
                  function(data) { 
                      if (data.colour)
                          return "<span style='color:"+ data.colour +"'>"+ data.text +"</span>";
                      return data.text;
                  },
                  function(data) {
                      return "<a href='#' onclick='return textRendererEditor.removeMultistateValue("+ data.key +
                             ");'><img src='images/bullet_delete.png' width='16' height='16' "+
                             "title='<fmt:message key="common.delete"/>'/><\/a>";
                  }
                  ], null);
      };
      
      //
      // Range list manipulation
      this.addRangeValue = function(theFrom, theTo, text, colour) {
          if (!theFrom)
              theFrom = parseFloat($get("textRendererRangeFrom"));
          if (isNaN(theFrom)) {
              alert("<fmt:message key="pointEdit.text.errorParsingFrom"/>");
              return false;
          }
          
          if (!theTo)
              theTo = parseFloat($get("textRendererRangeTo"));
          if (isNaN(theTo)) {
              alert("<fmt:message key="pointEdit.text.errorParsingTo"/>");
              return false;
          }
          
          if (isNaN(theTo >= theFrom)) {
              alert("<fmt:message key="pointEdit.text.toGreaterThanFrom"/>");
              return false;
          }
          
          for (var i=0; i<rangeValues.length; i++) {
              if (rangeValues[i].from == theFrom && rangeValues[i].to == theTo) {
                  alert("<fmt:message key="pointEdit.text.listContainsRange"/> "+ theFrom +" - "+ theTo);
                  return false;
              }
          }
          
          var theValue = new this.RangeValue();
          theValue.from = theFrom;
          theValue.to = theTo;
          if (text)
              theValue.text = text;
          else
              theValue.text = $get("textRendererRangeText");
          if (colour)
              theValue.colour = colour;
          else
              theValue.colour = dijit.byId("textRendererRangeColour").selectedColour;
          rangeValues[rangeValues.length] = theValue;
          this.sortRangeValues();
          this.refreshRangeList();
          $set("textRendererRangeFrom", theTo);
          $set("textRendererRangeTo", theTo + (theTo - theFrom));
          return false;
      };
      
      this.removeRangeValue = function(theFrom, theTo) {
          for (var i=rangeValues.length-1; i>=0; i--) {
              if (rangeValues[i].from == theFrom && rangeValues[i].to == theTo)
                  rangeValues.splice(i, 1);
          }
          this.refreshRangeList();
          return false;
      };
      
      this.sortRangeValues = function() {
          rangeValues.sort( function(a,b) {
              if (a.from == b.from)
                  return a.to-b.to;
              return a.from-b.from;
          });
      };
      
      this.refreshRangeList = function() {
          dwr.util.removeAllRows("textRendererRangeTable");
          dwr.util.addRows("textRendererRangeTable", rangeValues, [
                  function(data) { return data.from; },
                  function(data) { return data.to; },
                  function(data) { 
                      if (data.colour)
                          return "<span style='color:"+ data.colour +"'>"+ data.text +"</span>";
                      return data.text;
                  },
                  function(data) {
                      return "<a href='#' onclick='return textRendererEditor.removeRangeValue("+
                             data.from +","+ data.to +");'><img src='images/bullet_delete.png' width='16' "+
                             "height='16' title='<fmt:message key="common.delete"/>'/><\/a>";
                  }
                  ], null);
      };
      
      //
      // Color handling
      this.handlerRangeColour = function(colour) {
          dijit.byId("textRendererRangeColour").selectedColour = colour;
          $("textRendererRangeText").style.color = colour;
      };
      this.handlerMultistateColour = function(colour) {
          dijit.byId("textRendererMultistateColour").selectedColour = colour;
          $("textRendererMultistateText").style.color = colour;
      };
      this.handlerBinaryZeroColour = function(colour) {
          dijit.byId("textRendererBinaryZeroColour").selectedColour = colour;
          $("textRendererBinaryZero").style.color = colour;
      };
      this.handlerBinaryOneColour = function(colour) {
          dijit.byId("textRendererBinaryOneColour").selectedColour = colour;
          $("textRendererBinaryOne").style.color = colour;
      };
  }
  var textRendererEditor = new TextRendererEditor();
  dojo.ready(textRendererEditor, "init");
</script>