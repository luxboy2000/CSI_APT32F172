##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=driver
ConfigurationName      :=BuildSet
WorkspacePath          :=G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Example/testevn/
ProjectPath            :=G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Example/testevn/driver/
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=luxiang
Date                   :=28/11/2019
CDKPath                :=F:/Appl/C-Sky/CDK/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="driver.txt"
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=e801  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/ckcpu.ld"
LinkOtherFlagsOption   :=
IncludePackagePath     :=
IncludeCPath           :=$(IncludePackagePath) $(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)../../../Source/libs/include" $(IncludeSwitch)G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source $(IncludeSwitch)G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_core/include $(IncludeSwitch)G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/include $(IncludeSwitch)G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/include $(IncludeSwitch)G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/include 
IncludeAPath           :=$(IncludePackagePath) $(IncludeSwitch)"$(ProjectPath)" -Wa,$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/csi_core/include" -Wa,$(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/csi_core/include" $(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/csi_driver/drv/include" -Wa,$(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/csi_driver/drv/include" $(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/csi_driver/include" -Wa,$(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/csi_driver/include" $(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/libs/include" -Wa,$(IncludeSwitch)"$(ProjectPath)../../../CSI_APT32F172/Source/libs/include" $(IncludeSwitch)"$(ProjectPath)../../../Source/libs/include" -Wa,$(IncludeSwitch)"$(ProjectPath)../../../Source/libs/include" $(IncludeSwitch)G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source -Wa,$(IncludeSwitch)G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source 
Libs                   := -Wl,--start-group   -Wl,--end-group 
ArLibs                 := 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch) "$(ProjectPath)$(IntermediateDirectory)"  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=e801    -O0  -g3  -Wall   
CFLAGS   := -mcpu=e801    -O0  -g3  -Wall   
ASFLAGS  := -mcpu=e801    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/drv_devices$(ObjectSuffix) $(IntermediateDirectory)/drv_dw_gpio$(ObjectSuffix) $(IntermediateDirectory)/drv_dw_ifc$(ObjectSuffix) $(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) $(IntermediateDirectory)/drv_isr$(ObjectSuffix) $(IntermediateDirectory)/drv_lib$(ObjectSuffix) $(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) $(IntermediateDirectory)/drv_startup$(ObjectSuffix) $(IntermediateDirectory)/drv_system$(ObjectSuffix) \
	$(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) $(IntermediateDirectory)/drv_vectors$(ObjectSuffix) $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) \
	$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean MakeIntermediateDirs
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@echo "" > $(IntermediateDirectory)/.d
	@touch  $(ObjectsFileList)
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo linking...
	@$(LinkerName) $(OutputSwitch)"$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" $(LinkerNameoption) -Wl,--callgraph_file="$(ProjectPath)/Lst/$(OutputFile).htm" -Wl,--ckmap="$(ProjectPath)/Lst/$(OutputFile).map"  @$(ObjectsFileList)  -Wl,--whole-archive  -Wl,--no-whole-archive $(LinkOptions) $(LibPath) $(Libs) $(LinkOtherFlagsOption)
	@mv "$(ProjectPath)/Lst/$(OutputFile).map" "$(ProjectPath)/Lst/$(OutputFile).temp" && $(READELF) $(ElfInfoSwitch) "$(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix)" > "$(ProjectPath)/Lst/$(OutputFile).map" && echo ====================================================================== >> "$(ProjectPath)/Lst/$(OutputFile).map" && cat "$(ProjectPath)/Lst/$(OutputFile).temp" >> "$(ProjectPath)/Lst/$(OutputFile).map" && rm -rf "$(ProjectPath)/Lst/$(OutputFile).temp"
	@echo generating asm file...
	@$(OBJDUMP) $(ObjdumpSwitch) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)"  > "$(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix)" 
	@echo size of target:
	@$(SIZE) "$(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	@echo -n "checksum value of target:  "
	@$(CHECKSUM) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	
MakeIntermediateDirs:
	@test -d Obj || $(MakeDirCommand) Obj

	@test -d Lst || $(MakeDirCommand) Lst

$(IntermediateDirectory)/.d:
	@test -d Obj || $(MakeDirCommand) Obj
	@test -d Lst || $(MakeDirCommand) Lst



##
## Objects
##
$(IntermediateDirectory)/main$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Example/testevn/driver/main.c  Lst/main$(PreprocessSuffix)
	@echo compiling main.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Example/testevn/driver/main.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of main.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/main$(ObjectSuffix) > Lst/main$(DisassemSuffix)
Lst/main$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Example/testevn/driver/main.c
	@echo generating preprocess file of main.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Example/testevn/driver/main.c"

$(IntermediateDirectory)/drv_devices$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/devices.c  Lst/drv_devices$(PreprocessSuffix)
	@echo compiling devices.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/devices.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_devices$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_devices$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_devices$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of devices.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_devices$(ObjectSuffix) > Lst/drv_devices$(DisassemSuffix)
