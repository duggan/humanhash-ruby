#humanhash-ruby

humanhash provides human-readable representations of digests. 

This is a fork of Jacob Carlson's [port](https://github.com/jacobwcarlson/humanhash-ruby) 
of a HumanHash implementation. It rearranges the library, adding some tests
and helper methods to make usage more similar to [Zachary Voase's Python
implementation](https://github.com/zacharyvoase/humanhash), while retaining extensibility.

## Examples

    irb(main):001:0> require 'humanhash'
    irb(main):002:0> digest = '535061bddb0549f691c8b9c012a55ee2'
    irb(main):003:0> HumanHash.humanize(digest)
    => "alpha-twenty-mockingbird-twelve"
    irb(main):004:0>
    irb(main):005:0* HumanHash.uuid
    => ["illinois-michigan-sad-bulldog", "7030c321-c015-4f84-88df-8da92138831b"]

## Caveats

Don't store the humanhash output, as its statistical uniqueness is only
256^words. Its intended use is as a human-readable (and, most
importantly, **memorable**) representation of a longer digest, unique enough
for display in a user interface, where a user may need to remember or verbally
communicate the identity of a hash, without having to remember a 40-character
hexadecimal sequence. Nevertheless, you should keep original digests around,
then pass them through `humanize()` only as you're displaying them.


## How It Works

The procedure for generating a humanhash involves compressing the input to a
fixed length (default: 4 bytes), then mapping each of these bytes to a word in
a pre-defined wordlist (a default wordlist is supplied with the library). This
algorithm is consistent, so the same input, given the same wordlist, will
always give the same output. You can also use your own wordlist, and specify a
different number of words for output.


## (Un)license

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this
software, either in source code form or as a compiled binary, for any purpose,
commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this
software dedicate any and all copyright interest in the software to the public
domain. We make this dedication for the benefit of the public at large and to
the detriment of our heirs and successors. We intend this dedication to be an
overt act of relinquishment in perpetuity of all present and future rights to
this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
