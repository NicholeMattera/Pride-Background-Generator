<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    aria-labelledby="title"
    :height="height"
    role="img"
    viewBox="0 0 448 512"
    :width="width">
    <!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
    <title id="title">{{ label }}</title>
    <path
      d="M432 256C432 269.3 421.3 280 408 280h-160v160c0 13.25-10.75 24.01-24 24.01S200 453.3 200 440v-160h-160c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h160v-160c0-13.25 10.75-23.99 24-23.99S248 58.75 248 72v160h160C421.3 232 432 242.8 432 256z"
      :fill="color"
      role="presentation" />
  </svg>
</template>

<script setup>
  import { defineProps } from 'vue'

  defineProps({
    color: String,
    height: String,
    label: String,
    width: String,
  })
</script>
