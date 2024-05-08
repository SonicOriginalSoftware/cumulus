<script>
  import { enhance } from "$app/forms"
  import Select from "$lib/components/select.svelte"

  let options = [
    { id: "reason", label: "Reason", disabled: true },
    { id: "consult", label: "Consult" },
    { id: "sos", label: "SOS" },
    { id: "cumulus", label: "Cumulus" },
    { id: "jobs", label: "Jobs", disabled: true },
    { id: "other", label: "Other" },
  ]

  const phone_pattern = "[0-9]{3}[-| ][0-9]{3}[-| ][0-9]{4}"
</script>

<form method="post" use:enhance>
  <input type="textbox" placeholder="Your Name" name="name" autocomplete="name" required />
  <input type="textbox" placeholder="Org Name" name="company" autocomplete="organization" />

  <input
    type="email"
    autocomplete="email"
    name="email"
    placeholder="you@org.com"
    pattern=".+@.+\..+"
  />

  <input
    type="tel"
    autocomplete="tel"
    name="tel"
    placeholder="555-456-7890"
    pattern={phone_pattern}
  />

  <Select {options} />

  <input class="ripple button press" type="reset" />
  <input class="ripple button press" type="submit" />
</form>

<style>
  @media only screen and (min-width: 640px) {
    /* form { */
    /* justify-content: space-evenly; */
    /* } */
  }

  form {
    display: flex;
    flex-direction: column;
    gap: 20px;
    height: 100%;
  }

  input[type="textbox"],
  input[type="tel"],
  input[type="email"] {
    box-shadow: none;
  }

  input {
    appearance: none;
    outline: none;
    padding: 8px 12px;
    border: solid 1px var(--section-border-color);
    border-radius: 0.25em;
    text-align: center;
  }
  input:invalid {
    border-color: red;
  }

  input::placeholder {
    opacity: 0.8;
  }
  input:required::placeholder {
    color: red;
  }

  input[type="submit"],
  input[type="reset"] {
    border: solid 0px;
    border-radius: 0;
  }
  input[type="reset"] {
    cursor: pointer;
  }

  form:invalid input[type="submit"] {
    opacity: 0.6;
    cursor: not-allowed;
  }
  form:valid input[type="submit"] {
    cursor: pointer;
    opacity: 1;
  }
</style>
