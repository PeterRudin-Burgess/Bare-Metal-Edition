# Star Systems

<%

gamestate.galactic_object.each { k,v ->

    //if(v.type == 'star')
    //{
        print String.format('## %s (%s)\n\n', v.name, v.star_class);

        print String.format('x=%d y=%d (pc)\n\n', (int)(v.coordinate.x*97), (int)(v.coordinate.y*97));

        print '| Type | Name | Class | Orbit | Size | Comment |\n|:----------|:------------------------------|:--------|:----:|:----:|:------------------------------|\n';

        v.__dupkeys__?.planet?.each { _pk ->
            def _pid = String.format('%s', (int)v[_pk])
            def _planet = gamestate.planets.planet[_pid];
            if(_planet.planet_class.endsWith('_star'))
            {
                print String.format('| Star | %s | %s | %d | %d | |\n', _planet.name, _planet.planet_class, (int)_planet.orbit, (int)_planet.planet_size);
            }
            else
            if(_planet.planet_class.endsWith('_asteroid'))
            {
                print String.format('| Asteroid | %s | %s | %d | %d | |\n', _planet.name, _planet.planet_class, (int)_planet.orbit, (int)_planet.planet_size);
            }
            else
            if(_planet.orbit>0 && !_planet.is_moon)
            {
                print String.format('| Planet | %s | %s | %d | %d | %s |\n', _planet.name, _planet.planet_class, (int)_planet.orbit, (int)_planet.planet_size, (_planet.num_sapient_pops>0 ? 'p='+((int)_planet.num_sapient_pops):''));

                /*
                {
                planet_class=pc_gas_giant,
                orbit=105.0,
                moons=[1118.0, 1119.0, 1120.0, 1121.0],
                name=Teae I,
                planet_size=25.0
                }
                */
            }
            else
            if(_planet.is_moon)
            {
                print String.format('| Moon | %s | %s | %d | %d | %s |\n', _planet.name, _planet.planet_class, (int)_planet.orbit, (int)_planet.planet_size, (_planet.num_sapient_pops>0 ? 'p='+((int)_planet.num_sapient_pops):''));
            }
        };

        print '\n\n';
    //}
};


%>