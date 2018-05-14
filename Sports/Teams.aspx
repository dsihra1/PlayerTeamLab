<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teams.aspx.cs" Inherits="Teams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="dsTeamList" runat="server" ConnectionString="<%$ ConnectionStrings:PROG1198_SportDatabaseConnectionString %>" SelectCommand="SELECT [teamID], [teamName] FROM [Team] ORDER BY [teamName]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddlSelectTeam" runat="server" AutoPostBack="True" DataSourceID="dsTeamList" DataTextField="teamName" DataValueField="teamID">
        </asp:DropDownList>
        <br />
        <br />
    
        <asp:SqlDataSource ID="dsTeam" runat="server" ConnectionString="<%$ ConnectionStrings:PROG1198_SportDatabaseConnectionString %>" DeleteCommand="DELETE FROM [Team] WHERE [teamID] = @teamID" InsertCommand="INSERT INTO [Team] ([teamName], [teamRank]) VALUES (@teamName, @teamRank)" SelectCommand="SELECT * 
FROM [Team] 
WHERE teamID = @teamID" UpdateCommand="UPDATE [Team] SET [teamName] = @teamName, [teamRank] = @teamRank WHERE [teamID] = @teamID">
            <DeleteParameters>
                <asp:Parameter Name="teamID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="teamName" Type="String" />
                <asp:Parameter Name="teamRank" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSelectTeam" Name="teamID" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="teamName" Type="String" />
                <asp:Parameter Name="teamRank" Type="Int32" />
                <asp:Parameter Name="teamID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="dvTeam" runat="server" AutoGenerateRows="False" DataKeyNames="teamID" DataSourceID="dsTeam" Height="50px" Width="125px" AllowPaging="True" OnItemCommand="dvTeam_ItemCommand">
            <Fields>
                <asp:TemplateField HeaderText="Team Name" SortExpression="teamName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("teamName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must enter the team name." ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("teamName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("teamName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="teamRank" HeaderText="Team Rank" SortExpression="teamRank" />
                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    
    </div>
    </form>
</body>
</html>
