<script>
  import { base } from "$app/paths"

  import Select from "$lib/components/select.svelte"

  /** @type {HTMLFormElement} */
  let formElement = $state(null)
  /** @type {HTMLInputElement} */
  let emailElement = $state(null)

  const phonePattern = "[0-9]{3}-{0-9]{3}-[0-9]{4}"
  const worker_domain = base === "localhost" ? `${base}:8787` : "worker.sonicoriginal.software"

  async function checkEmail() {
    const email = emailElement.value
    if (email === "") return

    let response
    try {
      response = await fetch(`${location.protocol}//${worker_domain}?email=${email}`)
    } catch (fetch_error) {
      alert(fetch_error)
      return
    }

    if (response.status !== 200) {
      alert(response.statusText)
      return
    }

    let result
    try {
      result = await response.json()
    } catch (json_error) {
      alert(json_error)
      return
    }

    if (result.error !== undefined) {
      alert(result.error)
    }

    const validity = result.entry !== null ? "E-mail address already signed up" : ""
    emailElement.setCustomValidity(validity)

    if (emailElement.reportValidity()) {
      document.querySelector("#submit").classList.add("ripple")
    }
  }

  /** @param {{ preventDefault: () => void; }} e */
  async function submit(e) {
    e.preventDefault()

    if (!formElement.checkValidity()) {
      return
    }

    const formData = new FormData(formElement)
    const json = JSON.stringify(Object.fromEntries(formData))
    console.log(json)

    let response
    try {
      response = await fetch(`${location.protocol}//${worker_domain}`, {
        method: "POST",
        body: json,
      })
    } catch (error) {
      alert(error)
      return
    }

    if (response.status !== 200) {
      alert(response.statusText)
      return
    }

    let result
    try {
      result = await response.json()
    } catch (json_error) {
      alert(json_error)
      return
    }

    if (result.error === undefined) {
      formElement.reset()
    } else {
      alert(result.error)
    }
  }
</script>

<form bind:this={formElement} class="scroller-target">
  <input
    type="textbox"
    placeholder="Required - Your Name"
    name="name"
    autocomplete="name"
    class="center-align-text"
    required
  />
  <input
    bind:this={emailElement}
    type="email"
    onchange={checkEmail}
    onfocusout={checkEmail}
    class="center-align-text"
    autocomplete="email"
    name="email"
    placeholder="Required - you@org.com"
    pattern=".+@.+\..+"
    required
  />
  <input
    type="textbox"
    class="center-align-text"
    placeholder="Org Name"
    name="company"
    autocomplete="organization"
  />
  <input
    type="tel"
    class="center-align-text"
    autocomplete="tel"
    name="tel"
    placeholder="555-456-7890"
    pattern={phonePattern}
  />

  <Select />

  <div id="buttons">
    <input class="ripple button press" type="reset" />
    <input
      onclick={submit}
      class="ripple button press"
      id="submit"
      type="submit"
      value="Get in Touch!"
    />
  </div>
</form>

<style>
  input[type="textbox"],
  input[type="tel"],
  input[type="email"] {
    box-shadow: none;
  }

  input {
    appearance: none;
    font-size: 3vh;
    outline: none;
    border-radius: 0.25em;
    border: solid 1px var(--section-border-color);
    padding: 8px 12px;
    margin: 20px 0;
    background-color: #99999944;
  }

  input::placeholder {
    text-align: center;
    font-size: 1rem;
  }
  input:required::placeholder {
    color: red;
  }

  #buttons {
    width: 100%;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
  }

  #submit,
  input[type="reset"] {
    border: solid 0px;
    border-radius: 0;
  }
  input[type="reset"] {
    background: #33994455;
    color: var(--light-text);
    cursor: pointer;
  }

  form:invalid #submit {
    opacity: 0.6;
    cursor: not-allowed;
  }
  form:valid #submit {
    cursor: pointer;
    opacity: 1;
  }
</style>
