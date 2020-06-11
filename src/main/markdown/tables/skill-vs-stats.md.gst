#### Stat Bonus for Skills

|Skill  | Bonus Stats |
|:------------|---------------:|
<%
global.skills.groups.each { g ->
    print String.format('| **%s** ||\n', g);
    global.skills[g].each{ s ->
        print String.format('| %s | %s |\n', s[0], s[1]);
    };
};
%>

