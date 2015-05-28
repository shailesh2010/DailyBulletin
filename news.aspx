<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxImageSlider" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
            onselectionchanged="Calendar1_SelectionChanged" ShowGridLines="True" 
            Width="220px">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
        <br />
        <asp:Table ID="Table1" runat="server" Width="200px">
            
        </asp:Table>
        <asp:Label ID="Label1" runat="server" ></asp:Label>

        <br />    
        <asp:Panel ID="Panel1" runat="server" Width="200px">
        </asp:Panel>   

        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" 
            RenderMode="Lightweight" Height="524px" Width="1261px" 
            AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" 
            PopupAnimationType="Slide" ShowMaximizeButton="True" ShowRefreshButton="True">
            
            <ContentCollection>
                <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                </dx:PopupControlContentControl>
</ContentCollection>
            
        </dx:ASPxPopupControl>
    <br />
    <br />

    </div>
</asp:Content>

