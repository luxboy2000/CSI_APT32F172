##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=DRV_TEST
ConfigurationName      :=BuildSet
WorkspacePath          :=G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/
ProjectPath            :=G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST/
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=luxiang
Date                   :=23/09/2019
CDKPath                :=F:/Appl/C-Sky/CDK
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elf-size
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
ObjectsFileList        :="DRV_TEST.txt"
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck801  -nostartfiles -Wl,--gc-sections  -T"G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST/ckcpu.ld"
IncludeCPath           :=$(IncludeSwitch)"$(CDKPath)/CSKY/csi/csi_core/csi_cdk/" $(IncludeSwitch)"$(CDKPath)/CSKY/csi/csi_core/include/" $(IncludeSwitch)"$(CDKPath)/CSKY/csi/csi_driver/include/" $(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)/../../../Source/csi_core/include" $(IncludeSwitch)"$(ProjectPath)/../../../Source/csi_driver/drv/include" $(IncludeSwitch)"$(ProjectPath)/../../../Source/csi_driver/include" $(IncludeSwitch)"$(ProjectPath)//config" 
IncludeAPath           :=$(IncludeSwitch)"$(CDKPath)/CSKY/csi/csi_core/csi_cdk/" -Wa,$(IncludeSwitch)"$(CDKPath)/CSKY/csi/csi_core/csi_cdk/" $(IncludeSwitch)"$(CDKPath)/CSKY/csi/csi_core/include/" -Wa,$(IncludeSwitch)"$(CDKPath)/CSKY/csi/csi_core/include/" $(IncludeSwitch)"$(ProjectPath)/../../../Source/csi_driver/drv/include" -Wa,$(IncludeSwitch)"$(ProjectPath)/../../../Source/csi_driver/drv/include" $(IncludeSwitch)"$(ProjectPath)/../../../Source/csi_driver/include" -Wa,$(IncludeSwitch)"$(ProjectPath)/../../../Source/csi_driver/include" $(IncludeSwitch)"$(ProjectPath)//config" -Wa,$(IncludeSwitch)"$(ProjectPath)//config" 
Libs                   :=
ArLibs                 := 
LibPath                :=

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
CXXFLAGS := -mcpu=ck801  -melrw    -O0  -g3  -Wall  
CFLAGS   := -mcpu=ck801  -melrw    -O0  -g3  -Wall  
ASFLAGS  := -mcpu=ck801  -melrw    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/drv_devices$(ObjectSuffix) $(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) $(IntermediateDirectory)/drv_isr$(ObjectSuffix) $(IntermediateDirectory)/drv_lib$(ObjectSuffix) $(IntermediateDirectory)/drv_startup$(ObjectSuffix) $(IntermediateDirectory)/drv_system$(ObjectSuffix) $(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) $(IntermediateDirectory)/drv_vectors$(ObjectSuffix) $(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) \
	$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PostBuild MakeIntermediateDirs
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@echo "" > $(IntermediateDirectory)/.d
	@touch  $(ObjectsFileList)
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo linking...
	@$(LinkerName) $(OutputSwitch)"$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" $(LinkerNameoption) -Wl,--callgraph_file="$(ProjectPath)/Lst/$(OutputFile).htm" -Wl,--ckmap="$(ProjectPath)/Lst/$(OutputFile).map"  @$(ObjectsFileList)  $(LibPath) $(Libs)  -Wl,--whole-archive  -Wl,--no-whole-archive $(LinkOptions)
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


PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST/main.c  Lst/main$(PreprocessSuffix)
	@echo compiling main.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of main.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/main$(ObjectSuffix) > Lst/main$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST/main.c"

Lst/main$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST/main.c
	@echo generating preprocess file of main.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Example/Example/DRV_TEST/main.c"

$(IntermediateDirectory)/drv_devices$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/devices.c  Lst/drv_devices$(PreprocessSuffix)
	@echo compiling devices.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/devices.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_devices$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of devices.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_devices$(ObjectSuffix) > Lst/drv_devices$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/drv_devices$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_devices$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/devices.c"

Lst/drv_devices$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/devices.c
	@echo generating preprocess file of devices.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_devices$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/devices.c"

