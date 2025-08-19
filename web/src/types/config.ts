export interface Config {
  framework: string
  commands: {
    hide: string
    show: string
  }
  features: {
    hunger: boolean
    thirst: boolean
    armour: boolean
    stamina: boolean
  }
}