Lst/drv_devices$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/devices.c
	@echo generating preprocess file of devices.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_devices$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/devices.c"

$(IntermediateDirectory)/drv_dw_gpio$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_gpio.c  Lst/drv_dw_gpio$(PreprocessSuffix)
	@echo compiling dw_gpio.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_gpio.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_dw_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_dw_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_dw_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of dw_gpio.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_dw_gpio$(ObjectSuffix) > Lst/drv_dw_gpio$(DisassemSuffix)
Lst/drv_dw_gpio$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_gpio.c
	@echo generating preprocess file of dw_gpio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_dw_gpio$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_gpio.c"

$(IntermediateDirectory)/drv_dw_ifc$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_ifc.c  Lst/drv_dw_ifc$(PreprocessSuffix)
	@echo compiling dw_ifc.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_ifc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_dw_ifc$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_dw_ifc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_dw_ifc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of dw_ifc.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_dw_ifc$(ObjectSuffix) > Lst/drv_dw_ifc$(DisassemSuffix)
Lst/drv_dw_ifc$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_ifc.c
	@echo generating preprocess file of dw_ifc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_dw_ifc$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_ifc.c"

$(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_syscon.c  Lst/drv_dw_syscon$(PreprocessSuffix)
	@echo compiling dw_syscon.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_syscon.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_dw_syscon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of dw_syscon.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) > Lst/drv_dw_syscon$(DisassemSuffix)
Lst/drv_dw_syscon$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_syscon.c
	@echo generating preprocess file of dw_syscon.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_dw_syscon$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/dw_syscon.c"

$(IntermediateDirectory)/drv_isr$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/isr.c  Lst/drv_isr$(PreprocessSuffix)
	@echo compiling isr.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/isr.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_isr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_isr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of isr.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_isr$(ObjectSuffix) > Lst/drv_isr$(DisassemSuffix)
Lst/drv_isr$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/isr.c
	@echo generating preprocess file of isr.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_isr$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/isr.c"

$(IntermediateDirectory)/drv_lib$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/lib.c  Lst/drv_lib$(PreprocessSuffix)
	@echo compiling lib.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/lib.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_lib$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_lib$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of lib.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_lib$(ObjectSuffix) > Lst/drv_lib$(DisassemSuffix)
Lst/drv_lib$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/lib.c
	@echo generating preprocess file of lib.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_lib$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/lib.c"

$(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/minilibc_port.c  Lst/drv_minilibc_port$(PreprocessSuffix)
	@echo compiling minilibc_port.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/minilibc_port.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_minilibc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of minilibc_port.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) > Lst/drv_minilibc_port$(DisassemSuffix)
Lst/drv_minilibc_port$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/minilibc_port.c
	@echo generating preprocess file of minilibc_port.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_minilibc_port$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/minilibc_port.c"

$(IntermediateDirectory)/drv_startup$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/startup.S  Lst/drv_startup$(PreprocessSuffix)
	@echo assembling startup.S...
	@$(AS) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/startup.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
	@echo generating disassembly file of startup.S...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_startup$(ObjectSuffix) > Lst/drv_startup$(DisassemSuffix)
Lst/drv_startup$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/startup.S
	@echo generating preprocess file of startup.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_startup$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/startup.S"

$(IntermediateDirectory)/drv_system$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/system.c  Lst/drv_system$(PreprocessSuffix)
	@echo compiling system.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/system.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_system$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of system.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_system$(ObjectSuffix) > Lst/drv_system$(DisassemSuffix)
Lst/drv_system$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/system.c
	@echo generating preprocess file of system.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_system$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/system.c"

$(IntermediateDirectory)/drv_trap_c$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/trap_c.c  Lst/drv_trap_c$(PreprocessSuffix)
	@echo compiling trap_c.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/trap_c.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of trap_c.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) > Lst/drv_trap_c$(DisassemSuffix)
Lst/drv_trap_c$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/trap_c.c
	@echo generating preprocess file of trap_c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_trap_c$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/trap_c.c"

$(IntermediateDirectory)/drv_vectors$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/vectors.S  Lst/drv_vectors$(PreprocessSuffix)
	@echo assembling vectors.S...
	@$(AS) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/vectors.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drv_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drv_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
	@echo generating disassembly file of vectors.S...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_vectors$(ObjectSuffix) > Lst/drv_vectors$(DisassemSuffix)
Lst/drv_vectors$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/vectors.S
	@echo generating preprocess file of vectors.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_vectors$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/csi_driver/drv/vectors.S"

$(IntermediateDirectory)/libc_malloc$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/libc/malloc.c  Lst/libc_malloc$(PreprocessSuffix)
	@echo compiling malloc.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/libc/malloc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of malloc.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) > Lst/libc_malloc$(DisassemSuffix)
