<script setup lang="ts">
import type { PlayerStatus, VehicleState } from '../types'

defineProps<{
  status: PlayerStatus
  vehicleState: VehicleState
}>()
</script>

<template>
  <div class="fixed bottom-10 space-y-2.5 transition-all duration-500 ease-in-out"
       :class="vehicleState.isInVehicle ? 'left-hud-left-vehicle 2k:left-hud-left-vehicle-2k 4k:left-hud-left-vehicle-4k' : 'left-hud-left 2k:left-hud-left-2k 4k:left-hud-left-4k'">
    <div class="w-[28px] h-[28px] rounded-lg border border-gray-800/60 bg-gray-900/40 flex items-center justify-center overflow-hidden relative shadow-lg">
      <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-red-500 to-red-600 transition-all duration-300" :style="{ height: `${status.health}%` }"></div>
      <div class="absolute top-0 left-0 right-0 bg-gray-800/40 transition-all duration-300" :style="{ height: `${100 - status.health}%` }"></div>
      <img src="/img/health.svg" class="w-4 h-4 relative z-10 drop-shadow-sm" alt="health" />
    </div>
    
    <Transition name="fade">
      <div v-if="status.armour > 0" class="w-[28px] h-[28px] rounded-lg border border-gray-800/60 bg-gray-900/40 flex items-center justify-center overflow-hidden relative shadow-lg">
        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-purple-600 to-purple-700 transition-all duration-300" :style="{ height: `${status.armour}%` }"></div>
        <div class="absolute top-0 left-0 right-0 bg-gray-800/40 transition-all duration-300" :style="{ height: `${100 - status.armour}%` }"></div>
        <img src="/img/armour.svg" class="w-4 h-4 relative z-10 drop-shadow-sm" alt="armour" />
      </div>
    </Transition>
    
    <div class="w-[28px] h-[28px] rounded-lg border border-gray-800/60 bg-gray-900/40 flex items-center justify-center overflow-hidden relative shadow-lg">
      <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-orange-500 to-orange-600 transition-all duration-300" :style="{ height: `${status.hunger}%` }"></div>
      <div class="absolute top-0 left-0 right-0 bg-gray-800/40 transition-all duration-300" :style="{ height: `${100 - status.hunger}%` }"></div>
      <img src="/img/hunger.svg" class="w-4 h-4 relative z-10 drop-shadow-sm" alt="hunger" />
    </div>
    
    <div class="w-[28px] h-[28px] rounded-lg border border-gray-800/60 bg-gray-900/40 flex items-center justify-center overflow-hidden relative shadow-lg">
      <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-blue-400 to-blue-500 transition-all duration-300" :style="{ height: `${status.thirst}%` }"></div>
      <div class="absolute top-0 left-0 right-0 bg-gray-800/40 transition-all duration-300" :style="{ height: `${100 - status.thirst}%` }"></div>
      <img src="/img/thirst.svg" class="w-4 h-4 relative z-10 drop-shadow-sm" alt="thirst" />
    </div>
    
    <div class="w-[28px] h-[28px] rounded-lg border border-gray-800/60 bg-gray-900/40 flex items-center justify-center overflow-hidden relative shadow-lg">
      <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-yellow-500 to-yellow-600 transition-all duration-300" :style="{ height: `${status.stamina}%` }"></div>
      <div class="absolute top-0 left-0 right-0 bg-gray-800/40 transition-all duration-300" :style="{ height: `${100 - status.stamina}%` }"></div>
      <img src="/img/stamina.svg" class="w-4 h-4 relative z-10 drop-shadow-sm" alt="stamina" />
    </div>
  </div>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: all 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>
