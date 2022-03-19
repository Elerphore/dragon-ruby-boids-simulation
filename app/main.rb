=begin 
    Reference
    https://eater.net/boids
=end

$gtk.args.state.width ||= 600
$gtk.args.state.height ||= 600

$gtk.args.state.square_speed ||= 5
$gtk.args.state.vector ||= {x: 0, y: 0}
$gtk.args.state.pos_squre ||= {x: 300, y: 300}

def move_square args
    # args.state.pos_squre.x = args.state.pos_squre.x + args.state.square_speed;
    
    if args.state.pos_squre[:x] > args.state.width
        $gtk.args.state.square_speed = -5
    elsif args.state.pos_squre[:x] < 0
        $gtk.args.state.square_speed = 5
    end
    
    $gtk.args.state.vector[:x] = $gtk.args.state.vector[:x] + $gtk.args.state.square_speed
    
    $gtk.args.state.pos_squre.x = $gtk.args.state.vector.x
    puts $gtk.args.state.pos_squre.x
end

def tick args
    args.outputs.background_color = [100, 0, 100]
    # args.state.pos_squre = args.state.pos_squre + (args.state.tick_count / 10000)
    
    move_square args
    
    args.outputs.primitives << [
        { 
            x: 200,
            y: 680,
            text: "Мила, самая прекрасная",
            r: 125,
            g: 0,
            b: 200,
            a: 255,
        },
        { 
            x: 400,
            y: 640,
            text: "И",
            r: 125,
            g: 0,
            b: 200,
            a: 255,
        },
        { 
            x: 200,
            y: 600,
            text: "восхитительная девочка.",
            r: 125,
            g: 0,
            b: 200,
            a: 255,
        },
        {
            primitive_marker: :solid,
            x: args.state.pos_squre.x,
            y: 300,
            h: 50,
            w: 50,
            r: 255,
            g: 0,
            b: 0,
            a: 255,
        }
    ]
end
