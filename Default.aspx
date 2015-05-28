<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxImageSlider" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
    


<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">

    <div>
           
        &nbsp;&nbsp;&nbsp;
           <asp:ImageButton ID="ImageButton1" runat="server" Width="22px" 
            BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" 
            CausesValidation="False" Height="18px" ImageAlign="AbsBottom" 
            ImageUrl="~/calendar.png" onclick="ImageButton1_Click" />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
            onselectionchanged="Calendar1_SelectionChanged" ShowGridLines="True" 
            Width="220px" ondayrender="Calendar1_DayRender">
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
        <asp:Label ID="Label4" runat="server" Font-Size="1.7em"  BackColor="#CC0000" ForeColor="White" 
            Height="30px" Width="540px"></asp:Label>

        <br />
        <br />
        <asp:Label ID="Label2" runat="server" ></asp:Label>

        <br />

        <br />    
        <asp:Panel ID="Panel1" runat="server" BackColor="#FFFFCC" >
        </asp:Panel>   

        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" 
            RenderMode="Lightweight" Height="524px" Width="558px" 
            AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" 
            PopupAnimationType="Slide" ShowMaximizeButton="True" 
            ShowRefreshButton="True" BackColor="#FFCC99">
            
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                </dx:PopupControlContentControl>
</ContentCollection>
            
            <Border BorderColor="Black" BorderWidth="5px" />
            <BorderLeft BorderColor="Black" BorderWidth="5px" />
            <BorderTop BorderColor="Black" BorderWidth="5px" />
            <BorderRight BorderColor="Black" BorderWidth="5px" />
            <BorderBottom BorderColor="Black" />
            
        </dx:ASPxPopupControl>
    <br />
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
    <br />
     
    </div>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="Login">
    <div>
    
           
        <table id="form" style="width:99%;">

         <tr>
                <td class="style9" bgcolor="#DC0000" colspan="2" 
                    
                    style="font-size:x-large; color: #FFFFFF; height: 39px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;SIGN IN
                    </td>
                
            </tr>
            <tr>
                <td class="style1" style="width: 28px; height: 61px;">
                    Username</td>
                <td class="style2" style="width: 103px; height: 61px;">
                    <asp:TextBox ID="txtusername" runat="server" Width="156px" 
                        style="margin-left: 0px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter username " ControlToValidate="txtusername"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="style1" style="width: 28px; height: 58px;">
                    Password</td>
                <td class="style2" style="width: 103px; height: 58px;">
                    <asp:TextBox ID="txtpassword" runat="server" Width="155px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter password" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="style1" colspan="2" style="height: 47px">
                    <asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" 
                        
                        style="z-index: 1; top: 441px; position: absolute; width: 100px; left: 957px; height: 29px;" 
                        BackColor="Red" ForeColor="White" />
                    </td>
                
                
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF6666"></asp:Label>
                </td>
               
            </tr>
            <tr>
            <td colspan="2" class="style3">
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                    onclick="LinkButton1_Click" ForeColor="#CC0000">Forget Password</asp:LinkButton>
            </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#CC0000" 
                        NavigateUrl="~/signup.aspx">click here to sign up</asp:HyperLink>
                </td>
               
            </tr>
        </table>
    <br />
        <br />
        <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" 
                    BinaryImageCacheFolder="~\Thumb\" Height="331px" ImageSourceFolder="~/abc" 
                    Width="300px" style="margin-bottom: 0px">
                    <SettingsImageArea ImageSizeMode="FillAndCrop" />
                    <SettingsSlideShow AutoPlay="True" />
                </dx:ASPxImageSlider>
        </asp:ContentPlaceHolder>
           
    </div>
    
</asp:Content>

