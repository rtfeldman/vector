# Vector (🤔 experiment 🤔)

List where `head` and `tail` don't return `Maybe` and still can't crash. This works because the length of the vector
is encoded in the type, and `head` and `tail` only accept nonempty vectors.

Based on [this post](https://mail.haskell.org/pipermail/haskell/2005-May/015815.html), h/t [**@stoeffel**](https://github.com/stoeffel).
I also made it use a phantom type and a single-variant custom type, so it would have no runtime overhead compared to a plain `List`.

I haven't written docs or published this because I can't think of a situation where I would choose it over
either `List` or [`List.Nonempty`](http://package.elm-lang.org/packages/mgold/elm-nonempty-list/latest). I wrote it out of curiosity to see if I could get it to work!

If someone has encountered a use case in a project where this would be a better choice than `List` or
`List.Nonempty`, please open an issue and `@mention` me!