$(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/dw_syscon.c  Lst/drv_dw_syscon$(PreprocessSuffix)
	@echo compiling dw_syscon.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/dw_syscon.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of dw_syscon.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) > Lst/drv_dw_syscon$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/drv_dw_syscon$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_dw_syscon$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/dw_syscon.c"

Lst/drv_dw_syscon$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/dw_syscon.c
	@echo generating preprocess file of dw_syscon.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_dw_syscon$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/dw_syscon.c"

$(IntermediateDirectory)/drv_isr$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/isr.c  Lst/drv_isr$(PreprocessSuffix)
	@echo compiling isr.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/isr.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_isr$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of isr.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_isr$(ObjectSuffix) > Lst/drv_isr$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/drv_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_isr$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/isr.c"

Lst/drv_isr$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/isr.c
	@echo generating preprocess file of isr.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_isr$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/isr.c"

$(IntermediateDirectory)/drv_lib$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/lib.c  Lst/drv_lib$(PreprocessSuffix)
	@echo compiling lib.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/lib.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_lib$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of lib.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_lib$(ObjectSuffix) > Lst/drv_lib$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/drv_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_lib$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/lib.c"

Lst/drv_lib$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/lib.c
	@echo generating preprocess file of lib.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_lib$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/lib.c"

$(IntermediateDirectory)/drv_startup$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/startup.S  Lst/drv_startup$(PreprocessSuffix)
	@echo assembling startup.S...
	@$(AS) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/startup.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_startup$(ObjectSuffix) $(IncludeAPath)
	@echo generating disassembly file of startup.S...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_startup$(ObjectSuffix) > Lst/drv_startup$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/drv_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_startup$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/startup.S"

Lst/drv_startup$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/startup.S
	@echo generating preprocess file of startup.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_startup$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/startup.S"

$(IntermediateDirectory)/drv_system$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/system.c  Lst/drv_system$(PreprocessSuffix)
	@echo compiling system.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/system.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_system$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of system.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_system$(ObjectSuffix) > Lst/drv_system$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/drv_system$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_system$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/system.c"

Lst/drv_system$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/system.c
	@echo generating preprocess file of system.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_system$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/system.c"

$(IntermediateDirectory)/drv_trap_c$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/trap_c.c  Lst/drv_trap_c$(PreprocessSuffix)
	@echo compiling trap_c.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/trap_c.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of trap_c.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) > Lst/drv_trap_c$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/drv_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_trap_c$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/trap_c.c"

Lst/drv_trap_c$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/trap_c.c
	@echo generating preprocess file of trap_c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_trap_c$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/trap_c.c"

$(IntermediateDirectory)/drv_vectors$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/vectors.S  Lst/drv_vectors$(PreprocessSuffix)
	@echo assembling vectors.S...
	@$(AS) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/vectors.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_vectors$(ObjectSuffix) $(IncludeAPath)
	@echo generating disassembly file of vectors.S...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_vectors$(ObjectSuffix) > Lst/drv_vectors$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/drv_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_vectors$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/vectors.S"

Lst/drv_vectors$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/vectors.S
	@echo generating preprocess file of vectors.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_vectors$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/vectors.S"

$(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/minilibc_port.c  Lst/drv_minilibc_port$(PreprocessSuffix)
	@echo compiling minilibc_port.c...
	@$(CC) $(SourceSwitch) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/minilibc_port.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) $(IncludeCPath)
	@echo generating disassembly file of minilibc_port.c...
	@$(OBJDUMP) -S $(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) > Lst/drv_minilibc_port$(DisassemSuffix)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/drv_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/drv_minilibc_port$(DependSuffix) -MM "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/minilibc_port.c"

Lst/drv_minilibc_port$(PreprocessSuffix): G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/minilibc_port.c
	@echo generating preprocess file of minilibc_port.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drv_minilibc_port$(PreprocessSuffix) "G:/SW_HOME/CSKY/CSI/APT32F172A/drv/Source/csi_driver/drv/minilibc_port.c"


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
	@rm -rf $(IntermediateDirectory)/ $(ObjectsFileList) DRV_TEST.mk Lst/

clean_internal:
	@rm -rf $(IntermediateDirectory)/*.o $(IntermediateDirectory)/.d $(IntermediateDirectory)/*.d $(IntermediateDirectory)/*.a $(IntermediateDirectory)/*.elf $(IntermediateDirectory)/*.ihex Lst/

