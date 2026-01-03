<template>
  <div class="flex items-start gap-4 max-w-3xl">
    <img :src="avatar" :alt="author" class="w-25 h-25 rounded-full object-cover" />
    <div class="flex flex-col border-l-4 border-gray-500 bg-gray-100 p-4">
      <p class="italic mono-text">
        «{{ text }}»
      </p>
      <span class="mt-2 font-semibold text-gray-800">{{ author }}</span>
      <span class="text-sm text-gray-400" v-if="source">
        {{ type }} 
        <a v-if="sourceUrl" :href="sourceUrl" class="text-gray-500 hover:text-gray-800">{{ source }}</a>
        <span v-else>{{ source }}</span>, {{ year }}
      </span>
    </div>
  </div>
</template>

<script setup>
defineProps({
  text: { type: String, required: true },
  author: { type: String, required: true },
  source: { type: String, default: '' },
  sourceUrl: { type: String, default: '' },
  year: { type: String, default: '' },
  type: { type: String, default: 'Essay' },
  avatar: { type: String, default: '' }
})
</script>

