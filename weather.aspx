<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="weather.aspx.cs" Inherits="weather" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <a href="http://www.accuweather.com/en/us/new-york-ny/10007/weather-forecast/349727" class="aw-widget-legal">
<!--
By accessing and/or using this code snippet, you agree to AccuWeather’s terms and conditions (in English) which can be found at http://www.accuweather.com/en/free-weather-widgets/terms and AccuWeather’s Privacy Statement (in English) which can be found at http://www.accuweather.com/en/privacy.
-->
</a><div id="awtd1398364163968" class="aw-widget-36hour"  data-locationkey="" data-unit="f" data-language="en-us" data-useip="true" data-uid="awtd1398364163968" data-editlocation="true"></div><script type="text/javascript" src="http://oap.accuweather.com/launch.js"></script></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login" Runat="Server">
</asp:Content>



