module Example exposing (..)

import Vector exposing (..)


empty : Vector Empty a
empty =
    Vector.empty


one : Vector (OneMoreThan Empty) String
one =
    Vector.prepend "foo" Vector.empty


two : Vector (OneMoreThan (OneMoreThan Empty)) String
two =
    Vector.prepend "bar" one


three : Vector (OneMoreThan (OneMoreThan (OneMoreThan Empty))) String
three =
    Vector.prepend "baz" two


headOfThree : String
headOfThree =
    Vector.head three


tailOfThree : Vector (OneMoreThan (OneMoreThan Empty)) String
tailOfThree =
    Vector.tail three



-- Does not compile! (And well it shouldn't.)
--
-- headOfEmpty =
--     Vector.head empty
--
--
-- tailOfEmpty =
--     Vector.tail empty
