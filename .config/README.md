# My Dotfiles
I am just backing up my dotfiles because I think I'd like to move everything to Guix.

## Might move to GuixSD and Emacs soon
Hopefully, I will get a job I interviewed for recently, and their system probably isn't conducive to my eccentricity, and their computers all use either Windows or Macs, so my hope is that, switching to Emacs and Guix will allow me to port my system relatively well to the company's system, as any changes I make to my home Emacs would be easy to sync with my work Emacs.

### So why Guix?
Guix and Emacs both use a Lisp dialect called Scheme (`.scm` files), and the 'home package' on Guix, if I recall correctly, would allow me to have one big `config.scm` to define all of my dotfiles, which sounds nice. I imagine that will make my Github look cleaner too.

Guix also makes it easy to create a contained, *pure* shell environment, so I would be able to test and debug code knowing nothing else is messing with my program. The GNU people also tout Guix's ability to make things reproducible, which is neat, but I do not see how that would benefit me personally. So, to stop my rambling, the benefits I hope to get:

1. Having one big config file for all my dotfiles;
2. Learning a new development environment;
3. Learning Lisp (I know basically zero Lisp at present);
4. Having a "clean" debug environment; and
5. Playing around with a new system.
