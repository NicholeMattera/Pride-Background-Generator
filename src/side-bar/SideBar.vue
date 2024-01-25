<template>
  <div class="sidebar">
    <h1>
      <span>Settings</span>
      <icon-button label="View source code" type="secondary" @click="viewCode">
        <code-icon
          color="#FFF"
          height="16px"
          label="View source code"
          width="16px" />
      </icon-button>
    </h1>

    <div class="body">
      <image-settings @change="onFieldChanged" />

      <h2>
        <span>Flags</span>
        <icon-button label="Add flag" type="secondary" @click="addFlag">
          <add-icon color="#FFF" height="16px" label="Add flag" width="16px" />
        </icon-button>
      </h2>

      <div
        class="field flags"
        v-for="(flag, index) in settings.flags"
        :key="index">
        <flag-settings
          :index="index"
          :selected-flag-type-id="flag.id"
          @change="changedFlag"
          @remove="removeFlag(index)" />
      </div>
    </div>

    <div class="footer">
      <icon-button
        label="Save background"
        type="primary"
        @click="$emit('save')">
        <download-icon
          color="#FFF"
          height="16px"
          label="Save background"
          width="16px" />
      </icon-button>
    </div>
  </div>
</template>

<script setup>
  import { defineEmits, reactive } from 'vue'

  import AddIcon from '../components/AddIcon.vue'
  import CodeIcon from '../components/CodeIcon.vue'
  import DownloadIcon from '../components/DownloadIcon.vue'
  import IconButton from '../components/IconButton.vue'
  import FlagSettings from './components/FlagSettings.vue'
  import ImageSettings from './components/ImageSettings.vue'

  const emit = defineEmits(['change', 'save'])

  function viewCode() {
    window.open(
      'https://github.com/NicholeMattera/Pride-Background-Generator',
      '_blank'
    )
  }

  const settings = reactive({
    width: 0,
    height: 0,
    flags: [
      {
        id: '',
        label: '',
        bars: [],
      },
    ],
  })
  emit('change', settings)

  function onFieldChanged({ field, value }) {
    settings[field] = value
    emit('change', settings)
  }

  function addFlag() {
    settings.flags.push({
      id: '',
      label: '',
      bars: [],
    })
    emit('change', settings)
  }

  function changedFlag({ index, value }) {
    settings.flags[index] = value
    emit('change', settings)
  }

  function removeFlag(index) {
    settings.flags = settings.flags.filter((e, i) => i != index)
    emit('change', settings)
  }
</script>

<style scoped>
  .sidebar {
    box-shadow: 8px 0 16px 0 rgba(0, 0, 0, 0.5);
    display: flex;
    flex: 0 0 250px;
    flex-direction: column;
    z-index: 1;
  }

  h1 {
    align-items: center;
    background: #212121;
    border-bottom: 1px solid #c0c0c0;
    display: flex;
    margin: 0;
    padding: 8px;
  }

  h1 span {
    flex: 1 1 auto;
  }

  .body {
    flex: 1 1 auto;
    padding: 8px;
    overflow-y: auto;
  }

  h2 {
    display: flex;
    margin: 24px 0 16px;
  }

  h2 span {
    flex: 1 1 auto;
  }

  .field {
    margin: 16px 0 0;
  }

  .field label {
    margin-bottom: 8px;
    font-weight: 600;
  }

  .field input {
    box-sizing: border-box;
    width: 100%;
  }

  .flags {
    padding: 0 8px;
  }

  .footer {
    border-top: 1px solid #c0c0c0;
    display: flex;
    flex-direction: row-reverse;
    padding: 8px;
  }
</style>
