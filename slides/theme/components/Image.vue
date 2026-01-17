<script setup lang="ts">
import { computed } from "vue";
import { resolveAssetUrl } from "../layoutHelper";

const props = defineProps({
  src: { type: String, required: true },
  alt: { type: String, default: "" },
  class: { type: String, default: "" },
  style: { type: Object as () => Record<string, string>, default: () => ({}) },
});

const resolvedSrc = computed(() => resolveAssetUrl(props.src));
</script>

<template>
  <img :src="resolvedSrc" :alt="alt" :class="class" :style="style" />
</template>
