<%

def rank_bonus(r)
{
    if(r <= 10) return (r * 5);
    if(r <= 20) return (50 + ((r - 10) * 2));
    if(r <= 30) return (70 + (r - 20));
    return (80 + ((r - 30) / 2));
}

def render_row(n)
{
    print "[ ${n}, ";
    print rank_bonus(4 + (n * 3));
    print ', ';
    print rank_bonus(3 + (n * 2));
    print ', ';
    print rank_bonus(2 + (n * 1.5));
    print ', ';
    print rank_bonus(1 + n);
    print ', ';
    print rank_bonus(n * 0.5);
    print ', ';
    print rank_bonus(n * 0.25);
    print ', ';
    print rank_bonus(n * 0.125);
    print ', ';
    print rank_bonus(n * 0.0625);
    print ', ';
    print rank_bonus(n * 0.03125);
    print ']';
}

%>{
    lequ: [
<%
for(n in 0 .. 500){
    render_row(n);
    print '\n';
}
%>
    ]

    sizes: [
        Fine
        Diminutive
        Tiny
        Small
        Medium
        Large
        Huge
        Gargantuan
        Colossal
        Titanic
    ]
    size: {
        Fine: {
            DB: 40
            OB: -40
            HT: 0.25
            CT: 20
        }
        Diminutive: {
            DB: 20
            OB: -20
            HT: 0.33
            CT: 15
        }
        Tiny: {
            DB: 10
            OB: -10
            HT: 0.5
            CT: 10
        }
        Small: {
            DB: 5
            OB: -5
            HT: 0.7
            CT: 5
        }
        Medium: {
            DB: 0
            OB: 0
            HT: 1
            CT: 0
        }
        Large: {
            DB: -5
            OB: 5
            HT: 1.5
            CT: -10
        }
        Huge: {
            DB: -10
            OB: 10
            HT: 2
            CT: -20
        }
        Gargantuan: {
            DB: -20
            OB: 20
            HT: 3
            CT: -30
        }
        Colossal: {
            DB: -40
            OB: 40
            HT: 4
            CT: -40
        }
        Titanic: {
            DB: -80
            OB: 80
            HT: 6
            CT: -50
        }
    }

    armors: [
        No Armor
        Light
        Medium
        Heavy
    ]

    types: [
        Aberration
        Animal
        Construct
        Dragon
        Fey
        Humanoid
        Magical-Beast
        Monstrous-Humanoid
        Ooze
        Outsider
        Plant
        Undead
        Vermin
    ]
    type: {
        Aberration: {
        	HTM: 0.8
            HTI: 4
        	OBI: 2
        	OBM: 1
        	OB2I: 3
        	OB2M: 1
        	OB3I: 4
        	OB3M: 1
        	OB4I: 5
        	OB4M: 1
        	ATI: 1
        	DBI: 6
        	DBM: 1
        }
        Animal: {
            HTM: 0.8
            HTI: 4
            OBI: 2
            OBM: 0.75
            OB2I: 3
            OB2M: 0.77
            OB3I: 4
            OB3M: 0.79
            OB4I: 5
            OB4M: 0.81
        	ATI: 1
        	DBI: 6
        	DBM: 1
        }
        Construct: {
            HTM: 1.0
            HTI: 4
            OBI: 1
            OBM: 1
            OB2I: 2
            OB2M: 1
            OB3I: 3
            OB3M: 1
            OB4I: 4
            OB4M: 1
        	ATI: 2
        	DBI: 8
        	DBM: 0
        }
        Dragon: {
            HTM: 2
            HTI: 3
            OBI: 1
            OBM: 1
            OB2I: 2
            OB2M: 1
            OB3I: 3
            OB3M: 1
            OB4I: 4
            OB4M: 1
        	ATI: 3
        	DBI: 6
        	DBM: 1
        }
        Fey: {
            HTM: 0.6
            HTI: 4
            OBI: 3
            OBM: 0.5
            OB2I: 4
            OB2M: 0.55
            OB3I: 5
            OB3M: 0.6
            OB4I: 6
            OB4M: 0.65
        	ATI: 0
        	DBI: 6
        	DBM: 1
        }
        Humanoid: {
            HTM: 0.8
            HTI: 4
            OBI: 2
            OBM: 0.75
            OB2I: 3
            OB2M: 0.8
            OB3I: 4
            OB3M: 0.9
            OB4I: 5
            OB4M: 1
        	ATI: 0
        	DBI: 7
        	DBM: 1
        }
        Magical-Beast: {
            HTM: 1.0
            HTI: 4
            OBI: 1
            OBM: 1
            OB2I: 2
            OB2M: 1
            OB3I: 3
            OB3M: 1
            OB4I: 4
            OB4M: 1
        	ATI: 2
        	DBI: 6
        	DBM: 1
        }
        Monstrous-Humanoid: {
            HTM: 1.0
            HTI: 4
            OBI: 1
            OBM: 1
            OB2I: 2
            OB2M: 1
            OB3I: 3
            OB3M: 1
            OB4I: 4
            OB4M: 1
        	ATI: 0
        	DBI: 6
        	DBM: 1
        }
        Ooze: {
            HTM: 0.8
            HTI: 4
            OBI: 2
            OBM: 0.75
            OB2I: 3
            OB2M: 0.8
            OB3I: 4
            OB3M: 0.9
            OB4I: 5
            OB4M: 1
        	ATI: 0
        	DBI: 6
        	DBM: 1
        }
        Outsider: {
            HTM: 1.0
            HTI: 4
            OBI: 1
            OBM: 1
            OB2I: 2
            OB2M: 1
            OB3I: 3
            OB3M: 1
            OB4I: 4
            OB4M: 1
        	ATI: 0
        	DBI: 6
        	DBM: 1
        }
        Plant: {
            HTM: 0.8
            HTI: 4
            OBI: 2
            OBM: 0.75
            OB2I: 3
            OB2M: 0.8
            OB3I: 4
            OB3M: 0.9
            OB4I: 5
            OB4M: 1
        	ATI: 0
        	DBI: 6
        	DBM: 1
        }
        Undead: {
            HTM: 0.8
            HTI: 4
            OBI: 2
            OBM: 0.75
            OB2I: 3
            OB2M: 0.8
            OB3I: 4
            OB3M: 0.9
            OB4I: 5
            OB4M: 1
        	ATI: 0
        	DBI: 6
        	DBM: 1
        }
        Vermin: {
            HTM: 0.8
            HTI: 4
            OBI: 2
            OBM: 0.75
            OB2I: 3
            OB2M: 0.8
            OB3I: 4
            OB3M: 0.9
            OB4I: 5
            OB4M: 1
        	ATI: 1
        	DBI: 6
        	DBM: 1
        }
    }
}