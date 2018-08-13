module Vector exposing (Empty, OneMoreThan, Vector, empty, foldl, foldr, head, length, map, prepend, reverse, singleton, tail)


type Vector length a
    = Vector length (List a)


type Empty
    = Empty


type OneMoreThan length
    = OneMoreThan length


singleton : a -> Vector (OneMoreThan Empty) a
singleton a =
    Vector (OneMoreThan Empty) [ a ]


empty : Vector Empty a
empty =
    Vector Empty []


prepend : a -> Vector length a -> Vector (OneMoreThan length) a
prepend elem (Vector len list) =
    Vector (OneMoreThan len) (elem :: list)


head : Vector (OneMoreThan length) a -> a
head (Vector len list) =
    case list of
        elem :: _ ->
            elem

        [] ->
            -- Types enforce that this code is unreachable
            head (Vector len list)


tail : Vector (OneMoreThan length) a -> Vector length a
tail (Vector (OneMoreThan len) list) =
    case list of
        _ :: rest ->
            Vector len rest

        [] ->
            -- Types enforce that this code is unreachable
            tail (Vector (OneMoreThan len) list)


length : Vector length a -> Int
length (Vector _ list) =
    List.length list


map : (a -> b) -> Vector length a -> Vector length b
map transform (Vector len list) =
    List.map transform list
        |> Vector len


reverse : Vector length a -> Vector length a
reverse (Vector len list) =
    Vector len (List.reverse list)


foldl : (a -> b -> b) -> b -> Vector length a -> b
foldl step initial (Vector _ list) =
    List.foldl step initial list


foldr : (a -> b -> b) -> b -> Vector length a -> b
foldr step initial (Vector _ list) =
    List.foldr step initial list