Lst/libc_malloc$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/libc/malloc.c
	@echo generating preprocess file of malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_malloc$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/libc/malloc.c"

$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_addlast.c  Lst/mm_dq_addlast$(PreprocessSuffix)
	@echo compiling dq_addlast.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_addlast.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_addlast$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of dq_addlast.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) > Lst/mm_dq_addlast$(DisassemSuffix)
Lst/mm_dq_addlast$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_addlast.c
	@echo generating preprocess file of dq_addlast.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_addlast$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_addlast.c"

$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_rem.c  Lst/mm_dq_rem$(PreprocessSuffix)
	@echo compiling dq_rem.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_rem.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_rem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of dq_rem.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) > Lst/mm_dq_rem$(DisassemSuffix)
Lst/mm_dq_rem$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_rem.c
	@echo generating preprocess file of dq_rem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_rem$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/dq_rem.c"

$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/lib_mallinfo.c  Lst/mm_lib_mallinfo$(PreprocessSuffix)
	@echo compiling lib_mallinfo.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/lib_mallinfo.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_lib_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of lib_mallinfo.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) > Lst/mm_lib_mallinfo$(DisassemSuffix)
Lst/mm_lib_mallinfo$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/lib_mallinfo.c
	@echo generating preprocess file of lib_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_lib_mallinfo$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/lib_mallinfo.c"

$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_addfreechunk.c  Lst/mm_mm_addfreechunk$(PreprocessSuffix)
	@echo compiling mm_addfreechunk.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_addfreechunk.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_addfreechunk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of mm_addfreechunk.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) > Lst/mm_mm_addfreechunk$(DisassemSuffix)
Lst/mm_mm_addfreechunk$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_addfreechunk.c
	@echo generating preprocess file of mm_addfreechunk.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_addfreechunk$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_addfreechunk.c"

$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_free.c  Lst/mm_mm_free$(PreprocessSuffix)
	@echo compiling mm_free.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_free.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_free$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of mm_free.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) > Lst/mm_mm_free$(DisassemSuffix)
Lst/mm_mm_free$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_free.c
	@echo generating preprocess file of mm_free.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_free$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_free.c"

$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_initialize.c  Lst/mm_mm_initialize$(PreprocessSuffix)
	@echo compiling mm_initialize.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_initialize.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_initialize$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of mm_initialize.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) > Lst/mm_mm_initialize$(DisassemSuffix)
Lst/mm_mm_initialize$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_initialize.c
	@echo generating preprocess file of mm_initialize.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_initialize$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_initialize.c"

$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_leak.c  Lst/mm_mm_leak$(PreprocessSuffix)
	@echo compiling mm_leak.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_leak.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_leak$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of mm_leak.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) > Lst/mm_mm_leak$(DisassemSuffix)
Lst/mm_mm_leak$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_leak.c
	@echo generating preprocess file of mm_leak.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_leak$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_leak.c"

$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_mallinfo.c  Lst/mm_mm_mallinfo$(PreprocessSuffix)
	@echo compiling mm_mallinfo.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_mallinfo.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of mm_mallinfo.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) > Lst/mm_mm_mallinfo$(DisassemSuffix)
Lst/mm_mm_mallinfo$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_mallinfo.c
	@echo generating preprocess file of mm_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_mallinfo$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_mallinfo.c"

$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_malloc.c  Lst/mm_mm_malloc$(PreprocessSuffix)
	@echo compiling mm_malloc.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_malloc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of mm_malloc.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) > Lst/mm_mm_malloc$(DisassemSuffix)
Lst/mm_mm_malloc$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_malloc.c
	@echo generating preprocess file of mm_malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_malloc$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_malloc.c"

$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_size2ndx.c  Lst/mm_mm_size2ndx$(PreprocessSuffix)
	@echo compiling mm_size2ndx.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_size2ndx.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_size2ndx$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
	@echo generating disassembly file of mm_size2ndx.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) > Lst/mm_mm_size2ndx$(DisassemSuffix)
Lst/mm_mm_size2ndx$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_size2ndx.c
	@echo generating preprocess file of mm_size2ndx.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_size2ndx$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/CSI_APT32F172/Source/libs/mm/mm_size2ndx.c"


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) "$(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
	@rm -f $(IntermediateDirectory)/__rt_entry.S
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM "$(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S"

-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	@echo Cleaning target...
	@rm -rf $(IntermediateDirectory)/ $(ObjectsFileList) driver.mk Lst/

clean_internal:
	@rm -rf $(IntermediateDirectory)/*.o $(IntermediateDirectory)/.d $(IntermediateDirectory)/*.d $(IntermediateDirectory)/*.a $(IntermediateDirectory)/*.elf $(IntermediateDirectory)/*.ihex Lst/

