<%

def clist = global.cultures.keySet();

%>
#### Skill Ranks per Culture

|Skill  |<% clist.each { c -> print String.format(' %s |', c); };  %>
|:---------------|<% clist.each { c -> print ':--------:|'; };  %>
<%
global.skills.groups.each { g ->
    print String.format('| **%s** |', g);
    clist.each { c -> print '|'; };
    print '\n';
    global.skills[g].each{ s ->
        print String.format('| %s |', s[0]);
        clist.each { c ->
            def cx = global.cultures[c].skills[s[0]];
            print String.format(' %d |', (int) (cx==null ? 0 : cx));
        };
        print '\n';

    };
};


%>

