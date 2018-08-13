module Vector exposing (Empty, OneMoreThan, Vector, empty, foldl, foldr, head, length, map, prepend, reverse, singleton, tail)


type Vector length a
    = Vector (List a)


type Empty
    = Empty Empty


type OneMoreThan length
    = OneMoreThan (OneMoreThan length)


singleton : a -> Vector (OneMoreThan Empty) a
singleton a =
    Vector [ a ]


empty : Vector Empty a
empty =
    Vector []


prepend : a -> Vector length a -> Vector (OneMoreThan length) a
prepend elem (Vector list) =
    Vector (elem :: list)


head : Vector (OneMoreThan length) a -> a
head (Vector list) =
    case list of
        elem :: _ ->
            elem

        [] ->
            -- Types enforce that this code is unreachable
            head (Vector list)


tail : Vector (OneMoreThan length) a -> Vector length a
tail (Vector list) =
    case list of
        _ :: rest ->
            Vector rest

        [] ->
            -- Types enforce that this code is unreachable
            tail (Vector list)


length : Vector length a -> Int
length (Vector list) =
    List.length list


map : (a -> b) -> Vector length a -> Vector length b
map transform (Vector list) =
    List.map transform list
        |> Vector


reverse : Vector length a -> Vector length a
reverse (Vector list) =
    Vector (List.reverse list)


foldl : (a -> b -> b) -> b -> Vector length a -> b
foldl step initial (Vector list) =
    List.foldl step initial list


foldr : (a -> b -> b) -> b -> Vector length a -> b
foldr step initial (Vector list) =
    List.foldr step initial list
