<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="realnews.aspx.cs" Inherits="realnews" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxImageSlider" tagprefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div >
    
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" 
            BinaryImageCacheFolder="~\Thumb\">
            <SettingsImageArea ImageSizeMode="FillAndCrop" />
            <SettingsSlideShow AutoPlay="True" PausePlayingWhenMouseOver="True" />
        </dx:ASPxImageSlider>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" BackColor="White" BorderColor="#FFFFCC"></asp:Label>
    
        <br />
    
        <br />
        <br />
        <asp:Button runat="server" ID="btnPrint" Text="Print" 
                OnClientClick="javascript:window.print();" onclick="btnPrint_Click" 
            CausesValidation="False" style="height: 26px" BackColor="#3399FF"/>
    
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Post Comment" 
            CausesValidation="False" onclick="Button2_Click" BackColor="#99CCFF" />
        <br />
    
        <br />
    <asp:Panel ID="Panel1" runat="server" Visible="false" >
    
        <asp:Label ID="Label3" runat="server" Text="Enter Your Valuable Comment Here" 
            Width="100px"></asp:Label>
         &nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="116px" 
            TextMode="MultiLine" Width="228px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="comment" 
            onclick="Button1_Click" />
&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server"></asp:Label>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="enter your comment"></asp:RequiredFieldValidator>
        <br />
        </asp:Panel>
        <br />
        <asp:Button ID="Button3" runat="server" Text="View Comments" 
            CausesValidation="False" onclick="Button3_Click" BackColor="#9999FF" /><br />
&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" BackColor="#FFFFCC"></asp:Label>
        <br />
        <asp:Panel ID="Panel2" runat="server" Visible="false" >
        </asp:Panel>
        <br />
&nbsp;</div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Login" Runat="Server" >
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="navigation" Runat="Server" >
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContetPlaceHolder5" Runat="Server" >
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server" >
</asp:Content>



