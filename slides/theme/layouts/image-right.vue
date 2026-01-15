<script setup lang="ts">
import { useAttrs, computed } from 'vue'
import { handleBackground } from '../layoutHelper'
import Footer from '../components/Footer.vue'

const props = defineProps({
  image: {
    type: String,
  },
  class: {
    type: String,
  },
})

const attrs = useAttrs()

const backgroundPosition = computed(
  () => attrs['background-position'] ?? 'left'
)


const hasShadow = computed(() => !!attrs['shadow'])

const style = computed(() => {
  const baseStyle = handleBackground(
    props.image, 
    false, 
    backgroundPosition.value
  )

  if (hasShadow.value) {
    return {
      ...baseStyle,
      boxShadow: '10px 0 20px rgba(0,0,0,0.3)'
    }
  }

  return baseStyle
})
</script>

<template>
  <div class="grid grid-cols-2 w-full h-full auto-rows-fr">
    <div class="slidev-layout image-right" :class="props.class">
      <slot />
      <Footer :date="date" hide-date hide-logos />
    </div>
    <div class="w-full h-full" :style="style" />
  </div>
</template>

