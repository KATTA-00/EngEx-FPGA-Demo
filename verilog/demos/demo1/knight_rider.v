// Demo 1: Knight Rider LED Sweep
// Board: DE2-115
module knight_rider (
    input  wire CLOCK_50,     // 50 MHz clock
    input  wire RESET_N,      // Active-low reset button
    input  wire SW0,          // Speed select switch (0 = slow, 1 = fast)
    output reg  [17:0] LEDR   // LEDs
);

    // Clock divider
    reg [25:0] counter;       // 26-bit counter
    reg        direction;     // 0 = left, 1 = right
    reg [17:0] pattern;


    wire [25:0] limit;
    assign limit = SW0 ? 26'd5_000_0000000 : 26'd25_000_000000; 
    // ~0.1s fast, ~0.5s slow (adjust for your clock)

    always @(posedge CLOCK_50 or negedge RESET_N) begin
        if (!RESET_N) begin
            pattern   <= 18'b000000000000000001; // start at rightmost LED
            direction <= 0;
            counter   <= 0;
        end else begin
            if (counter >= limit) begin
                counter <= 0;
                // Move pattern
                if (direction == 0) begin
                    // moving left
                    if (pattern[17]) begin
                        direction <= 1; // reached left end
                        // keep leftmost LED lit for one cycle
                        pattern <= pattern;
                    end else begin
                        pattern <= pattern << 1;
                    end
                end else begin
                    // moving right
                    if (pattern[0]) begin
                        direction <= 0; // reached right end
                        // keep rightmost LED lit for one cycle
                        pattern <= pattern;
                    end else begin
                        pattern <= pattern >> 1;
                    end
                end
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // Drive LEDs
    always @(*) begin
        LEDR = pattern;
    end

endmodule
