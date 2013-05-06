$(function() {

    // define variables for force graph
    var w = 900,
        h = 500,
        node,
        link,
        labels,
        root,
        linkIndexes;

    // defines TICK for nodes in graph
    function tick(e) {
        link.attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });
        
        node.attr('cx', function(d) { return d.x; })
            .attr('cy', function(d) { return d.y; });

        labels.attr('transform', function(d) {
            return 'translate(' + d.x + ',' + d.y + ')';
        });
    }

    // sets the colors type for metaphor and snippet nodes
    function color(d) {
        return (d.type === 'm') ? '#3182bd' : '#c6dbef';
    }

    // returns the TYPESIZE of the node as a val 0-1
    function typeSize(d) {
        var s;
        if (d.type === 'm') {
            s = d.count / root.maxMetaphorCount;
        } else {
            s = d.count / root.maxSnippetCount;
        }
        return s;
    }

    // returns the radius of a node based on TYPESIZE()
    function radius(d) {
        var r = typeSize(d);
        if (d.type === 'm') {
            r = Math.max(r * 25, 5);
        } else {
            r = Math.max(r * 40, 10);
        }
        return r;
    }

    // returns the 'charge' of the node
    function charge(d, i) { 
        var r = typeSize(d);
        return -r * 1000;
    }

    // returns a connection between nodes A, B
    function isConnected(a, b) {
        return linkIndexes[a.index + ',' + b.index] || a.index == b.index;
    }

    // returns the opacity function for the force graph
    function fade(bo) {

        // sets different opacity for a given selected node and its children
        return function(d) {
            var opacity = bo ? 0.2 : 1;
            var rad = radius(d);

            node.style('stroke-opacity', function(o) {
                thisOpac = isConnected(d, o) ? 1 : opacity;
                this.setAttribute('fill-opacity', thisOpac);
                return thisOpac;
            });

            link.style('stroke-opacity', function(o) {
                return o.source === d || o.target === d ? 1 : opacity;
            });


            labels.select('text.label').remove();
            node.select('title').remove();

            if (bo) {
                labels.filter(function(o) {
                        return isConnected(o, d);
                    })
                    .append('svg:text')
                    .attr('y', function(o) {
                            return (o == d) ? (rad + 10) + 'px' : '5px';
                        })
                    .style('fill', '#C17021')
                    .attr('text-anchor', 'middle')
                    .attr('class', 'label')
                    .text(function(o) { return (o !== d) ? o.name.substr(0, 16) : ''; });

                node.filter(function(o) {
                        return o === d;
                    })
                    .append('title')
                    .text(function(o) { return o.name + ''; });
            }
        };
    }

    // defines the force graph
    var force = d3.layout.force()
        .on('tick', tick)
        .size([w, h])
        .linkDistance(120)
        //.gravity(0.05)
        .charge(charge);

    // defines the d3 visualization
    var vis = d3.select('#chart').append('svg:svg')
        .attr('width', w)
        .attr('height', h);

    // makes the graph
    function update() {
        // restart the force layout
        force
            .nodes(root.nodes)
            .links(root.links)
            .start();

        // update the links
        link = vis.selectAll('link.link')
            .data(root.links);

        // enter any new links
        link.enter().append('svg:line')
            .attr('class', 'link')
            .attr('source', function(d) { return d.source; })
            .attr('target', function(d) { return d.target; });

        // exit any old links
        link.exit().remove();

        // update the nodes
        node = vis.selectAll('circle.node')
            .data(root.nodes);
            
        // enter any new nodes
        node.enter().append('svg:circle')
            .attr('class', 'node')
            .attr('id', function(d) {
                    return d.type + d.id;
                })
            .style('fill', color)
            .attr('r', radius)
            .on('mouseover', fade(true))
            .on('mouseout', fade(false))
            .call(force.drag);

        // exit any old nodes
        node.exit().remove();

        // build fast lookup of links
        linkIndexes = {};
        root.links.forEach(function(d) {
            linkIndexes[d.source.index + ',' + d.target.index] = 1;
            linkIndexes[d.target.index + ',' + d.source.index] = 1;
        });

        // build labels
        labels = vis.selectAll('g.labelParent')
            .data(root.nodes);

        labels.enter().append('svg:g')
            .attr('class', 'labelParent');

        labels.exit().remove();

        // initial fade state
        node.each(fade(false));

        /*
        // Button toggles
        $('#songsBtn').click(function() {
            force.stop();

            typeSize = songsTypeSize;

            vis.selectAll('circle.node')
                .attr('r', radius);

            force.charge(charge).start();

            $(this).addClass('active');
            $('#playsBtn').removeClass('active');
            return false;
        });
        $('#playsBtn').click(function() {
            force.stop();

            typeSize = playsTypeSize;
            
            vis.selectAll('circle.node')
                .attr('r', radius);

            force.charge(charge).start();

            $(this).addClass('active');
            $('#songsBtn').removeClass('active');
            return false;
        });
        */

    }

    // load the json data
    d3.json('js/forceGraphData.json', function(json) {
        root = json;
        update();
    });

});
