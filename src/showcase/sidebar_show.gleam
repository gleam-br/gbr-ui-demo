////
////
////

import gbr/ui/admin/sidebar
import gbr/ui/admin/sidebar/menu
import gbr/ui/svg/icons

pub fn sidebar(logo) {
  sidebar.new("sidebar-id")
  |> sidebar.logo(logo)
  |> sidebar.root(root_menus())
}

pub fn root_menus() {
  [
    menu.new("menu-id-root")
      |> menu.title("Menu 01")
      |> menu.inner([
        menu.new("menu-id-01-A")
          |> menu.title("Menu 01 A")
          |> menu.icon(icons.form),
        menu.new("menu-id-01-B")
          |> menu.title("Menu 01 B")
          |> menu.icon(icons.ai_assistent)
          |> menu.inner([
            menu.new("menu-id-01-B-a")
              |> menu.title("Menu 01 B a"),
            menu.new("menu-id-01-B-b")
              |> menu.title("Menu 01 B b"),
            menu.new("menu-id-01-B-c")
              |> menu.title("Menu 01 B c")
              |> menu.icon(icons.calendar)
              |> menu.inner([
                menu.new("menu-id-01-B-c--1")
                  |> menu.title("Menu 01 B c 01"),
                menu.new("menu-id-01-B-c--2")
                  |> menu.title("Menu 01 B c 02")
                  |> menu.icon(icons.sun)
                  |> menu.inner([
                    menu.new("menu-id-01-B-c--2---1")
                      |> menu.title("Menu 01 B c 01 001"),
                    menu.new("menu-id-01-B-c--2---2")
                      |> menu.title("Menu 01 B c 01 002")
                      |> menu.icon(icons.cube),
                  ]),
              ]),
          ]),
      ]),
    menu.new("menu-id-02")
      |> menu.title("Menu 02")
      |> menu.inner([
        menu.new("menu-id-02-A")
        |> menu.title("Menu 02 A")
        |> menu.icon(icons.copy),
      ]),
    menu.new("menu-id-03")
      |> menu.title("Menu 03")
      |> menu.inner([
        menu.new("menu-id-03-A")
          |> menu.title("Menu 03 A")
          |> menu.icon(icons.search),

        menu.new("menu-id-03-B")
          |> menu.title("Menu 03 B")
          |> menu.icon(icons.support)
          |> menu.inner([
            menu.new("menu-id-03-A-1")
              |> menu.title("Menu 03 A 01"),
            menu.new("menu-id-03-B-1")
              |> menu.title("Menu 03 B 01")
              |> menu.icon(icons.moon)
              |> menu.inner([
                menu.new("menu-id-03-B-a")
                  |> menu.title("Menu 03 B a"),
                menu.new("menu-id-03-B-b")
                  |> menu.title("Menu 03 B b"),
                menu.new("menu-id-03-B-c")
                  |> menu.title("Menu 03 B c")
                  |> menu.inner([
                    menu.new("menu-id-03-B-c--1")
                      |> menu.title("Menu 03 B c 01"),
                    menu.new("menu-id-03-B-c--2")
                      |> menu.title("Menu 03 B c 02")
                      |> menu.inner([
                        menu.new("menu-id-03-B-c--2---1")
                          |> menu.title("Menu 03 B c 01 001"),
                        menu.new("menu-id-03-B-c--2---2")
                          |> menu.title("Menu 03 B c 01 002"),
                      ]),
                  ]),
              ]),
          ]),
      ]),
  ]
}
