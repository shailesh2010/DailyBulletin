<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="text-align: center">
     <table id="form" style="width:50%;" align="right">
            <tr>
                <td  colspan="2" align="char" 
                    style="height: 60px; font-size: x-large; color: #FFFFFF;" 
                    bgcolor="#CC0000">
                    Admin Login</td>
                
            </tr>
            <tr>
                <td class="style1">
                    Username</td>
                <td>
                    <asp:TextBox ID="txtadminname" runat="server" Width="156px" ></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter admin name" ControlToValidate="txtadminname"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="style1">
                    Password</td>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" Width="155px" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter password" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="login" onclick="Button1_Click" 
                        BackColor="Red" ForeColor="White" Height="33px" style="margin-left: 11px" 
                        Width="76px" />
                    &nbsp;</td>
                
                
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF6666"></asp:Label>
                </td>
               
            </tr>           
             <tr>
                <td class="style1" colspan="2">
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        onclick="LinkButton1_Click">Forget Password</asp:LinkButton>
                </td>
               
            </tr>
           
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>


