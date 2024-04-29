/** @type {import("$lib/types.js").NavSection[]} */
export const nav_sections = [
  {
    section_name: "Company",
    routes: [
      {
        href: "/",
        content: "Home",
        class_list: "ripple",
      },
      {
        href: "/about",
        content: "About",
        class_list: "ripple",
      },
      {
        href: "/contact",
        content: "Contact",
        class_list: "ripple",
      },
    ],
  },
  {
    section_name: "Cumulus",
    routes: [
      {
        href: "/code",
        content: "Code",
        class_list: "ripple",
      },
    ],
  },
]
