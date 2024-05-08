/** @type {import('./$types').Actions} */
export const actions = {
  default: async (event) => {
    const form_data = await event.request.formData()
    console.log(form_data)
  }
}
