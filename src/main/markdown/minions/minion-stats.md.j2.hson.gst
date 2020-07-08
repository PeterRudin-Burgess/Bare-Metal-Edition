<%
import org.apache.commons.math3.special.Erf;

public double roundZ(double _val)
{
    if (_val < 0) {
        return Math.ceil(_val);
    }
    return Math.floor(_val);
}

def _rmss_stat_mod(_s)
{
    if(_s>100) return (int)Math.ceil((_s-95)*2.0);
    if(_s>=90) return (int)Math.ceil((_s-81)*0.5);
    if(_s>=70) return (int)Math.ceil((_s-67)*0.2);
    if(_s>=31) return  (int)0;
    if(_s>=11) return  (int)Math.ceil((_s-33)*0.2);
    if(_s>0) return  (int)Math.ceil((_s-21)*0.5);
    return -10;
}

def _bme_stat_mod(_s)
{
return (int)roundZ((_s-50.0)/6.0);
}

def _rmu_stat_mod(_s)
{
    if(_s>=95) return (int)(_s-85);
    if(_s>=87) return (int)Math.floor((_s-66)/3.0);
    if(_s>=18) return (int)Math.floor((_s-48)/6.0);
    if(_s>=7) return (int)Math.floor((_s-33)/3.0);
    return _s-16;
}

def _rmc_stat_mod(_s)
{
    if(_s>=102) return 35;
    if(_s>=101) return 30;
    if(_s>=100) return 25;
    if(_s>=98) return 20;
    if(_s>=95) return 15;
    if(_s>=90) return 10;
    if(_s>=85) return 5;
    if(_s>=75) return 5;
    if(_s>=60) return 0;
    if(_s>=40) return 0;
    if(_s>=25) return 0;
    if(_s>=15) return -5;
    if(_s>=10) return -5;
    if(_s>=5) return -10;
    if(_s>=3) return -15;
    if(_s>=2) return -20;
    return -25;
}

// =50+(NORM.DIST(LVL*5;0;50;1)*(50+(LVL/30)))

def calc_base_stat(_stat, _level)
{
    def _base = 50+(_norm_dist(_level*5,0,50,true)*(50+(_level/30)));
    return (_stat*_base)/100;
}

def _norm_dist(_x, /*mean*/ _mue, /*standard deviation*/ _sigma, bCumulative)
{
    if (bCumulative)
        return (_integral_phi((_x-_mue)/_sigma));
    else
        return (_phi((_x-_mue)/_sigma)/_sigma);
}

def _phi(_x)
{
    return  0.39894228040143268 * Math.exp(-(_x * _x) / 2.0);
}

def _integral_phi(_x)
{ // Using gauss(x)+0.5 has severe cancellation errors for x<-4
    return 0.5 * Erf.erfc(-_x * 0.7071067811865475); // * 1/sqrt(2)
}

def rank_bonus(r)
{
    if(r <= 10) return (r * 5);
    if(r <= 20) return (50 + ((r - 10) * 2));
    return (50 + r);
//    if(r <= 30) return (50 + r);
//    return (80 + ((r - 30) / 2));
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

    statmod: [
<%
for(_stat in 0 .. 200){
    print String.format('[ %d', _stat);
        print String.format(', %d', _rmc_stat_mod((int)_stat));
        print String.format(', %d', _rmss_stat_mod((int)_stat));
        print String.format(', %d', _rmu_stat_mod((int)_stat));
        print String.format(', %d', _bme_stat_mod((int)_stat));
    print ' ]\n';
}
%>
    ]

    stats: [
<%
for(n in 0 .. 500){
    print String.format('[ %d', n);
    [ 99, 96, 92, 88, 84, 80, 76, 72, 68, 64].each { _s ->
        def _m = ((int)(127-global.permutation[(n+_s)%global.permutation.size()]))>>5;
        def _stat = calc_base_stat(_s, n)+_m;
        print String.format(', %d', (int)_stat);
        print ', [ ';
        print String.format(' %d', _rmc_stat_mod((int)_stat));
        print String.format(', %d', _rmss_stat_mod((int)_stat));
        print String.format(', %d', _rmu_stat_mod((int)_stat));
        print String.format(', %d', _bme_stat_mod((int)_stat));
        print ' ]';
    }

    print ' ]\n';
}
%>
    ]

    oe: [
<%
for(n in 0 .. 100){
    print String.format('[ %d', n);
    def _c = _norm_dist(n,50,50,true);
    print String.format(', %d', (int)(_c*100));
    def _g = (25+n*2);
    print String.format(', %d', (int)(_g));
    print String.format(', %d', (int)(50*100/(_g)));

    print ' ]\n';
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