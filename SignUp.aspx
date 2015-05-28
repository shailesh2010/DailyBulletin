<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
        
        <table  id="form" style="width: 68%;" align="right" bgcolor="White" cellspacing="15">
            <tr>
                <td class="style4" bgcolor="#DC0000" colspan="2" 
                    
                    style="height: 69px; font-size: xx-large; text-align: center; color: #FFFFFF">
                    SIGN UP HERE</td>
                
            </tr>
            <tr>
                <td class="style4" style="height: 61px; width: 341px" valign="top">
                Enter User Name 
                    &nbsp;</td>
                <td class="style6" style="height: 61px; width: 675px" valign="top">
                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" 
                        ontextchanged="TextBox1_TextChanged" Width="220px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Username is required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="style2" style="width: 341px; height: 2px;" valign="top">
                    Enter Password
                    &nbsp;</td>
                <td class="style3" style="width: 675px; height: 2px;" valign="top">
                    <asp:TextBox ID="TextBox2" runat="server" Height="22px" TextMode="Password" Width="220px" 
                        style="margin-right: 0px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="password is required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    &nbsp;</td>
               
                
            </tr>
            <tr>
                <td class="style2" style="width: 341px; height: 1px;" valign="top">
                    Re-Enter Password
                    &nbsp;</td>
                <td class="style3" style="width: 675px; height: 1px;" valign="top">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Height="22px" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="password is reqired" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="enter same password" ControlToValidate="TextBox3" ControlToCompare="TextBox2"></asp:CompareValidator>
                    &nbsp;</td>
                
            </tr>
            <tr>
            <td class="style2" style="width: 341px" valign="top">
            Select Security Question
            </td>
            <td class="style3" style="width: 675px" valign="top">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="225px" Height="29px">
                    <asp:ListItem>What is your favourite color</asp:ListItem>
                    <asp:ListItem>What is your birth city</asp:ListItem>
                    <asp:ListItem>What is your hobby</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
            </tr>
            <tr>
            <td class="style2" style="width: 341px" valign="top">
            Enter Answer
            </td>
            <td class="style3" style="width: 675px" valign="top">
                <asp:TextBox ID="TextBox4" runat="server" Height="22px" Width="220px" 
                    style="margin-bottom: 0px"></asp:TextBox>
                 <br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Security Answer is required" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                <br />
            </td>
            </tr>
             <tr>
                <td colspan="2">
                    <cc1:CaptchaControl ID="Captcha1" runat="server" BackColor="Silver" 
            BorderColor="#FF9900" BorderWidth="10px" CaptchaBackgroundNoise="Medium" 
            CaptchaHeight="60" CaptchaLength="5" CaptchaLineNoise="None" 
            CaptchaMaxTimeout="240" CaptchaMinTimeout="5" CaptchaWidth="200" 
            FontColor="#529E00" style="top: 154px; left: 0px; position: absolute" 
            Width="169px" NoiseColor="DarkGray" Height="36px" />
                    <br />
                    &nbsp;<asp:Label ID="Label3" runat="server" Text="enter captcha here "></asp:Label>
&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox5" 
                        runat="server" Height="22px" style="margin-left: 63px" Width="160px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="enter captcha value" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    
                 </td>
               
                
            </tr>
             <tr>
                <td colspan="2" style="height: 47px">
                    <asp:Button ID="signup" runat="server" Text="SUBMIT" onclick="signup_Click" 
                        
                        style="text-align: center; z-index: 1; left: 573px; top: 805px; position: absolute; height: 32px; width: 111px;" 
                        BackColor="Red" BorderStyle="None" ForeColor="White" />
                    </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary= "true" />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" 
                        ForeColor="Red" 
                        
                        
                        
                        style="position: absolute; z-index: 1; left: 733px; top: 812px; text-align: center">HOME</asp:HyperLink>
                    <br />
                    &nbsp;</td>
               
                
            </tr>
        </table>
        
    </div>
 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

